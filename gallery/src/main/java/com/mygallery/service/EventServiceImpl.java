package com.mygallery.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mygallery.domain.AttendBasketDTO;
import com.mygallery.domain.EventDTO;
import com.mygallery.mapper.EventMapper;


@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventMapper eMapper;
	
	// DB에 게시글 추가하기
	@Override
	public int doEinsert(EventDTO eventDTO) {
		return eMapper.doInsert(eventDTO);
	}
	// DB 게시글 총 개수구하기
	@Override
	public int ecount(HashMap<String, Object> hm) {
		
		return eMapper.ecount(hm);
	}
	@Override
	public List<EventDTO> elist(HashMap<String, Object> hm) {
		
		return eMapper.elist(hm);
	}
	@Override
	public EventDTO get(int ecode) {
		return eMapper.get(ecode);
	}
	@Override
	public void deleteEven(int ecode) {
		eMapper.deleteEven(ecode);
		
	}
	@Override
	public void updateEven(EventDTO eventDTO) {
		eMapper.updateEven(eventDTO);
		
	}
	@Override
	public int makeAttend(AttendBasketDTO dto) {
		return eMapper.makeAttend(dto);
	}
	@Override
	public int checkAttend(AttendBasketDTO dto) {
		
		return eMapper.checkAttend(dto);
	}
	@Override
	public List<AttendBasketDTO> getBasket(String username) {
		List<AttendBasketDTO> blist = eMapper.getBasket(username);
		return blist;
	}
	@Override
	public void cancelone(int bnum) {
		eMapper.cancelone(bnum);
	}
	

}
