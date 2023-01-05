package com.kh.wantit;

import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.maven.doxia.site.decoration.Banner;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.wantit.admin.model.service.AdminService;
import com.kh.wantit.admin.model.vo.Notice;
import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.admin.model.vo.Pagination;
import com.kh.wantit.common.model.vo.BannerImage;
import com.kh.wantit.common.model.vo.Alarm;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.service.FundingService;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.member.Service.MemberService;
import com.kh.wantit.member.vo.Member;
import com.kh.wantit.wanting.model.service.WantingService;
import com.kh.wantit.wanting.model.vo.Wanting;
import com.sun.mail.handlers.image_gif;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private WantingService wService;
	@Autowired
	private FundingService fService;
	@Autowired
	private AdminService aService;
	@Autowired
	private MemberService mService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		if(session.getAttribute("loginUser") != null) {
			String id = ((Member)session.getAttribute("loginUser")).getMemberId();
			ArrayList<Alarm> alarmList = wService.selectAlarmList(id);
			model.addAttribute("alarmList", alarmList);
		}

		ArrayList<Wanting> wantingList = wService.selectWantingList();
		ArrayList<Image> wantingImageList = wService.selectImageList();
		ArrayList<Funding> fundingList = fService.fundingList();
		
		ArrayList<BannerImage> biList = aService.selectBannerIamgeList();
		
		ArrayList<Funding> fundingComingSoonList = new ArrayList<Funding>();
		ArrayList<Funding> fundingProceedList = new ArrayList<Funding>();
		
		Date now = new Date();
		
		for(Funding f : fundingList) {
			if(now.compareTo(f.getFundingStart()) == -1) {
				if(fundingComingSoonList.size() < 6) {
					fundingComingSoonList.add(f);
				}
			} else {
				if(fundingProceedList.size() < 6) {
					fundingProceedList.add(f);
				}
			}
		}

		
		model.addAttribute("fundingComingSoonList", fundingComingSoonList);
		model.addAttribute("fundingProceedList", fundingProceedList);
		
		model.addAttribute("wantingList", wantingList);
		model.addAttribute("wantingImageList", wantingImageList);
		
		
//		model.addAttribute("biList", biList);
		session.setAttribute("biList", biList);
		
		
		return "home";
	}
	
	@RequestMapping("search.do")
	public String search(@RequestParam(value = "searchText", required = false) String searchText, 
										@RequestParam(value = "searchCate", required = false) String cate,  Model model) {
		ArrayList<Funding> fundingList = new ArrayList<Funding>();
		ArrayList<Wanting> wantingList = new ArrayList<Wanting>();
		System.out.println(searchText);
		System.out.println(cate);
		
		if(searchText != null) {
			fundingList = fService.searchFundingList(searchText);
			wantingList = wService.searchWantingList(searchText);
			model.addAttribute("searchText", searchText);
			model.addAttribute("wantingList", wantingList);
		} else if(cate != null) {
			fundingList = fService.searchFundingList(cate);
			model.addAttribute("cate", cate);
		}
		
		model.addAttribute("fundingList", fundingList);
		
		return "common/searchView";
	}
	@RequestMapping("searchFP.do")
	public String searchFP(@RequestParam(value = "searchText", required = false) String searchText, 
											@RequestParam(value = "searchCate", required = false) String cate, Model model) {
		ArrayList<Funding> fundingFPList = new ArrayList<Funding>();
		
		ArrayList<Funding> fundingList = new ArrayList<Funding>();
		
		if(searchText != null) {
			fundingList = fService.searchFundingList(searchText);
			model.addAttribute("searchText", searchText);
		} else if(cate != null) {
			fundingList = fService.searchFundingList(cate);
			model.addAttribute("cate", cate);
		}
		
		Date now = new Date();
		for(Funding f : fundingList) {
			if(f.getFundingStart().compareTo(now) == -1) {
				fundingFPList.add(f);
			}
		}
		
		model.addAttribute("fundingList", fundingFPList);
		return "common/searchAjaxProceed";
	}
	
	@RequestMapping("searchFCS.do")
	public String searchFCS(@RequestParam(value = "searchText", required = false) String searchText, 
												@RequestParam(value = "searchCate", required = false) String cate, Model model) {
		ArrayList<Funding> fundingFCSList = new ArrayList<Funding>();
		
		ArrayList<Funding> fundingList = new ArrayList<Funding>();
		
		if(searchText != null) {
			fundingList = fService.searchFundingList(searchText);
			model.addAttribute("searchText", searchText);
		} else if(cate != null) {
			fundingList = fService.searchFundingList(cate);
			model.addAttribute("cate", cate);
		}
		
		Date now = new Date();
		for(Funding f : fundingList) {
			if(now.compareTo(f.getFundingStart()) == -1) {
				fundingFCSList.add(f);
			}
		}
		
		model.addAttribute("fundingList", fundingFCSList);
		
		return "common/searchAjaxComingSoon";
	}
	
	@RequestMapping("searchWant.do")
	public String searchWant(@RequestParam("searchText") String searchText, Model model) {
		ArrayList<Wanting> wantingList = wService.searchWantingList(searchText);
		ArrayList<Image> imageList = wService.selectImageList();
		
		model.addAttribute("wantingList", wantingList);
		model.addAttribute("imageList", imageList);
		
		return "common/searchAjaxWant";
	}
	
//	@RequestMapping("onlyNotice.do")
//	public String onlyNotice(@RequestParam(value = "page", required = false) Integer page, Model model) {
//		
//		int currentPage = 1;
//		if(page != null) 
//			currentPage = page;
//		
//		int noticeListCount = aService.getNoticeListCount();
//		PageInfo pi = Pagination.getPageInfo(currentPage, noticeListCount, 7);
//		ArrayList<Notice> noticeList = aService.selectNoticeList(pi);
//		ArrayList<Image> noticeImageList = aService.selectNoticeImage();
//		
//		model.addAttribute("noticeImageList", noticeImageList);
//		model.addAttribute("noticeList", noticeList);
//		model.addAttribute("pi", pi);
//		return "common/noticeAndEventList";
//	}
//	@RequestMapping("onlyEvent.do")
//	public String onlyEvent(@RequestParam(value = "page", required = false) Integer page, Model model) {
//		
//		int currentPage = 1;
//		if(page != null) 
//			currentPage = page;
//		
//		int noticeListCount = aService.getNoticeListCount();
//		PageInfo pi = Pagination.getPageInfo(currentPage, noticeListCount, 7);
//		ArrayList<Notice> noticeList = aService.selectNoticeList(pi);
//		ArrayList<Image> noticeImageList = aService.selectNoticeImage();
//		
//		model.addAttribute("noticeImageList", noticeImageList);
//		model.addAttribute("noticeList", noticeList);
//		model.addAttribute("pi", pi);
//		return "common/noticeAndEventList";
//	}
	@RequestMapping("noticeEvent.do")
	public String noticeEvent(@RequestParam(value = "page", required = false) Integer page, Model model) {
		
		int currentPage = 1;
		if(page != null) 
			currentPage = page;
		
		int noticeListCount = aService.getNoticeListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, noticeListCount, 7);
		ArrayList<Notice> noticeList = aService.selectNoticeList(pi);
		ArrayList<Image> noticeImageList = aService.selectNoticeImage();
		
		model.addAttribute("noticeImageList", noticeImageList);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pi", pi);
		return "common/noticeAndEventList";
	}
	
	@RequestMapping("selectNotice.do")
	public  String selectNotice(@RequestParam("noticeNum") int noticeNum, Model model) {
		
		Notice notice = aService.selectNotice(noticeNum);		
		String id = notice.getAdmin();
		Image img = new Image();
		img.setImageBoardCate(3);
		img.setImageBoardId(id);
		Image profileImage = mService.selectcImage(img);
		model.addAttribute("notice", notice);
		model.addAttribute("profileImage", profileImage);
		
		return "common/noticeOrEventView";
	}
	
	//로그인 페이지
	@RequestMapping("/loginenroll.me")
	public String loginenroll() {
		return "myPage_login";
	}
	
}
