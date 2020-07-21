package com.justdo.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.justdo.domain.BoardVO;
import com.justdo.domain.Criteria;
import com.justdo.domain.PageDTO;
import com.justdo.security.CustomUserDetailsService;
import com.justdo.service.BoardService;
import com.justdo.service.myPageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	private myPageService myPageService;
	private CustomUserDetailsService loginService;
	
	@GetMapping("list")
	public void list(Criteria cri, Model model, Principal principal) {
		
		model.addAttribute("locationlist",service.getLocationList(cri));
		model.addAttribute("list",service.getList(cri));
		model.addAttribute("pageMaker",new PageDTO(cri,service.getTotal(cri)));

		// 로그인 확인 후 닉네임 넘기기
		if (principal != null) {
			String username = principal.getName();
			log.warn("로그인 했음!" + username);
			model.addAttribute("member", loginService.loadInfoByUsername(username));
			
		} else {
			log.warn("로그인 하지 않았음!");
		}
	}
	
	@GetMapping("BoardTabListAjax")
	@ResponseBody
	public ResponseEntity<List<BoardVO>> BoardTabListAjax(Criteria cri) {
		System.out.println("test......");
		System.out.println(cri.getCategory());
		System.out.println(cri.getGu());
		System.out.println(cri.getStartIndex());
		System.out.println(cri.getAmount());
		System.out.println("test......");
		return new ResponseEntity<List<BoardVO>>(service.getListWithPagingTabs(cri),HttpStatus.OK);
	}
	
	
	//ajax 토탈 개수 구하기
	@GetMapping("getTotalNumAjax")
	@ResponseBody
	public int getTotalNumAjax(Criteria cri) {
		return service.getTotal(cri);
	}
	
	// 등록화면
	@GetMapping("/register")
	public void register(@RequestParam("userid") String userid,Model model) {
		log.info("/register");
		model.addAttribute("userid", userid.toString());
	}
	
	// 등록처리
	@PostMapping("/register")
		public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register: " + board);
		System.out.println(board);
		service.register(board);
		
		rttr.addFlashAttribute("result",board.getBno());
		
		return "redirect:/board/list";
	};
	
	// 상세보기
	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/get");
		model.addAttribute("board", service.get(bno));
	}
	
	// 수정화면
	@GetMapping("/modify")
	public void modify(@RequestParam("bno") Long bno, Model model) {
		log.info("/modify");
		model.addAttribute("board", service.get(bno));
	}
		
	// 수정처리
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify : " + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
	//삭제
	@PostMapping("/remove")
	public String remoce(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove..."+ bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
}
