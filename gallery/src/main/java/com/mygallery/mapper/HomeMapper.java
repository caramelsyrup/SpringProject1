package com.mygallery.mapper;

import com.mygallery.domain.MemberDTO;

public interface HomeMapper {
	
	//로그인 판단
	public MemberDTO dologin(String username);
}
