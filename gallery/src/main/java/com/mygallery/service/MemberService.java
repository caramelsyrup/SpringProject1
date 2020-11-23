package com.mygallery.service;

import java.util.List;

import com.mygallery.domain.AddressDTO;
import com.mygallery.domain.MemberDTO;

public interface MemberService {
	
	// 아이디 중복 체크
	public MemberDTO idcheck(String userID);
	// 주소 검색
	public List<AddressDTO>Addresslist(String dong);
	// 회원 가입
	public void register(MemberDTO memberDTO);
	public void registAuth(MemberDTO memberDTO);
	
	// 로그인판단
	public MemberDTO dologin(String username);
	
	// 회원 상세 정보 조회
	public MemberDTO getUser(String username);
	
	// 회원 정보 수정
	public boolean modify(MemberDTO memberDTO);
	
	// 회원 전체 조회
	public List<MemberDTO>getList();
	

	

}