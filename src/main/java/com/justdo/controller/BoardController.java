package com.justdo.controller;

import java.io.IOException;
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
import com.justdo.service.commonService;
import com.justdo.service.myPageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	private commonService commonService;
	private BoardService service;
	private CustomUserDetailsService loginService;
	private myPageService myPageService;
	
	@GetMapping("list")
	public void list(Criteria cri, Model model, Principal principal) {
		
		model.addAttribute("locationlist",service.getLocationList(cri));
		model.addAttribute("list",service.getList(cri));
		model.addAttribute("pageMaker",new PageDTO(cri,service.getTotal(cri)));

		try {
			String[] cultureInfo = commonService.getCulture();
			model.addAttribute("cultureTitle",cultureInfo[0]);
			model.addAttribute("cultureDate",cultureInfo[1]);
			model.addAttribute("culturePlace",cultureInfo[2]);
			model.addAttribute("cultureLink",cultureInfo[3]);
			model.addAttribute("cultureImg",cultureInfo[4]);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		// 로그인 확인 후 닉네임 넘기기
		if (principal != null) {
			String username = principal.getName();
			model.addAttribute("member", loginService.loadInfoByUsername(username));
			
			//날씨 정보 불러오는 구문 /////////////////////
			String weatherData[]=null;
			try {
				weatherData = commonService.getWeather(commonService.selectGuForWeather(principal.getName()));
			} catch (IOException e) {
				e.printStackTrace();
			}
			model.addAttribute("weather",weatherData[0]);
			model.addAttribute("temperature",weatherData[1]);
			model.addAttribute("weatherGu",weatherData[2]);
			
		} else {
			log.warn("로그인 하지 않았음!");
		}
	}
	
	@GetMapping("BoardTabListAjax")
	@ResponseBody
	public ResponseEntity<List<BoardVO>> BoardTabListAjax(Criteria cri,Model model) {
		System.out.println("test......");
		System.out.println(cri.getCategory());
		System.out.println(cri.getGu());
		System.out.println(cri.getStartIndex());
		System.out.println(cri.getAmount());
		System.out.println("test......");
		model.addAttribute("pageMaker",new PageDTO(cri,service.getTotal(cri)));
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
	public String register(@RequestParam("userid") String userid, Model model, Principal principal) {
		log.info("/register");
		if (principal != null) {
			String username = principal.getName();
			model.addAttribute("userid", userid.toString());
			model.addAttribute("member", myPageService.selectUser(username));
			return "/board/register";
		} else {
			return "/board/list";
		}
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
