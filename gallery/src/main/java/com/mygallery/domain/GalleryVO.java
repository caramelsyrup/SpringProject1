package com.mygallery.domain;

import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
public class GalleryVO {
	
	private int count;
	private List<GalleryDTO> list;
	
	@Builder
	public GalleryVO(int count, List<GalleryDTO> list) {
		super();
		this.count = count;
		this.list = list;
	}
	
	

}
