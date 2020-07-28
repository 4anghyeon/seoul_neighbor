package com.justdo.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.justdo.domain.ReplyVO;
import com.justdo.mapper.replyMapper;
import com.justdo.service.replyService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service("replyService")
public class replyServiceImple implements replyService {
	
	private replyMapper replyMapper;

	@Override
	public int insertReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		//BoardVO의 reply_count++도 해주기
		replyMapper.plusCountOfReply(vo.getBno());
		return replyMapper.insertReply(vo);
	}

	@Override
	public List<ReplyVO> getReplyList(int bno) {
		// TODO Auto-generated method stub
			
		
		return replyMapper.getReplyList(bno);
	}
	
	@Override
	public int modifyReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		 return replyMapper.updateReply(vo);
	}

	@Override
	public int removeReply(int rno) {
		// TODO Auto-generated method stub
	    return replyMapper.deleteReply(rno);
	}
	
	
	
	
	
	
	
	
}
