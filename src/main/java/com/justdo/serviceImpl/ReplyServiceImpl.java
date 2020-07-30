package com.justdo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justdo.domain.Criteria;
import com.justdo.domain.ReplyVO;
import com.justdo.mapper.ReplyMapper;
import com.justdo.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_= @Autowired)
	private ReplyMapper mapper;

	@Override
	public int register(ReplyVO vo) {
		mapper.updateReplyCnt(vo.getBno());
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(int bno) {
		return mapper.read(bno);
	}

	@Override
	public int modify(ReplyVO vo) {

		return mapper.update(vo);
	}

	@Override
	public int remove(int rno) {
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, int bno) {
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public int getReplyCount(int bno) {
		return mapper.getCountByBno(bno);
	}

	
}
