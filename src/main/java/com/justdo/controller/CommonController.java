package com.justdo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.justdo.domain.MemberVO;
import com.justdo.service.commonService;
import com.justdo.service.myPageService;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/*")
@AllArgsConstructor
public class CommonController {
	
	 private commonService service;
	 private myPageService myPageService;
	// test //
	// 메인 이동 //////////////////////////////////
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	// 메인 이동 //
	 
	// 로그인 ////////////////////////////////////
	@PostMapping("login")
	public String login(Model model,MemberVO vo,RedirectAttributes rttr) {
		try { 
			vo = service.login(vo);
			rttr.addFlashAttribute("userid",vo.getUserid());
			return "redirect:/list";
		}catch(Exception e) {
			e.printStackTrace();
		  rttr.addFlashAttribute("result","fail");
		  return"redirect:/"; 
		  }
	}
	// 로그인 //
	
	
	// 목록 페이지 이동 //////////////////////////
	@GetMapping("list")
	public String list() {
		return "board/list";
	};
	// 목록 페이지 이동 //
	
	// 프로필 페이지 이동 ////////////////////////
	@GetMapping("profile")
	public String profile(Model model, MemberVO vo) {
		model.addAttribute("member", myPageService.selectUser("test")); //test -> 동적으로 바꿔야함
		return "mypage/profile";
	}
	// 프로필 페이지 이동 //
	
}
