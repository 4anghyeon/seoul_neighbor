package com.justdo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.justdo.domain.MemberVO;
import com.justdo.service.commonService;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/*")
@AllArgsConstructor
public class CommonController {
	
	 private commonService service; 
	
	 // 로그인 ////////////////////////////////////
	@PostMapping("login")
	public String login(MemberVO vo,RedirectAttributes rttr) {
		
		try { 
			service.login(vo).getId();
			return "redirect:/board/list"; 
		}catch(Exception e) {
		  rttr.addFlashAttribute("result","fail");
		  return"redirect:/"; 
		  }
	}
	// 로그인 //
	
}
