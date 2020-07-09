package com.justdo.domain;

import lombok.Data;

// 회원 테이블 속성을 나타냅니다 ////////////
@Data
public class MemberVO {
	
	private String id; //회원 아이디
	private String pwd; //회원 비밀번호
}
