package com.mygallery.mapper;

import java.util.List;

import com.mygallery.domain.AddressDTO;
import com.mygallery.domain.MemberDTO;

public interface MemberMapper {
	
	
	// 회원가입, 아이디 중복체크
	public MemberDTO idcheck(String userID);
	// 회원가입, 주소 검색
	public List<AddressDTO>Addresslist(String dong);
	
	// 회원가입, 회원정보 저장
	public void register(MemberDTO memberDTO);
	// 회원가입, 권한 저장
	public void registAuth(MemberDTO memberDTO);
	
	// 스프링 시큐리티, 아이디 조회
	// public MemberDTO read(String username);
	
	// 회원 전체 리스트
	public List<MemberDTO> getList();
	
	// 회원 상세 정보
	public MemberDTO getUser(String username);
	
	// 회원 정보 변경
	public boolean modify(MemberDTO userDTO);
	
	// 회원 정보 삭제
	public boolean remove(String username);
}
