package com.mygallery.service;

import java.util.HashMap;
import java.util.List;

import com.mygallery.domain.AttendBasketDTO;
import com.mygallery.domain.EventDTO;

public interface EventService {
	
	// DB에 행사 게시글 추가
	public int doEinsert(EventDTO eventDTO);
	// DB 총 게시글 수 구하기
	public int ecount(HashMap<String, Object>hm);
	
	// DB 리스트 구하기
	public List<EventDTO>elist(HashMap<String, Object>hm);
	
	// DB 하나 조회
	public EventDTO get(int ecode);
	
	// DB 하나 삭제
	public void deleteEven(int ecode);
	
	// DB 수정
	public void updateEven(EventDTO eventDTO);
	// 예약전 확인
	public int checkAttend(AttendBasketDTO dto);
	// 예약하기 버튼
	public int makeAttend(AttendBasketDTO dto);
	// 예약 조회
	public List<AttendBasketDTO>getBasket(String username);
	// 예약 취소
	public void cancelone(int bnum);
}