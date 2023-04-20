package com.kh.wantit;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.kh.wantit.common.model.vo.Alarm;
import com.kh.wantit.common.model.vo.BannerImage;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.service.FundingService;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.member.Service.MemberService;
import com.kh.wantit.member.vo.Member;
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
	@Autowired
	private AdminService aService;
	@Autowired
	private MemberService mService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, 
			@RequestParam(value = "cancelPayScuccess", required = false) String cancelPayScuccess) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		HttpSession session = request.getSession(true);
		if(session.getAttribute("loginUser") != null) {
			String id = ((Member)session.getAttribute("loginUser")).getMemberId();
			ArrayList<Alarm> alarmList = wService.selectAlarmList(id);
			session.setAttribute("alarmList", alarmList);
		}

		ArrayList<Wanting> wantingList = wService.selectWantingList();
		ArrayList<Image> wantingImageList = wService.selectImageList();
		ArrayList<Funding> fundingList = fService.fundingList();
		
		ArrayList<BannerImage> biList = aService.selectBannerIamgeList();
		ArrayList<Funding> bannerFundList = new ArrayList<Funding>();
		for(BannerImage bi : biList) {
			String imageBoardId = aService.getImageBoardId(bi.getImageNum());
			Funding f = aService.getFundingInfo(Integer.parseInt(imageBoardId));
			
			bannerFundList.add(f);
		}
		
		ArrayList<Image> fundingImageList = fService.fundingImageList();
		
		ArrayList<Funding> fundingComingSoonList = new ArrayList<Funding>();
		ArrayList<Funding> fundingProceedList = new ArrayList<Funding>();
		ArrayList<Integer> dibsCountList = new ArrayList<Integer>();
		Date now = new Date();
		
		for(Funding f : fundingList) {
			if(now.compareTo(f.getFundingStart()) == -1) {
				if(fundingComingSoonList.size() < 6) {
					fundingComingSoonList.add(f);
					int count = fService.getDibsCount(f.getFundingNum());
					dibsCountList.add(count);
				}
			} else {
				if(fundingProceedList.size() < 6) {
					fundingProceedList.add(f);
				}
			}
		}
		

		System.out.println("cancelPayScuccess  " + cancelPayScuccess);
		if(cancelPayScuccess != null) {
			model.addAttribute("cancelPayScuccess", cancelPayScuccess);
		}
		model.addAttribute("fundingComingSoonList", fundingComingSoonList);
		model.addAttribute("dibsCountList", dibsCountList);
		model.addAttribute("fundingProceedList", fundingProceedList);
		
		model.addAttribute("wantingList", wantingList);
		model.addAttribute("wantingImageList", wantingImageList);
		
		model.addAttribute("fundingImageList", fundingImageList);
		
		model.addAttribute("bannerFundList", bannerFundList);
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
		ArrayList<Image> imageList = fService.fundingImageList();
		
		Map<String, String> searchMap = new HashMap<String, String>();
		if(searchText != null) {
			searchMap.put("cateOrContent", "content");
			searchMap.put("searchText", searchText);
			fundingList = fService.searchFundingList(searchMap);
			wantingList = wService.searchWantingList(searchMap);
			model.addAttribute("searchText", searchText);
			model.addAttribute("wantingList", wantingList);
		} else if(cate != null) {
			searchMap.put("cateOrContent", "cate");
			searchMap.put("cate", cate);
			fundingList = fService.searchFundingList(searchMap);
			model.addAttribute("cate", cate);
		}
		model.addAttribute("fundingList", fundingList);
		model.addAttribute("imageList", imageList);
		System.out.println(fundingList);
		
		return "common/searchView";
	}
	
	//진행중인 펀딩 검색
	@RequestMapping("searchFP.do")
	public String searchFP(@RequestParam(value = "searchText", required = false) String searchText, 
											@RequestParam(value = "searchCate", required = false) String cate, Model model) {
		//검색결과에 해당하는 진행중인 펀딩만 담을 list 생성
		ArrayList<Funding> fundingFPList = new ArrayList<Funding>();
		
		//db에서 검색결과에 해당하는 펀딩들을 가져올 list 생성
		ArrayList<Funding> fundingList = new ArrayList<Funding>();
		//펀딩제품들 이미지 가져오기
		ArrayList<Image> imageList = fService.fundingImageList();
		
		//카테고리 또는 단어가 들어올 수 있으므로 map 생성
		Map<String, String> searchMap = new HashMap<String, String>();
		
		//검색단어로만 서칭한 경우
		if(!searchText.equals("")) {
			searchMap.put("cateOrContent", "content");
			searchMap.put("searchText", searchText);
			fundingList = fService.searchFundingList(searchMap);
			
			model.addAttribute("searchText", searchText);
		//카테고리 분류로만 검색한 경우
		} else if(cate != null) {
			searchMap.put("cateOrContent", "cate");
			searchMap.put("cate", cate);
			fundingList = fService.searchFundingList(searchMap);
			
			model.addAttribute("cate", cate);
		}
		
		//db에서 가져온 펀딩오픈 날짜들을 현재날짜와 비교
		Date now = new Date();
		for(Funding f : fundingList) {
			//compareTo함수 사용하여 음수(시작날짜가 현재날짜보다 작을경우)일때만 model로 넘길 list에 담음
			if(f.getFundingStart().compareTo(now) == -1) {
				fundingFPList.add(f);
			}
		}
		model.addAttribute("fundingList", fundingFPList);
		model.addAttribute("imageList", imageList);
		
		return "common/searchAjaxProceed";
	}
	
	@RequestMapping("searchFCS.do")
	public String searchFCS(@RequestParam(value = "searchText", required = false) String searchText, 
												@RequestParam(value = "searchCate", required = false) String cate, Model model) {
		ArrayList<Funding> fundingFCSList = new ArrayList<Funding>();
		
		ArrayList<Funding> fundingList = new ArrayList<Funding>();
		ArrayList<Image> imageList = fService.fundingImageList();
		
		Map<String, String> searchMap = new HashMap<String, String>();
		if(!searchText.equals("")) {
			searchMap.put("cateOrContent", "content");
			searchMap.put("searchText", searchText);
			fundingList = fService.searchFundingList(searchMap);
			
			model.addAttribute("searchText", searchText);
			
		} else if(cate != null) {
			
			searchMap.put("cateOrContent", "cate");
			searchMap.put("cate", cate);
			fundingList = fService.searchFundingList(searchMap);
			
			model.addAttribute("cate", cate);
		}
		
		Date now = new Date();
		for(Funding f : fundingList) {
			if(now.compareTo(f.getFundingStart()) == -1) {
				fundingFCSList.add(f);
			}
		}
		
		model.addAttribute("fundingList", fundingFCSList);
		model.addAttribute("imageList", imageList);
		
		return "common/searchAjaxComingSoon";
	}
	
	@RequestMapping("searchWant.do")
	public String searchWant(@RequestParam("searchText") String searchText, Model model) {
		
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("cateOrContent", "content");
		searchMap.put("searchText", searchText);
		ArrayList<Wanting> wantingList = wService.searchWantingList(searchMap);
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
	public  String selectNotice(@RequestParam("noticeNum") int noticeNum, HttpSession session, Model model) {
		
		Notice notice = aService.selectNotice(noticeNum);
		String userId = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		if(!userId.equals("admin")) {
			aService.plusNoticeCount(noticeNum);
		}
		
		model.addAttribute("notice", notice);
		
		return "common/noticeOrEventView";
	}
	
	//로그인 페이지
	@RequestMapping("/loginenroll.me")
	public String loginenroll() {
		return "myPage_login";
	}
	
}
