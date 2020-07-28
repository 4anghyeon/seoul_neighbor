package com.justdo.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.justdo.domain.ReplyVO;
import com.justdo.service.replyService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/replies/")
@AllArgsConstructor
public class ReplyController {

	private replyService service;
	
	//reply insert///////////////////////////////////////////////////
		@PostMapping(value="/new",
				consumes = "application/json",
				produces = { MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> create(@RequestBody ReplyVO vo){
			int insertCount = service.insertReply(vo);
			
			return insertCount==1
					? new ResponseEntity<>("successs",HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	//reply insert//////////////////////////////////////////////////
		
		
	//reply select//////////////////////////////////////////////////
		@GetMapping(value="/replyList/{bno}",
					produces = { MediaType.APPLICATION_JSON_UTF8_VALUE})
		@ResponseBody
			public ResponseEntity<List<ReplyVO>> getReplyList(@PathVariable("bno") int bno){
			

			return new ResponseEntity<>(service.getReplyList(bno), HttpStatus.OK);
		}
		
	//reply select//////////////////////////////////////////////////
		

		
		
		@PostMapping("/board/removereply/{rno}")
		public ResponseEntity<String> remove(@PathVariable("rno") int rno) {


			return service.removeReply(rno) == 1 
					? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

		}
		
}
