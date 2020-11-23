package com.mygallery.mapper;

import java.util.HashMap;
import java.util.List;

import com.mygallery.domain.AttendBasketDTO;
import com.mygallery.domain.EventDTO;

public interface EventMapper {
	
	// DB에 게시글 추가
	public int doInsert(EventDTO eventDTO);
	// DB 게시글 총 개수 구하기
	public int ecount(HashMap<String, Object>hm);
	// DB 게시글 리스트 뽑기
	public List<EventDTO> elist(HashMap<String, Object>hm);
	// DB 상세보기
	public EventDTO get(int ecode);
	// DB 게시물 하나 삭제
	public void deleteEven(int ecode);
	// DB항목 수정
	public void updateEven(EventDTO eventDTO);
	// DB예약 조회 체크
	public int checkAttend(AttendBasketDTO dto);
	// DB예약하기
	public int makeAttend(AttendBasketDTO dto);
	// DB 예약 조회
	public List<AttendBasketDTO>getBasket(String username);
	// DB 예약 취소
	public void cancelone(int bnum);
}