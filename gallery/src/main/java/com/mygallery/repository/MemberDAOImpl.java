package com.mygallery.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mygallery.domain.AddressDTO;
import com.mygallery.domain.MemberDTO;
import com.mygallery.mapper.MemberMapper;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private MemberMapper mMap;
	
	// 회원 정보 추가
	@Override
	public void register(MemberDTO memberDTO) {
		mMap.register(memberDTO);
	}
	@Override
	public void registAuth(MemberDTO memberDTO) {
		mMap.registAuth(memberDTO);
	}
	
	// 주소 조회
	@Override
	public List<AddressDTO> Addresslist(String dong) {
		return mMap.Addresslist(dong);
	}
	
	// 회원 정보 수정
	@Override
	public boolean modify(MemberDTO memberDTO) {
		return mMap.modify(memberDTO);
	}
	
	// 회원정보 상세 조회
	@Override
	public MemberDTO getUser(String username) {
		return mMap.getUser(username);
	}
	// 회원 정보 삭제
	@Override
	public boolean remove(String username) {
		try {
			mMap.remove(username);
			return true;
		}catch (Exception e) {
			return false;
		}
		
	}
	@Override
	public List<MemberDTO> getList() {
		
		return mMap.getList();
	}

}