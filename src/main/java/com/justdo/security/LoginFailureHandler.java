package com.justdo.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginFailureHandler implements AuthenticationFailureHandler {
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		log.warn("로그인 실패");
		
		String loginId = request.getParameter("username"); // 사용자 아이디
		log.warn("접속 실패한 아이디 : " + loginId);
		
		String errorMessage = "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다."; 
		request.setAttribute("message", errorMessage); // 로그인 실패시 뜰 문구
		
		response.sendRedirect("/login?error=true");
	}

}
