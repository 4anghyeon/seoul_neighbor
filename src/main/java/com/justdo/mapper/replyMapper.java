package com.justdo.mapper;

import java.util.List;

import com.justdo.domain.ReplyVO;

public interface replyMapper {

	//insert
	public int insertReply(ReplyVO vo);

	//select
	public List<ReplyVO> getReplyList(int bno);
	
	//댓글 갯수 UPDATE
	public int plusCountOfReply(int bno);
	
	//댓글  삭제

	public int deleteReply(int bno);
	
	//댓글  수정

	public int updateReply(ReplyVO reply);
	
	
	
}
