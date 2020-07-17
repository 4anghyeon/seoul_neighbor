package com.justdo.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.justdo.domain.BoardVO;
import com.justdo.domain.MemberVO;
import com.justdo.service.commonService;
import com.justdo.service.myPageService;
import com.justdo.util.JoinValidator;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/*")
@AllArgsConstructor
public class CommonController {
	
	 private commonService service;
	 private myPageService myPageService;
	 private BCryptPasswordEncoder pwdEncoder;
	// test //
	// 메인 이동 //////////////////////////////////
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	// 메인 이동 //
	
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
	
	//bno로 상세페이지 부르기/////////////////////
	@GetMapping("read")
	public String read(@RequestParam("bno") int bno, Model model) {
		BoardVO vo=service.read(bno);
		model.addAttribute("board",vo);
		return "board/read";
	}
	//bno로 상세페이지 부르기  
	
	//좋아요+1 ////////////////////////////////
	@GetMapping(value="/read/plusLike/{bno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	   @ResponseBody
	   public ResponseEntity<String> plusLike(@PathVariable("bno") int bno) {
	      
	      String result = Integer.toString(service.likeBoard(bno));
	      return new ResponseEntity<String>(result, HttpStatus.OK);
	   }
	
	//좋아요+1 ////////////////////////////////

	//싫어요+1 ////////////////////////////////
	@GetMapping(value="/read/plusUnlike/{bno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	   @ResponseBody
	   public ResponseEntity<String> plusUnlike(@PathVariable("bno") int bno) {
	      
	      String result = Integer.toString(service.unlikeBoard(bno));
	      return new ResponseEntity<String>(result, HttpStatus.OK);
	   }
	//싫어요+1 ////////////////////////////////
	
	//회원가입 페이지 호출
	@GetMapping("join")
	public String joinForm() {
		System.out.println("회원가입페이지로 이동합니다.");
		return "joinpage/join";
	}
	
	//회원가입 진행
	@PostMapping("join")
	public String join(MemberVO vo, BindingResult result, RedirectAttributes rttr) {
		System.out.println("회원가입 처리 서비스를 호출합니다.");
		System.out.println("받은 회원 정보 : " + vo.toString());
		
		boolean isDuplicated = 
				service.isUniqueID(vo.getUserid()) && service.isUniqueNickName(vo.getNickname());
		System.out.println(isDuplicated);
		
		try {
			if(!isDuplicated) {
				System.out.println("아이디 or 닉네임 뭔가가 중복되었다");
				rttr.addFlashAttribute("warning", "아이디 혹은 닉네임이 중복되었습니다.");
				return "redirect:/join";
			} else {
				JoinValidator validator = new JoinValidator();
				validator.validate(vo, result);
				if(result.hasErrors()) {
					System.out.println("유호성검사 실패");
					rttr.addFlashAttribute("warning", "올바른 형식이 아닙니다.");
					return "redirect:/join";
				}
			}
			String encodedPassword = pwdEncoder.encode(vo.getUserpw());
			vo.setUserpw(encodedPassword);
			service.join(vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	
	//유저 ID 중복됬는지 체크
	@GetMapping(value="/checkId/{userId}",
			produces={MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> checkUserId(@PathVariable("userId") String userId){
		if(service.isUniqueID(userId)) {
			return new ResponseEntity<String>("new",HttpStatus.OK);
		}
		return new ResponseEntity<String>("duplicated",HttpStatus.OK);
	}
	
	//유저 닉네임 중복됬는지 체크
	@GetMapping(value="/checkNickName/{nickName}",
			produces={MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> checkNickName(@PathVariable("nickName") String nickName){
		if(service.isUniqueNickName(nickName)) {
			return new ResponseEntity<String>("new",HttpStatus.OK);
		}
		return new ResponseEntity<String>("duplicated",HttpStatus.OK);
	}
	
	// 안읽은 메시지 개수 가져오기 /////////////
	@GetMapping("getMessageCountAjax")
	@ResponseBody
	public int getMessageCountAjax(String userid) {
		return service.selectMessageReadCount(userid);
	}
	// 안읽은 메시지 개수 가져오기
	
}
