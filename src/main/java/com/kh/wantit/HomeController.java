package com.kh.wantit;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Date;

import org.apache.http.HttpResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.service.FundingService;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.wanting.model.service.WantingService;
import com.kh.wantit.wanting.model.vo.Wanting;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private WantingService wService;
	@Autowired
	private FundingService fService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		ArrayList<Wanting> wantingList = wService.selectWantingList();
		ArrayList<Image> wantingImageList = wService.selectImageList();// 

		ArrayList<Funding> fundingList = fService.fundingList();
		
		ArrayList<Funding> fundingComingSoonList = new ArrayList<Funding>();
		ArrayList<Funding> fundingProceedList = new ArrayList<Funding>();
		
		Date now = new Date();
		
		for(Funding f : fundingList) {
			if(now.compareTo(f.getFundingStart()) == -1) {
				if(fundingComingSoonList.size() < 7) {
					fundingComingSoonList.add(f);
				}
			} else {
				if(fundingProceedList.size() < 7) {
					fundingProceedList.add(f);
				}
			}
		}

		
		model.addAttribute("fundingComingSoonList", fundingComingSoonList);
		model.addAttribute("fundingProceedList", fundingProceedList);
		
		model.addAttribute("wantingList", wantingList);
		model.addAttribute("wantingImageList", wantingImageList);
		
		
		return "home";
	}
	
	@RequestMapping("search.do")
	public String search(@RequestParam("searchText") String searchText, 
										HttpServletResponse resp, HttpServletRequest req, Model model) {
		
		ArrayList<Funding> fundingList = fService.searchFundingList(searchText);
		
		
		
		model.addAttribute("fundingList", fundingList);
		return "common/searchView";
	}
	
	//로그인 페이지
	@RequestMapping("/loginenroll.me")
	public String loginenroll() {
		return "myPage_login";
	}
	
}
