package com.mygallery.domain;

import lombok.Data;

// 먼저 예약을 하면 여기에 저장. 
@Data
public class AttendBasketDTO {
	
	private int bnum;
	
	private String username;
	
	private int ecode;
	private String ename;
	private String estartD;
	private String eendD;
	private String eloca;
	
	
}
