package com.mygallery.domain;

import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
public class EventVO {
	
	private int ecount;
	private List<EventDTO> elist;
	
	@Builder
	public EventVO(int ecount, List<EventDTO> elist) {
		super();
		this.ecount = ecount;
		this.elist = elist;
	}
	
	
	
}
