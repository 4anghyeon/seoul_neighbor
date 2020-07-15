package com.justdo.service;

import java.util.List;

import com.justdo.domain.BoardVO;
import com.justdo.domain.MemberVO;
import com.justdo.domain.MessageVO;

public interface myPageService {

	//유저 정보 가져오기
	public MemberVO selectUser(String id);
	
	//유저 정보 수정
	public void updateUser(MemberVO vo);
	
	//원래 파일 이름 가져오기
	public String getOriginalFileName(String userid);
	
	//비밀번호 변경
	public void updatePassword(MemberVO vo);
	
	//쪽지함 리스트 가져오기
	public List<MessageVO> selectMessageList(String userid,int pageNum);
	
	//쪽지 총 개수
	public int selectCountMessage(String userid);
	
	//쪽지 보내기
	public void sendMessage(MessageVO vo);
	
	//쪽지 받는사람 아이디 가져오기
	public String selectFindReceiver(int mno);
	
	//나의 게시글 불러오기
	public List<BoardVO> selectMyBoardList(String userid);
}
