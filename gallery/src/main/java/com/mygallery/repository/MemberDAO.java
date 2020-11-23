package com.mygallery.repository;

import java.util.List;

import com.mygallery.domain.AddressDTO;
import com.mygallery.domain.MemberDTO;

public interface MemberDAO {
	
	// 회원가입
	public void register(MemberDTO memberDTO);
	public void registAuth(MemberDTO memberDTO);
	
	// 주소검색
	public List<AddressDTO>Addresslist(String dong);
	
	// 회원 정보 수정
	public boolean modify(MemberDTO memberDTO);
	
	// 회원 정보 상세조회
	public MemberDTO getUser(String username);
	
	// 회원 정보 삭제
	public boolean remove(String username);
	
	// 회웑 전체 조회
	public List<MemberDTO>getList();
}
