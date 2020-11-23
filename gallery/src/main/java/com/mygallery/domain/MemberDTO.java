package com.mygallery.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.Data;

@Data
public class MemberDTO {
	
	private String username;	// 유저 아이디
	private String password;	// 유저 비밀번호
	private String membername;	// 회원 실제이름
	private String age;			// 나이
	private String address;		// 주소
	private String email;		// 이메일
	
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd")
	private Date regdate;		// 가입일
	
	private Boolean enabled;	// 여부
	private int auth;	
	
}
