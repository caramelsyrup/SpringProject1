package com.mygallery.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

// 게시되는 글과 파일
@Setter
@Getter
public class GalleryDTO {
	
	private int gnum;
	
	private String arttitle;
	
	private String artwriter;
	
	private String artdate;
	
	private String artfilename;
	
	private MultipartFile uploadFile;

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "GalleryDTO [ gnum="+gnum+",arttitle="+arttitle+",artwriter="+artwriter+",artdate="+artdate+",artfilename="+artfilename+"]";
	}
	
}
