package com.justdo.service;

import java.util.List;

import com.justdo.domain.Criteria;
import com.justdo.domain.ReReplyVO;
import com.justdo.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	
	public int reRegister(ReReplyVO vo);
	
	public ReplyVO get(int bno);
	
	public int modify(ReplyVO vo);
	
	public int modifyRe(ReplyVO vo);
	
	public int remove(int no);
	
	public int removeRe(int no);
	
	public List<ReplyVO> getList(Criteria cri, int bno);
	
	public List<ReReplyVO> getReList(Criteria cri, int bno);
	
	public int getReplyCount(int bno);
}
