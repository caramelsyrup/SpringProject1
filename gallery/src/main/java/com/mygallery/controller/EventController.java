package com.mygallery.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mygallery.domain.AttendBasketDTO;
import com.mygallery.domain.EventDTO;
import com.mygallery.domain.EventVO;
import com.mygallery.domain.GalleryDTO;
import com.mygallery.service.EventServiceImpl;

import lombok.extern.java.Log;

@Log
@RequestMapping("/events/*")
@Controller
public class EventController {
	
	@Autowired
	private EventServiceImpl eservice;
	
	// 행사 리스트 화면
	@GetMapping("/elist")
	public void elistv() {
	}
	// 행사 리스트 출력. 페이징
	@PostMapping("/elist")
	@ResponseBody
	public EventVO elist(String page) {
		// ajax으로부터 매개변수를 여러개를 받는다면,해쉬맵 사용
		HashMap<String, Object>hm = new HashMap<String, Object>();
		
		// 페이징 관련 변수들
		int ecount = eservice.ecount(hm);
		hm.put("ecount", ecount);
		
		int pageSize=3;
		if(page==null) page="1";	// page 정보가 건너올때, 만약 없다면 1로 저장
		int currentPage = Integer.parseInt(page);	// 받아오는 page를 정수로 만들어서 저장
		
		// db에서 조회되는 행의 첫수는 
		int startRow = ((currentPage-1)*pageSize)+1;	// 1페이지는 시작행은 1행이여야함.
		int endRow = startRow+pageSize-1;			// 1페이지의 끝행은 3행이여야함. 게시물 3개 보여주니까. 2페이지면 6행
		if(endRow>ecount) endRow = ecount;			// 끝행이 더 많지만, 조회되는 전체 게시물수가 더 적고, 끝행을 게시물 숫자에 맞춤
		
		// 시작행과 끝행을 맵에 담는다.
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		
		// 담은 정보를 가지고, 조회하는 sql실행
		List<EventDTO> elist = eservice.elist(hm);
		// 생성자가 파라메터를 전역변수에 바로 저장하도록 
		EventVO listvo = new EventVO(ecount, elist);
		
		return listvo;
	}
	
	// 행사 추가폼 화면
	@GetMapping("/insertForm")
	public void inForm() {
	}
	
	// 행사 추가하기
	@PostMapping(consumes = {"multipart/form-data"}, value = "/upload")
	@ResponseBody
	public int doUpload(EventDTO eventDTO) throws IllegalStateException, IOException {
		// 파일 저장을 위한 경로 저장
		String pathStr = "C:\\spring\\firstjsp\\gallery\\src\\main\\webapp\\resources\\img\\";
		// 파일명을 저장하기 위해서
		String fileName = null;
		// dto에 MultipartFile형 변수를 만든뒤, setter와 getter설정. 이후에 현재 폼에서 전송된 데이터가 dto에 담겨져있고
		// dto에서 MultipartFile형 값은 따로 저장.
		MultipartFile uploadFile = eventDTO.getUploadFile();
		// 저장된 파일값이 존재 한다면,파일 이름과 확장자를 따로 저장
		if(!uploadFile.isEmpty()) {
			String originalFilename = uploadFile.getOriginalFilename();
			log.info("**"+originalFilename);
			// common.io이용 파일에서 확장자만 따온다.
			String ext = FilenameUtils.getExtension(originalFilename);
			// UUID를 구해서 저장.
			UUID uuid = UUID.randomUUID();
			// 파일이름을 설정. uuid에 .찍고 확장자 추가.
			fileName = uuid+"."+ext;
			log.info("**"+fileName);
			// 원하는 경로에 파일이동 저장. 위에 설정한 파일 이름대로
			uploadFile.transferTo(new File(pathStr+fileName));
			}
		// dto에도 파일 이름을 저장(확장자까지)
		eventDTO.setEfilename(fileName);
		// 갤러리에 게시글 추가
		return eservice.doEinsert(eventDTO);
	}
	
	// 그림 상세보기 get
	@GetMapping("/detailPic/{ecode}")
	public String detailPics(@PathVariable String ecode, Model m) {
		int ecode1 = Integer.parseInt(ecode);
		EventDTO dto =eservice.get(ecode1);
		m.addAttribute("event", dto);
		return "events/eventDetail";
	}
	// 그림 수정하기폼 화면
	@GetMapping("/updateForm/{ecode}")
	public String updateForm(@PathVariable String ecode,Model m) {
		int ecode1 = Integer.parseInt(ecode);
		EventDTO dto = eservice.get(ecode1);
		m.addAttribute("event", dto);
		return "events/updateForm";
	}
	// 그림 게시물 수정 하기
	@PostMapping(consumes = {"multipart/form-data"},value = "/update")
	@ResponseBody
	public String doUpdatepic(EventDTO eventDTO) {			
		// 수정 폼의 값들이 galleryDTO에 전달 되었는지 확인
		System.out.println(eventDTO.getEcode());
		// 1.먼저 저장되어 있는 그림 파일을 찾아서 지운다.
		// gnum 정보는 받아옴.
		int ecode = eventDTO.getEcode();
		// dto는 현재 존재하는 값을 저장
		EventDTO dto = eservice.get(ecode);
		// 현재 파일 이름 저장
		String presentFileName = dto.getEfilename();
		System.out.println(presentFileName);
		// 현재 이미지 파일이 저장되는 경로
		String pathStr = "C:\\spring\\firstjsp\\gallery\\src\\main\\webapp\\resources\\img\\";
		// 삭제하는 메서드. 현재 존재하는 파일을 삭제.
		File file = new File(pathStr+presentFileName);
		
		if(file.exists()) {
			file.delete();
			System.out.println("그림파일 지워짐");
		}else {
			System.out.println("파일이 존재하지 않음.");
		}
		try {	
		//2.수정하기 폼에 있는 정보들로 업데이트를 한다.
			String afterFileName="";
			// DTO에 있는 MultipartFile형으로 따로저장.
			MultipartFile uploadFile = eventDTO.getUploadFile();
			// 저장된 파일값이 존재 한다면,파일 이름과 확장자를 따로 저장
			if(!uploadFile.isEmpty()) {
				// input의 파일에서 받아오는 파일의 이름을 따로 저장
				String originalFilename = uploadFile.getOriginalFilename();
				
				log.info("**"+originalFilename);
				// common.io이용 파일에서 확장자만 따온다.
				String ext = FilenameUtils.getExtension(originalFilename);
				// UUID를 구해서 저장.
				UUID uuid = UUID.randomUUID();
				// 파일이름을 설정. uuid에 .찍고 확장자 추가.
				afterFileName = uuid+"."+ext;
				log.info("**"+afterFileName);
				// 원하는 경로에 파일이동 저장. 위에 설정한 파일 이름대로
				uploadFile.transferTo(new File(pathStr+afterFileName));
				// dto에도 파일 이름을 저장(확장자까지)
				eventDTO.setEfilename(afterFileName);
				// 갤러리에 게시글 수정
				eservice.updateEven(eventDTO);
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return String.valueOf(ecode);
	}
	// 삭제하기
	@DeleteMapping("delete/{ecode1}")
	@ResponseBody
	public String deleteEven(@PathVariable String ecode1) {
		int ecode = Integer.parseInt(ecode1);
		eservice.deleteEven(ecode);
		return "done";
	}
	// 예약전 확인
	@PostMapping("/checkAt")
	@ResponseBody
	public int checkAttend(AttendBasketDTO dto) {
		
		return eservice.checkAttend(dto);
	}
	// 예약하기
	@PostMapping("/attend")
	@ResponseBody
	public int makeAttend(AttendBasketDTO dto) {
		
		EventDTO eve = eservice.get(dto.getEcode());
		dto.setEendD(eve.getEendD());
		dto.setEloca(eve.getEloca());
		dto.setEname(eve.getEname());
		dto.setEstartD(eve.getEstartD());
		
		return eservice.makeAttend(dto);
	}
	// 예약 상세 화면
	@GetMapping("detailAt/{username}")
	public String detailAttend(@PathVariable String username, Model m) {	
		// 아이디로 바스켓 조회
		List<AttendBasketDTO> list = eservice.getBasket(username);
		m.addAttribute("blist", list);
		return "events/detailAt";
	}
	// 예약 취소
	@DeleteMapping("cancel/{bnum}")
	@ResponseBody
	public String cancel(@PathVariable String bnum) {
		int bnum1 = Integer.parseInt(bnum);
		try {
			eservice.cancelone(bnum1);
			return "cancel";
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	
	
}
