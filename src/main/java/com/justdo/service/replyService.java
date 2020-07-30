package com.justdo.service;

import java.util.List;

import com.justdo.domain.Criteria;
import com.justdo.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	
	public ReplyVO get(int bno);
	
	public int modify(ReplyVO vo);
	
	public int remove(int rno);
	
	public List<ReplyVO> getList(Criteria cri, int bno);
	
	public int getReplyCount(int bno);
}
