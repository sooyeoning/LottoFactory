package com.project.lotto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import user.UserServiceImpl;

@RestController
public class LoginRestController { // 웹브라우저의 요청을 전담하여 처리, service 호출

	@Autowired
	UserServiceImpl userservice; // serviceimpl

	// 로그인 - 아이디체크: 중복시 true 결과값 반환
	@RequestMapping(value="/idcheck.do", method = RequestMethod.POST)
	public String idcheck(String userid) {
		System.out.println("아이디 중복 체크 확인용: "+userid);
		
		String result = "false";
		
		if(userservice.checkId(userid)!=0) {
			System.out.println("아이디 중복된 행의 갯수: "+userservice.checkId(userid));
			result = "true";
		}
		
		return result;
	}
	
	// 로그인 - 닉네임체크: 중복시 true 결과값 반환
		@RequestMapping(value="/nickcheck.do", method = RequestMethod.POST)
		public String nickcheck(String nickname) {
			System.out.println("닉네임 중복 체크 확인용: "+nickname);
			
			String result = "false";
			
			if(userservice.checkNick(nickname)!=0) {
				System.out.println("닉네임 중복된 행의 갯수: "+userservice.checkNick(nickname));
				result = "true";
			}
			
			return result;
		}

}
