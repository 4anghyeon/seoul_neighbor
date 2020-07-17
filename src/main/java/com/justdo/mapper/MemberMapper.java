package com.justdo.mapper;

import com.justdo.domain.MemberVO;

public interface MemberMapper {
	// 로그인용 result map
	public MemberVO read_auth(String userid);
}
