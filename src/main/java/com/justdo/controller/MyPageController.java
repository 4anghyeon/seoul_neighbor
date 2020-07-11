package com.justdo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/*")
@AllArgsConstructor
public class MyPageController {
	
	@GetMapping("mylist")
	public String myList() {
		return "mypage/mylist";
	}
	
	@GetMapping("myMessage")
	public String myMessage() {
		return "mypage/myMessage";
	}
	
	@GetMapping("myQA")
	public String myQA() {
		return "mypage/myQA";
	}
	
	@GetMapping("myPassword")
	public String myPassword() {
		return "mypage/myPassword";
	}
}
