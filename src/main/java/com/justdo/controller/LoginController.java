package com.justdo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/*")
@AllArgsConstructor
public class LoginController {
	
	// 메인 로그인 페이지로 이동 //////////////////////////////////
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String mainLogin() {
		// 로그인 실패시 LoginFailureHandler 작동
		return "index";
	}
	// 메인 로그인 페이지로 이동 //
	
	// 서브 로그인 페이지로 이동 //////////////////////////////////
	@RequestMapping(value = "subLogin", method = RequestMethod.GET)
	public String subLogin() {
		return "/login/subLogin";
	}
	// 서브 로그인 페이지로 이동 //
	
	// 로그인 성공 - 목록 이동 //////////////////////////////////
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public String loginSuccess(HttpSession session, HttpServletRequest request) {
		log.warn("login controller - 로그인 > 목록 페이지로 접속");
		return "board/list";
	}
	// 로그인 성공 - 목록 이동 //
	
	// 권한 없음 페이지로 이동  ///////////////////////////////////
    @RequestMapping(value = "access_denied", method = RequestMethod.GET)
    public String accessDeniedPage() throws Exception {
        return "/login/access_denied";
    }

}
