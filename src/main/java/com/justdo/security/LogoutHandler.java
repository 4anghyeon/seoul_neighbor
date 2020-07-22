package com.justdo.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class LogoutHandler implements LogoutSuccessHandler {@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		log.warn("logout handler - 로그아웃 시도");
		
		/* 권한이 있는 사용자만 로그아웃 처리 진행 */
		if (authentication != null) {
			String previous_page = request.getHeader("referer"); // 이전 페이지 받아오기(a, form으로 진입시에만 사용 가능)
			log.warn("logout handler - 현재 주소 : "+previous_page);
			
			String go_page = "/" + previous_page.replace("http://localhost:8081/", ""); //context path만 남김
			log.warn("logout handler - 이동할 경로 : "+go_page);
			
			response.sendRedirect(go_page);
		}
		
	}
}
