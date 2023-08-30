package com.project.lotto;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {

	 @GetMapping("/")
	 public String getMain() {
		 return "/home/body";
	 }
	 
	 //메뉴
	 //복권정보
	 //당첨통계
	 //커뮤니티
	 //마이페이지
	 
	
}
