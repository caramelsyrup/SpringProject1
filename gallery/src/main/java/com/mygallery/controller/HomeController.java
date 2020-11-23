package com.mygallery.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mygallery.domain.GalleryDTO;
import com.mygallery.domain.MemberDTO;
import com.mygallery.service.GalleryServiceImpl;
import com.mygallery.service.MemberServiceImpl;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log
@Controller
public class HomeController {
	
	@Autowired
	private MemberServiceImpl mservice;
	@Autowired
	private GalleryServiceImpl sservice;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		List<GalleryDTO> list = sservice.getList();
		model.addAttribute("glist", list);
		return "home";
	}
	// 에러 처리
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : "+ auth);
		model.addAttribute("msg", "Access Denied");
	}
	// 로그인화면 경로
	@GetMapping("/customLogin")
	public void loginInput(String error,String logout,Model model) {
		log.info("error"+error);
		log.info("logout"+logout);
		if(error!=null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if(logout!=null) {
			model.addAttribute("logout", "Logout!!");
		}
	}
	// 로그인 판단
	@PostMapping("/login")
	@ResponseBody
	public String dologin(HttpServletRequest request, String username, String password) {
		System.out.println(username);
		System.out.println(password);
			MemberDTO dto = mservice.dologin(username);
			if(dto.getPassword().equals(password)) {
				System.out.println("로그인성공");
				HttpSession session = request.getSession();
				session.setAttribute("member", dto);
				return "go";
			}else {
				System.out.println("비밀번호 오류");
				return "fail";
			}
	}
	// 로그아웃 결정 페이지
	@GetMapping("/customLogout")
	public String logoutGet(HttpServletRequest request) {
		log.info("custom logout");
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	
	
}