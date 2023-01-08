package com.kh.wantit.funding.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.admin.model.vo.Pagination;
import com.kh.wantit.common.model.vo.Alarm;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.exception.FundingException;
import com.kh.wantit.funding.model.service.FundingService;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.funding.model.vo.FundingDibs;
import com.kh.wantit.funding.model.vo.FundingMessage;
import com.kh.wantit.funding.model.vo.FundingNotice;
import com.kh.wantit.funding.model.vo.Review;
import com.kh.wantit.member.vo.Creator;
import com.kh.wantit.member.vo.Member;
import com.kh.wantit.pay.vo.PaySchedule;
import com.kh.wantit.pay.vo.Reward;

@Controller
public class FundingController {
	
	@Autowired
	private FundingService fService;
	
	// 펀딩 글 목록
	@RequestMapping("fundingList.fund") 
	public String fundingList(Model model, @RequestParam(value="ing", required=false) Integer ing, @RequestParam(value="rank", required=false) Integer rank) {
		ArrayList<Funding> fundingList = fService.fundingList();
		ArrayList<Image> imageList = fService.fundingImageList();
//		System.out.println(fundingList);
//		System.out.println(ing);
//		System.out.println(rank);
		ArrayList<Funding> ingRanking = new ArrayList<Funding>();
		ArrayList<Funding> endLatest = new ArrayList<Funding>();
		ArrayList<Funding> endRanking = new ArrayList<Funding>();
		if(ing != null && rank != null) {
			if(ing == 1 && rank == 2) {
				ingRanking = fService.getFundingIngListRanking();
			}else if(ing == 2 && rank == 1){
				endLatest = fService.getFundingEndLatest();
			}else if(ing == 2 && rank == 2) {
				endRanking = fService.getFundingEndRanking();
			}
		}
		
		if (fundingList != null
				&& imageList != null && ingRanking != null & endLatest != null && endRanking != null) {
			model.addAttribute("fundingList", fundingList);
			model.addAttribute("imageList", imageList);
			model.addAttribute("ingRanking", ingRanking);
			model.addAttribute("endLatest", endLatest);
			model.addAttribute("endRanking", endRanking);
			model.addAttribute("ing", ing);
			model.addAttribute("rank", rank);
			return "fundingProceed";
		}else if(fundingList != null && imageList != null){
			model.addAttribute("fundingList", fundingList);
			model.addAttribute("imageList", imageList);
			model.addAttribute("ing", ing);
			model.addAttribute("rank", rank);
			return "fundingProceed";
		}else {
			throw new FundingException("펀딩 목록 불러오기 실패");
		}
	}
	
	// 펀딩 작성 페이지 이동
	@RequestMapping("insertFundingBoard.fund")
	public String insertFundingBoard() {
		return "fundingWrite";
	}
	
	// 펀딩 등록
	@RequestMapping("insertFunding.fund")
	public String insertFunding(@ModelAttribute Funding f, @RequestParam("file2") ArrayList<MultipartFile> files, HttpServletRequest request, @RequestParam("category") String cate, @ModelAttribute Reward r,
													@RequestParam("rewardTitle[]") ArrayList<String> rewardTitleArr, @RequestParam("rewardContent[]") ArrayList<String> rewardContentArr, @RequestParam("rewardLimit[]") ArrayList<Integer> rewardLimitArr,
													@RequestParam("rewardExpectDate[]") ArrayList<Date> rewardExpectDateArr, @RequestParam("price[]") ArrayList<Integer> rewardPriceArr, @RequestParam("shipping[]") ArrayList<Integer> rewardShippingArr) {
		String id = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		// System.out.println(id);
		
		int creatorNum = fService.getCreatorNum(id);
		
		String creatorName = fService.getCreatorName(id);
		f.setCreatorNum(creatorNum);
		f.setCreatorNickname(creatorName);
		// System.out.println(cate);
		f.setFundingCate(cate);
		// System.out.println(f.getFundingEnd());
		
		
		int result1 = fService.insertFunding(f);
		int result2 = 0;
		int result3 = 0;
		// System.out.println(r);
//		ArrayList<Reward> reward = new ArrayList<Reward>();
		System.out.println(rewardTitleArr);
		System.out.println(rewardContentArr);
		System.out.println(rewardLimitArr);
		System.out.println(rewardExpectDateArr);
		System.out.println(rewardPriceArr);
		System.out.println(rewardShippingArr);
		for(int i = 0; i < rewardTitleArr.size() - 1; i++) {
			r.setRewardTitle(rewardTitleArr.get(i));
			System.out.println(rewardTitleArr.get(i));
			r.setRewardContent(rewardContentArr.get(i));
			r.setRewardLimit(rewardLimitArr.get(i));
			r.setRewardExpectDate(rewardExpectDateArr.get(i));
			r.setPrice(rewardPriceArr.get(i));
			r.setShipping(rewardShippingArr.get(i));
			
			result3 = fService.insertReward(r);
			System.out.println(r);
		}
		
		ArrayList<Image> list = new ArrayList<Image>();
		for(int j = 0; j < files.size(); j++) {
			MultipartFile upload = files.get(j);
			
			if(!upload.getOriginalFilename().equals("")) {
				String[] returnArr = saveFile(upload, request, j);
				
				if(returnArr[1] != null) {
					Image i = new Image();
					i.setOriginName(upload.getOriginalFilename());
					i.setImageForm(upload.getOriginalFilename().substring(upload.getOriginalFilename().lastIndexOf(".")));
					i.setImageRename(returnArr[1]);
					i.setImageSrc(returnArr[0]);
					i.setImageBoardCate(1);
//					i.setImageLevel(0);
					list.add(i);
				}
			}
		}
		// System.out.println(list);
		
		for(int j = 0; j < list.size(); j++) {
			Image i = list.get(j);
			if(j == 0) {
				i.setImageLevel(0);
			}else {
				i.setImageLevel(1);
			}
			result2 = fService.insertImage(i);
		}
		
		if (result1 > 0 && result2 > 0 /* && result3 >0 */) {
			 return "redirect:fundingList.fund";
		} else { 
			 throw new FundingException("펀딩 등록 실패"); 
		}
	}
	
	// 이미지 저장
	public String[] saveFile(MultipartFile file, HttpServletRequest request, int j) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\funding";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		int ranNum = (int)(Math.random()*100000);
		String originFileName = file.getOriginalFilename();
		String renameFileName = "funding" + sdf.format(new Date(System.currentTimeMillis())) + j + ranNum
													+ originFileName.substring(originFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		
		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = renameFileName;
		
		return returnArr;
	}
	
	// 펀딩 summernote 이미지
		@RequestMapping("uploadSummernoteImageFile.fund")
		public void profileUpload(String email, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception{
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\funding\\summernote";
			
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
			int ranNum = (int)(Math.random()*1000);
			String originFileName = file.getOriginalFilename();
			String renameFileName = "funding" + sdf.format(new Date(System.currentTimeMillis())) + ranNum + "sm" + originFileName.substring(originFileName.lastIndexOf("."));
	
			String renamePath = folder + "//" + renameFileName;
			try {
				file.transferTo(new File(renamePath));
			} catch (Exception e) {
				System.out.println("파일 전송 에러 : " + e.getMessage());
			}
			
//			System.out.println("파일경로: " + renamePath);
			PrintWriter out = response.getWriter();
			
			out.println(renameFileName);
			out.close();
		}
	
	// 펀딩 오픈 예정 페이지 이동
	@RequestMapping("fundingComingSoon.fund")
	public String fundingComingSoon(Model model) {
		
		ArrayList<Funding> fundingList = fService.fundingList();
		ArrayList<Image> imageList = fService.fundingImageList();
		
		System.out.println("fundingList : " + fundingList);
		System.out.println("iamgeList : " + imageList);
		model.addAttribute("fundingList", fundingList);
		model.addAttribute("imageList", imageList);
		return "fundingComingSoon";
	}
	
	// 펀딩 게시글 상세조회
	@RequestMapping("selectFundingBoard.fund")
	public ModelAndView selectFundingBoard(@RequestParam("bId") int bId, @RequestParam("writerNo") int creatorNum, HttpSession session, ModelAndView mv) {
		Member m = (Member)session.getAttribute("loginUser");
		String login = null;
		if(m != null) {
			login = m.getMemberId();
		}
		
		boolean yn = false;
		String writerCheckId = fService.checkWriter(creatorNum);
		if(!writerCheckId.equals(login)) {
			yn = true;
		}

		Funding f = fService.getFunding(bId, yn);
		Image img = fService.getImage(bId);
		Creator creator = fService.getCreatorInfo(creatorNum);
		 
		 int supCount = fService.getSupportCount(bId);
		 int dibsCount = fService.getDibsCount(bId);
		 
		 boolean ok = false;
		 ArrayList<FundingDibs> dibs = fService.getDibs(bId);
		 for(int i = 0; i < dibs.size(); i++) {
			 System.out.println(dibs.get(i));
			 if(dibs.get(i).getDibsId().equals(login)) {
				 ok = true;
			 }
		 }
		 
			ArrayList<Funding> fundingList = fService.getFundingListFromCreatorNum(creatorNum);
			ArrayList<Review> reviewList = fService.getReviewList(creatorNum);
			double reviewAverage = 0;
			for(Review r : reviewList) {
				reviewAverage += r.getReviewRating();
			}
			reviewAverage = reviewAverage / reviewList.size();
			int totalAmount = 0;
			int totalSupCount = 0;
			for(Funding fund : fundingList) {
				totalAmount += fund.getCurrentMoney();
				int sc = fService.getSupportCount(fund.getFundingNum());
				
				totalSupCount += sc;
			}
		
		if(f != null) {
			mv.addObject("f", f).addObject("img", img).addObject("ok", ok).addObject("dibs", dibs).addObject("bId", bId)
			.addObject("dibsCount", dibsCount).addObject("login", login).addObject("supCount", supCount)
			.addObject("m", m).addObject("yn", yn).addObject("creatorNum", creatorNum).addObject("creator", creator)
			.addObject("reviewAverage", reviewAverage).addObject("totalAmount", totalAmount).addObject("totalSupCount", totalSupCount).addObject("reviewCount", reviewList.size())
			.setViewName("fundingMain");
		}else {
			throw new FundingException("펀딩 게시글 상세조회 실패");
		}
		return mv;
	}
	
	// 새소식 리스트
	@RequestMapping("fundingNotice.fund")
	public String fundingNotice(@RequestParam("bId") int bId, Model model, HttpSession session) {
		// System.out.println(bId);
		String fundingCreator = fService.getFundingCreator(bId);
		Member login = (Member)session.getAttribute("loginUser");
		
		ArrayList<FundingNotice> fnList = fService.fundingNoticeList(bId);
		int count = fService.fnListCount(bId);
		
		Funding f = fService.getCurrFunding(bId);
		System.out.println(f);
		
//		System.out.println(bId);
		String writer = fService.getFundingCreator(bId);
		int writerNo = fService.getFundingCreatorNum(writer);
		 int supCount = fService.getSupportCount(bId);
		 int dibsCount = fService.getDibsCount(bId);
		
		model.addAttribute("count", count);
		model.addAttribute("fnList", fnList);
		model.addAttribute("fundingCreator", fundingCreator);
		model.addAttribute("login", login);
		model.addAttribute("bId", bId);
		model.addAttribute("writerNo", writerNo);
		model.addAttribute("f", f);
		model.addAttribute("supCount", supCount);
		model.addAttribute("dibsCount", dibsCount);
		return "fundingNotice";
	}
	
	// 새소식 작성
	@RequestMapping("insertFundingNotice.fund")
	public String insertFundingNotice(@ModelAttribute FundingNotice fn, HttpSession session, @RequestParam("fundingNoticeNum") int fundingNoticeNum, @RequestParam("category") String cate, Model model) {
		String writer = ((Member)session.getAttribute("loginUser")).getMemberId();
		fn.setFundingNoticeWriter(writer);
		fn.setFundingNum(fundingNoticeNum);
		fn.setFundingNoticeCategory(cate);
		
		int result = fService.insertFundingNotice(fn);
		
		if(result > 0) {
			model.addAttribute("bId", fundingNoticeNum);
			return "redirect:fundingNotice.fund";
		}else {
			throw new FundingException("새소식 작성 실패");
		}
	}
	
	// 새소식 상세조회
	@RequestMapping("selectFundingNoticeBoard.fund")
	public String selectFundingNoticeBoard(@RequestParam("bId") int bId, @RequestParam("writer") String writer, @RequestParam("fundingNoticeNum") int fundingNoticeNum, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		String login = null;
		boolean yn = false;
		if(m != null) {
			login = m.getMemberId();
		}
		if(!writer.equals(login)) {
			yn = true;
		}
		
		int writerNo = fService.getCreatorNum(writer);
		
		ArrayList<FundingNotice> fnList = fService.getFundingNotice(writer, bId, yn);
		System.out.println(fnList);
		FundingNotice fn = new FundingNotice();
		for(int i=0; i<fnList.size(); i++) {
			if(fnList.get(i).getFundingNoticeNum() == fundingNoticeNum) {
				fn = fnList.get(i);
				System.out.println(fnList.get(i));
			}
		}
		
		Funding f = fService.getCurrFunding(bId);
//		System.out.println(bId);
		
		int dibsCount = fService.getDibsCount(bId);
		
		if(fn != null) {
			model.addAttribute("login", login);
			model.addAttribute("fn", fn);
			model.addAttribute("bId", bId);
			model.addAttribute("f", f);
			model.addAttribute("dibsCount", dibsCount);
			model.addAttribute("m", m);
			model.addAttribute("writerNo", writerNo);
			return "fundingNoticeDetail";
		}else {
			throw new FundingException("새소식 상세조회 실패");
		}
	}
	
	// 펀딩 수정하기
	@RequestMapping("fundingEdit.fund")
	public String fundingEdit(@RequestParam("fundingNum") int fundingNum, HttpSession session, Model model) {
		String creatorId = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		Funding f = fService.getFundingInfo(fundingNum);
//		System.out.println(f);
		Image i = fService.getImage(fundingNum);
		
		model.addAttribute("creatorId", creatorId);
		model.addAttribute("fundingNum", fundingNum);
		model.addAttribute("f", f);
		model.addAttribute("i", i);
		return "fundingEdit";
	}
	
	// 펀딩 수정 내용 funding_edit에 넣기
	@RequestMapping("fundingEditSend.fund")
	public String fundingEditSend(@ModelAttribute Funding f, @RequestParam("category") String cate) {
		System.out.println(f);
		f.setFundingCate(cate);
		int result = fService.fundingEdit(f);
		
		int fundingNum = f.getFundingNum();
		// 펀딩 confirm 'E'로 update(관리자 리스트 뿌리기 위해)
		int result2 = fService.fundingConfirmUpdate(fundingNum);
		
//		redirectAttributes.addAttribute("creatorId", creatorId);
//		redirectAttributes.addAttribute("fundingNum", fundingNum);
//		redirectAttributes.addAttribute("f", f);
//		redirectAttributes.addAttribute("i", i);
		return "fundingProceed";
	}
	
	// 펀딩 리뷰 보기
	@RequestMapping("fundingReview.fund")
	public String fundingReview(@RequestParam("bId") Integer fundingNum, Model model, @RequestParam(value = "page", required = false) Integer page, HttpSession session) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		
		Member m = ((Member)session.getAttribute("loginUser"));
		
		int listCount = fService.getListCountR(fundingNum);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);	
		
		ArrayList<Review> rv = fService.getFundingReview(fundingNum, pi);
		int revCount = fService.getReviewCount(fundingNum);
		ArrayList<PaySchedule> ps = fService.getPayList(fundingNum);
		int supCount = fService.getSupportCount(fundingNum);
		
		Funding f = fService.getFundingInfo(fundingNum);
		String writer = fService.getFundingCreator(fundingNum);
		int writerNo = fService.getFundingCreatorNum(writer);
		int dibsCount = fService.getDibsCount(fundingNum);
		
		ArrayList<Member> reviewerNick = fService.getReviewerNickName(fundingNum);
//		System.out.println(reviewerNick);
		
		model.addAttribute("fundingNum", fundingNum);
		model.addAttribute("rv", rv);
		model.addAttribute("ps", ps);
		model.addAttribute("supCount", supCount);
		model.addAttribute("f", f);
		model.addAttribute("revCount", revCount);
		model.addAttribute("writerNo", writerNo);
		model.addAttribute("m", m);
		model.addAttribute("pi", pi);
		model.addAttribute("reviewerNick", reviewerNick);
		model.addAttribute("dibsCount", dibsCount);
		return "fundingReview";
	}
	
	// 펀딩 찜하기
	@RequestMapping("insertDibs.fund")
	public ModelAndView insertDibs(@RequestParam("fundingNum") int fundingNum, @RequestParam("id") String id, ModelAndView mv, @RequestParam("writerNo") int writerNo) {
		FundingDibs dibs = new FundingDibs(id, fundingNum);
		
		int result = fService.insertDibs(dibs);
		if(result > 0) {
			mv.addObject("bId", fundingNum).addObject("id", id).addObject("writerNo", writerNo).setViewName("redirect:selectFundingBoard.fund");
			return mv;
		}else {
			throw new FundingException("찜하기 실패");
		}
	}
	
	// 찜하기 취소
	@RequestMapping("deleteDibs.fund")
	public ModelAndView deleteDibs(@RequestParam("fundingNum") int fundingNum, @RequestParam("id") String id, ModelAndView mv, @RequestParam("writerNo") int writerNo) {
		FundingDibs dibs = new FundingDibs(id, fundingNum);
		
		int result = fService.deleteDibs(dibs);
		
		if(result > 0) {
			mv.addObject("bId", fundingNum).addObject("id", id).addObject("writerNo", writerNo).setViewName("redirect:selectFundingBoard.fund");
			return mv;
		}else {
			throw new FundingException("찜하기 취소 실패");
		}
	}
	
	@RequestMapping("popular.fund")
	public String popularList(Model model) {
		ArrayList<Funding> popularList = fService.popularList();
		ArrayList<Image> imageList = fService.fundingImageList();
		
		model.addAttribute("fundingList", popularList);
		model.addAttribute("imageList", imageList);
		
		return "ajaxFundingProceed";
	}
	
	@RequestMapping("sort.fund")
	public String sortFundingComingSoon(@RequestParam("type") String sortType,
																		@RequestParam("page") String page, Model model) {
		ArrayList<Funding> sortList = fService.sortList(sortType);
		ArrayList<Image> imageList = fService.fundingImageList();
		
		model.addAttribute("fundingList", sortList);
		model.addAttribute("imageList", imageList);
		
		if(page.equals("proceed")) {
			return "ajaxFundingProceed";
		} else {
			return "ajaxFundingComingSoon";
		}
	}
	
	@RequestMapping("sortCate.fund")
	public String sortCateFundingList(@RequestParam("cate") String cate, 
																@RequestParam("page") String page, Model model) {
		
		ArrayList<Funding> sortCateList = fService.sortCateList(cate);
		ArrayList<Image> imageList = fService.fundingImageList();
		System.out.println("sortcateList : " + sortCateList);
		
		model.addAttribute("fundingList", sortCateList);
		model.addAttribute("imageList", imageList);
		
		if(page.equals("proceed")) {
			return "ajaxFundingProceed";
		} else {
			return "ajaxFundingComingSoon";
		}
	}
	
	// 펀딩 문의하기
	@RequestMapping("sendMessage.fund")
	public String sendMassage(@RequestParam("fundingNum") int fundingNum, HttpSession session, Model model, @ModelAttribute FundingMessage fm, @RequestParam("creatorId") int creatorNum) {
		String id = ((Member)session.getAttribute("loginUser")).getMemberId();
		String creatorId = fService.getFundingCreator(fundingNum);
		fm.setFundingNum(fundingNum);
		fm.setSender(id);
		fm.setReceiver(creatorId);
		
		int result = fService.insertInquiry(fm);
		
		model.addAttribute("writerNo", creatorNum);
		model.addAttribute("bId", fundingNum);
		return "redirect:selectFundingBoard.fund";
	}
	
	@RequestMapping("goToCreator.fund")
	public String goToCreatorProject(@RequestParam("creatorNum") int creatorNum, 
																@RequestParam("page") String page, Model model) {
		
		Creator creator = fService.getCreatorInfo(creatorNum);
		ArrayList<Funding> fundingList = fService.getFundingListFromCreatorNum(creatorNum);
		ArrayList<Review> reviewList = fService.getReviewList(creatorNum);
		double reviewAverage = 0;
		for(Review r : reviewList) {
			reviewAverage += r.getReviewRating();
		}
		reviewAverage = reviewAverage / reviewList.size();
		int totalAmount = 0;
		int totalSupCount = 0;
		for(Funding f : fundingList) {
			totalAmount += f.getCurrentMoney();
			int supCount = fService.getSupportCount(f.getFundingNum());
			
			totalSupCount += supCount;
		}
		
		model.addAttribute("totalSupCount", totalSupCount);
		model.addAttribute("fundingList", fundingList);
		model.addAttribute("creator", creator);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewAverage", reviewAverage);
		model.addAttribute("totalAmount", totalAmount);
		
		if(page.equals("project")) {
			return "../creatorDetail/creatorDetailMain";
		} else {
			return "../creatorDetail/creatorDetailInfo";
		}
	}
	
	@RequestMapping("applyAlarm.fund")
	public void applyAlarm(@RequestParam("fundingNum") int fundingNum, @RequestParam("fundingTitle") String fundingTitle,
												@RequestParam("fundingStart") Date fundingStart, HttpServletRequest req, HttpServletResponse resp) {
		
		String userId = ((Member)req.getSession().getAttribute("loginUser")).getMemberId();
		
		Alarm alarm = new Alarm();
		alarm.setMemberId(userId);
		alarm.setAlarmBoardCate(1);
		alarm.setAlarmBoardId(fundingNum);
		alarm.setAlarmMsg(fundingTitle + " - 펀딩이 오픈하였습니다 ! ");
		alarm.setAlarmDate(fundingStart);
		
		int alreadyApplyAlarm = fService.checkAlreadyApplyAlarm(alarm);
		HashMap<String, String> map = new HashMap<String, String>();
		if(alreadyApplyAlarm >= 1) {
			map.put("result", "failed");
		} else {
			int result = fService.insertAlarm(alarm);
			
			if(result >= 1) {
				map.put("result", "success");
			} else {
				map.put("result", "failed");
			}
		}
		resp.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder gb2 = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = gb2.create();
		try {
			gson.toJson(map, resp.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
		
	}

	// 펀딩한 서포터
	@RequestMapping("fundingSupportor.fund")
	public String fundingSupportor(@RequestParam("bId") int fundingNum, Model model, HttpSession session) {
		ArrayList<PaySchedule> psList = fService.fundingSupportor(fundingNum);
		int psListCount = fService.getSupportCount(fundingNum);
		
		ArrayList<Member> member = new ArrayList<>();
		ArrayList<Image> memberImageList = new ArrayList<Image>(); 
		for(int i = 0; i < psList.size(); i++) {
			Member memberr = fService.getMember(psList.get(i).getBuyerName());
			for(int j = 0; j < psList.size(); j++) {
				String memberId = memberr.getMemberId();
				System.out.println(memberId);
				Image image = fService.getMemberImage(memberId);
				System.out.println(image);
				memberImageList.add(image);
			}
//			System.out.println(memberr);
			member.add(memberr);
		}
		System.out.println(member);
		System.out.println(memberImageList);
		
		Funding f = fService.getFundingInfo(fundingNum);
		
		Member m = (Member)session.getAttribute("loginUser");
		String login = null;
		if(m != null) {
			login = m.getMemberId();
		}
		
		boolean yn = false;
		String writerCheckId = fService.checkWriter(f.getCreatorNum());
		if(!writerCheckId.equals(login)) {
			yn = true;
		}
		
		int dibsCount = fService.getDibsCount(fundingNum);
		 
		 boolean ok = false;
		 ArrayList<FundingDibs> dibs = fService.getDibs(fundingNum);
		 for(int i = 0; i < dibs.size(); i++) {
			 System.out.println(dibs.get(i));
			 if(dibs.get(i).getDibsId().equals(login)) {
				 ok = true;
			 }
		 }
		
		model.addAttribute("psList", psList);
		model.addAttribute("psListCount", psListCount);
		model.addAttribute("bId", fundingNum);
		model.addAttribute("member", member);
		model.addAttribute("memberImageList", memberImageList);
		model.addAttribute("f", f);
		model.addAttribute("yn", yn);
		model.addAttribute("dibsCount", dibsCount);
		model.addAttribute("ok", ok);
		return "fundingSupporter";
	}
	
	// 펀딩 리스트 진행, 종료/최신순, 인기순
//	@RequestMapping("ingList.fund")
//	public String ingList(@RequestParam("ing") Integer ing, @RequestParam("ranking") Integer rank, Model model) {
//		System.out.println(ing);
//		System.out.println(rank);
//		ArrayList<Funding> ingRanking = new ArrayList<>();
//		ArrayList<Funding> endLatest = new ArrayList<>();
//		ArrayList<Funding> endRanking = new ArrayList<>();
//		if(ing != null && rank != null) {
//			if(ing == 1 && rank == 2) {
//				ingRanking = fService.getFundingIngListRanking();
//			}else if(ing == 2 && rank == 1){
//				endLatest = fService.getFundingEndLatest();
//			}else if(ing == 2 && rank == 2) {
//				endRanking = fService.getFundingEndRanking();
//			}
//		}
//		
//		model.addAttribute("ingRanking", ingRanking);
//		model.addAttribute("endLatest", endLatest);
//		model.addAttribute("endRanking", endRanking);
//		return "redirect:fundingList.fund";
//	}
	
	
}
