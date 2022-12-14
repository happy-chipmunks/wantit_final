package com.kh.wantit;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		
		
		model.addAttribute("serverTime", formattedDate );
		
		
		return "home";
	}
	
	@RequestMapping("/fundingList.fund") 
		public String fundingList() {
			return "fundingProceed";
		}
	
	@RequestMapping("/fundingComingSoon.fund")
	public String fundingComingSoon() {
		return "fundingComingSoon";
	}
	
	@RequestMapping("/wantingList.want")
	public String wantingList() {
		return "wantingListView";
	}
	
	@RequestMapping("/fundingWrite.fund")
	public String fundingWrite() {
		return "fundingWrite";
	}
	//로그인 페이지
	@RequestMapping("/loginenroll.me")
	public String loginenroll() {
		return "myPage_login";
	}
}
