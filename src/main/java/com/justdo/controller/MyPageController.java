package com.justdo.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.justdo.domain.BoardVO;
import com.justdo.domain.MemberVO;
import com.justdo.domain.MessageVO;
import com.justdo.domain.QAVO;
import com.justdo.service.commonService;
import com.justdo.service.myPageService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/*")
@AllArgsConstructor
public class MyPageController {
	private commonService service;
	private myPageService myPageService;
	
	// 나의 게시글 불러오기 ///////////////////////////////////////////
	@GetMapping("mylist")
	public String myList(Model model,MemberVO vo) {
		vo = myPageService.selectUser("test");//test -> 동적으로 바꿔야함
		model.addAttribute("member", myPageService.selectUser(vo.getUserid())); 
		model.addAttribute("board",myPageService.selectMyBoardList(vo.getUserid(),0));
		model.addAttribute("pageTotalNum",myPageService.selectCountMyBoardList(vo.getUserid()));
		model.addAttribute("nowPageNum",1);
		return "mypage/mylist";
	}
	// 나의 게시글 불러오기 //
	
	// 나의 게시글 Ajax로 불러오기 //////////////////////////////////////////////
	@GetMapping("myListAjax")
	@ResponseBody
	public ResponseEntity<List<BoardVO>> myListAjax(String userid, int pageNum) {
		return new ResponseEntity<List<BoardVO>>(myPageService.selectMyBoardList(userid, pageNum),HttpStatus.OK);
	}
	// 나의 게시글 Ajax로 불러오기 //
	
	// 쪽지함 페이지 이동 ///////////////////////////////////////////
	@GetMapping("myMessage")
	public String myMessage(Model model, MemberVO vo) {
		vo = myPageService.selectUser("test"); //test -> 동적으로 바꿔야함
		model.addAttribute("member", vo); 
		model.addAttribute("message",myPageService.selectMessageList(vo.getUserid(),0));
		model.addAttribute("pageTotalNum",myPageService.selectCountMessage(vo.getUserid()));
		model.addAttribute("nowPageNum",1);
		return "mypage/myMessage";
	}
	// 쪽지함 페이지 이동 //
	
	//쪽지 Ajax로 불러오기 //////////////////////////////////////////////
	@GetMapping("myMessageAjax")
	@ResponseBody
	public ResponseEntity<List<MessageVO>> myMessageAjax(String userid, int pageNum) {
		return new ResponseEntity<List<MessageVO>>(myPageService.selectMessageList(userid, pageNum),HttpStatus.OK);
	}
	//쪽지 Ajax로 불러오기 //

	// 쪽지 Ajax로 보내기 ///////////////////////////////////////////////////
	@PostMapping("myMessageSendAjax")
	@ResponseBody public void myMessageSendAjax(MessageVO vo){
		vo.setReceiver(myPageService.selectFindReceiver(vo.getMno()));
		myPageService.sendMessage(vo); 
	}
	// 쪽지 보내기 //
	  
	// 1:1 문의 이동 ///////////////////////////////////////////
	@GetMapping("myQA")
	public String myQA(Model model,MemberVO vo) {
		vo = myPageService.selectUser("test");//test -> 동적으로 바꿔야함
		model.addAttribute("member", myPageService.selectUser(vo.getUserid())); 
		model.addAttribute("QA",myPageService.selectQAList(vo.getUserid(),0));
		model.addAttribute("pageTotalNum",myPageService.selectCountQAList(vo.getUserid()));
		model.addAttribute("nowPageNum",1);
		return "mypage/myQA";
	}
	// 1:1 문의 이동 //
	
	// 1:1 문의 Ajax로 불러오기 //////////////////////////////////////////////
	@GetMapping("myQAAjax")
	@ResponseBody
	public ResponseEntity<List<QAVO>> myQAAjax(String userid, int pageNum) {
		return new ResponseEntity<List<QAVO>>(myPageService.selectQAList(userid, pageNum),HttpStatus.OK);
	}
	// 1:1문의 Ajax로 불러오기 //
	
	// 1:1 문의 올리기 ////////////////////////////////////////////
	@PostMapping("QASendAjax")
	@ResponseBody public void QASend(QAVO qvo){
		myPageService.insertQA(qvo); 
	}
	// 1:1 문의 올리기
	
	
	// 비밀번호 변경 페이지 이동////////////////////////////////////////
	@GetMapping("myPassword")
	public String myPassword(Model model) {
		model.addAttribute("member", myPageService.selectUser("test")); //test -> 동적으로 바꿔야함
		return "mypage/myPassword";
	}
	// 비밀번호 변경 페이지 이동//
	
	
	
	
	//유저 정보 수정 //////////////////////////////////////
	@PostMapping("updateUser")
	public String profile(MemberVO vo, MultipartFile[] uploadFile, String isFileChanged) {
		File file;
		
		String uploadFolder = "c://Project/seoulneighbor/seoulNeighbor/src/main/webapp/resources/img/mypage";
		
		UUID uuid = UUID.randomUUID();
		String uploadFileName = vo.getMember_filename();
		
		String fileChanged = isFileChanged;
	
		uploadFileName = uuid.toString()+"_"+uploadFileName;
		
		
		for(MultipartFile multipartFile : uploadFile) {
			File saveFile = new File(uploadFolder,uuid.toString()+"_"+multipartFile.getOriginalFilename());
			
			try {
				if(fileChanged.equals("true")) { //프로필 이미지가 바뀌었을떼만
					file = new File(uploadFolder,myPageService.getOriginalFileName(vo.getUserid())); //기존에 있던 파일 이름을 가져와서
					file.delete(); //삭제
					multipartFile.transferTo(saveFile); //새로운 파일 등록
					vo.setMember_filename(uploadFileName);
				}
				myPageService.updateUser(vo); //데이터베이스 업데이트
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/profile";
	}
	//유저 정보 수정 //
	
	//비밀번호 변경 //////////////////////////////////////////////////
	@PostMapping("changePassword")
	public String changePassword(RedirectAttributes rttr, MemberVO vo, String changePw) {
		try { 
			service.login(vo).getUserid(); //기존 비밀번호 맞는지 확인
		}catch(Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("result","fail");
			return"redirect:/myPassword"; 
		}
		rttr.addFlashAttribute("result","success");
		vo.setUserpw(changePw);
		myPageService.updatePassword(vo);
		return "redirect:/myPassword";
	}
	//비밀번호 변경//

	
}
