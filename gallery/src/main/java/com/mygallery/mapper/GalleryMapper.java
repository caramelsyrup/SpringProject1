package com.mygallery.mapper;

import java.util.HashMap;
import java.util.List;

import com.mygallery.domain.GalleryDTO;

public interface GalleryMapper {
	
	// 전체 갤러리테이블 조회
	public List<GalleryDTO>getList();
	
	// DB 테이블 조회 페이징,검색 가능
	public List<GalleryDTO>plist(HashMap<String, Object>hm);
	
	// DB추가
	public int insert(GalleryDTO galleryDTO);
	
	// DB항목 상세조회
	public GalleryDTO get(int gnum);
	
	// DB항목 수정
	public void update(GalleryDTO galleryDTO);
	
	// DB항목 삭제
	public void delete(int gnum);
	
	// DB항목 전체 개수
	public int getCount(HashMap<String, Object>hm);
}