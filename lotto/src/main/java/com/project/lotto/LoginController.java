package com.project.lotto;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;
import user.UserDTO;
import user.UserServiceImpl;

@Controller
public class LoginController { // 웹브라우저의 요청을 전담하여 처리, service 호출

	@Autowired
	UserServiceImpl userservice; // serviceimpl

	@Autowired
	JavaMailSender mailSender;

	// 로그인
	@GetMapping("/login")
	public String login() {
		return "login/loginForm";
	}

	// 로그인
	@PostMapping("/login")
	@ResponseBody
	public String loginProcess(String userid, String userpw, HttpSession session) {

		String message = "";

		UserDTO userdto = userservice.getUserInfo(userid);

		if (userid.equals(userdto.getUserid()) && userpw.equals(userdto.getUserpw())) { // 로그인 성공
			session.setAttribute("userdto", userdto);
			message = "<script>alert('정상 로그인되었습니다.');location.href='/';</script>";
		}
		if (!userid.equals(userdto.getUserid())) { // 아이디 불일치
			message = "<script>alert('잘못된 아이디가 입력되었습니다.');location.href='/';</script>";
		}
		if (!userpw.equals(userdto.getUserpw())) { // 아이디 일치 & 비밀번호 불일치
			message = "<script>alert('잘못된 비밀번호가 입력되었습니다.');location.href='/';</script>";
		}
		return message; // 로그인불량
	}

	// 회원가입
	@GetMapping("/signup")
	public String signIn() {
		return "login/signupForm";
	}

	@PostMapping("/signup")
	@ResponseBody //responsebody 사용시 view 리턴 안하는 용도?
	public String signup(UserDTO userdto) {
		String message = "";
		if(userservice.getUserInfo(userdto.getUserid())==null) {//회원가입 가능한 사람
			userservice.insertUser(userdto);
			message = "<script>alert('회원가입이 완료되었습니다.');location.href='/login';</script>";
		} else {		
			message = "<script>alert('이미 가입된 회원입니다.');location.href='/login';</script>";
		}
		return message;
	}
	

	// 아이디 찾기
	@PostMapping("/findId")
	@ResponseBody
	public String findId(String name, String email) {
		String userid = "";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("name", name);
		
		userid = userservice.findId(map);
		
		String message = "";
		if(userid!="") {//회원가입 가능한 사람
			message = "<script>alert(사용자 아아디:'" + userid + "');location.href='/login';</script>";
		} else {		
			message = "<script>alert('회원가입되지 않은 회원입니다.');location.href='/signup';</script>";
		}
		return message; 
	}

	//비밀번호 찾기 - 메일로 임시 비밀번호 전달
	@ResponseBody
	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	public String findPw(String email, String name) {
		String response = "null";
		HashMap<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("name", name);

		if (userservice.checkPw(map) == 0) {
			response = "회원가입시 기입했던 이메일, 이름 다시 한번 확인하여 기입 바랍니다.";
		} else {
			String tempPw = "0"+tempPassword(6)+"!";
			String setFrom = "lottofactory77@gmail.com";
			String toMail = email;
			String title = "로또팩토리 임시 비밀번호입니다.";
			String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "비밀번호는 " + tempPw + "입니다.";

			try {
				jakarta.mail.internet.MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content, true);
				mailSender.send(message);

				HashMap<String, String> map2 = new HashMap<>();
				map2.put("userpw", tempPw);
				map2.put("userid", userservice.findId(map));
				userservice.updatePw(map2);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			response = "<script>alert('임시 비밀번호가 입력하신 이메일 주소로 전달되었습니다.');location.href='/login';</script>";
		}
		return response;
	}

	//임시 비밀번호 생성
	public String tempPassword(int leng){
		int index = 0;
		char[] charSet = new char[] {
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
				'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
		};	//배열안의 문자 숫자는 원하는대로

		StringBuffer password = new StringBuffer();
		Random random = new Random();

		for (int i = 0; i < leng ; i++) {
			double rd = random.nextDouble();
			index = (int) (charSet.length * rd);
			
			password.append(charSet[index]);
			
			System.out.println("index::" + index + "	charSet::"+ charSet[index]);
		}
		
		return password.toString(); 
	    //StringBuffer를 String으로 변환해서 return 하려면 toString()을 사용하면 된다.
	}
	//getmapping - 아이디찾기 ajax? 
	//postmapping - 아이디찾기 실제 수행
	
	
}
