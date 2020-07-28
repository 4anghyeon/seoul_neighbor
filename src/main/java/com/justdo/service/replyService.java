package com.justdo.service;

import java.util.List;

import com.justdo.domain.ReplyVO;

public interface replyService {
	
	//댓글 insert
		public int insertReply(ReplyVO vo);
		
	//댓글 select
		public List<ReplyVO> getReplyList(int bno);


		public int modifyReply(ReplyVO vo);

		public int removeReply(int rno);		
		
		
		
		
}
