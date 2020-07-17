package com.justdo.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.justdo.domain.MemberVO;
import com.justdo.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	@Transactional
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// 아이디가 없을 시 예외 발생시킴
		if (username == null) {
			throw new UsernameNotFoundException(username);
		}
	
		log.warn("-------------1--------------");
		log.warn("아이디로 유저 불러오기 :"+username);
		
		log.warn("-------------2--------------");
		MemberVO vo = memberMapper.read_auth(username);
		log.warn("쿼리에 의해 불러와진 유저 :"+vo);
		
		log.warn("-------------3-------------");
		CustomUser user = new CustomUser(vo);
		
		log.warn("CustomUser에서 불러온 유저 :"+user);
		
		return vo == null? null : user;
	}
}
