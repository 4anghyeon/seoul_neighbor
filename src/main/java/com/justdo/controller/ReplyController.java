package com.justdo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.justdo.domain.Criteria;
import com.justdo.domain.ReplyVO;
import com.justdo.service.ReplyService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/reply/")
@AllArgsConstructor
public class ReplyController {
	private ReplyService service;
	
	//댓글 등록
	@PostMapping(value = "/new", consumes = "application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		System.out.println("댓글 insert 컨트롤러 발동");
		System.out.println(vo);
		
		int insertCount = service.register(vo);
		
		return insertCount == 1 ? 
				new ResponseEntity<String>("success", HttpStatus.OK) :
				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 한개 조회
	@SuppressWarnings("deprecation")
	@GetMapping(value="/{rno}" , produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") int rno) {
		return new ResponseEntity<ReplyVO>(service.get(rno), HttpStatus.OK);
	}
	
	//댓글 삭제
	@SuppressWarnings("deprecation")
	@DeleteMapping(value="/{rno}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") int rno) {
		return service.remove(rno) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 수정
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, 
			value = "/{rno}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") int rno){
		vo.setRno(rno);
		
		return service.modify(vo) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 목록 조회
	@SuppressWarnings("deprecation")
	@GetMapping(value = "/pages/{bno}/{page}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> getList(@PathVariable("page") int page, @PathVariable("bno") int bno){
		
		System.out.println("받은 bno : " + bno + " 받은 page : " + page);
		
		Map<String, Object> map = new HashMap<>();
		
		Criteria cri = new Criteria();
		cri.setAmount(10);
		cri.setPageNum(page);
		
		
		System.out.println(cri);
		
		map.put("replyCount", service.getReplyCount(bno));
		map.put("list", service.getList(cri, bno));
		
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
		
}
