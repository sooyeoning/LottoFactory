package com.project.lotto;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"user", "com.project.lotto"}) //com.project.lotto 추가시 jsp 활용 가능
//@Component, @Controller, @Service, @Repository 어노테이션을 붙인 클래스들이 빈으로 등록될 준비를 한것
//빈으로 등록될 준비를 마친 클래스들을 스캔하여 빈으로 등록해주는 것

@MapperScan(basePackages= "user")
public class LottoApplication {

	public static void main(String[] args) {
		SpringApplication.run(LottoApplication.class, args);
	}

}


