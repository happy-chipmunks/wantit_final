package com.kh.wantit.funding.controller;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.exception.FundingException;
import com.kh.wantit.funding.model.service.FundingService;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.funding.model.vo.FundingNotice;
import com.kh.wantit.member.vo.Member;
import com.kh.wantit.pay.vo.Reward;

@Controller
public class FundingController {
	
	@Autowired
	private FundingService fService;
	
	// 펀딩 글 목록
	@RequestMapping("fundingList.fund") 
	public String fundingList(Model model) {
		ArrayList<Funding> fundingList = fService.fundingList();
		ArrayList<Image> imageList = fService.fundingImageList();
//		System.out.println(imageList);
		
		if(fundingList != null && imageList != null) {
			model.addAttribute("fundingList", fundingList);
			model.addAttribute("imageList", imageList);
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
													@RequestParam("rewardTitle") ArrayList<String> rewardTitleArr, @RequestParam("rewardContent") ArrayList<String> rewardContentArr, @RequestParam("rewardLimit") ArrayList<Integer> rewardLimitArr,
													@RequestParam("rewardExpectDate") ArrayList<Date> rewardExpectDateArr, @RequestParam("rewardPrice") ArrayList<Integer> rewardPriceArr, @RequestParam("rewardShipping") ArrayList<Integer> rewardShippingArr) {
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
		for(int i = 0; i < rewardTitleArr.size(); i++) {
			r.setRewardTitle(rewardTitleArr.get(i));
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
			System.out.println(root);
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
			
			System.out.println("파일경로: " + renamePath);
			PrintWriter out = response.getWriter();
			
			out.println(renameFileName);
			out.close();
		}
	
	// 펀딩 오픈 예정 페이지 이동
	@RequestMapping("fundingComingSoon.fund")
	public String fundingComingSoon() {
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
		
		// System.out.println(bId);
		Funding f = fService.getFunding(bId, yn);
		Image img = fService.getImage(bId);
		 System.out.println(img);
		
		if(f != null) {
			mv.addObject("f", f).addObject("img", img).addObject("bId", bId).addObject("m", m).setViewName("fundingMain");
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
		
		System.out.println(bId);
		String writer = fService.getFundingCreator(bId);
		int writerNo = fService.getFundingCreatorNum(writer);
		
		model.addAttribute("count", count);
		model.addAttribute("fnList", fnList);
		model.addAttribute("fundingCreator", fundingCreator);
		model.addAttribute("login", login);
		model.addAttribute("bId", bId);
		model.addAttribute("writerNo", writerNo);
		model.addAttribute("f", f);
		return "fundingNotice";
	}
	
	// 새소식 작성
	@RequestMapping("insertFundingNotice.fund")
	public String insertFundingNotice(@ModelAttribute FundingNotice fn, HttpSession session, @RequestParam("fundingNoticeNum") int fundingNoticeNum, @RequestParam("category") String cate) {
		String writer = ((Member)session.getAttribute("loginUser")).getMemberId();
		fn.setFundingNoticeWriter(writer);
		fn.setFundingNum(fundingNoticeNum);
		fn.setFundingNoticeCategory(cate);
		
		int result = fService.insertFundingNotice(fn);
		
		if(result > 0) {
			return "redirect:fundingNotice.fund";
		}else {
			throw new FundingException("새소식 작성 실패");
		}
		
	}
	
	// 새소식 상세조회
	@RequestMapping("selectFundingNoticeBoard.fund")
	public String selectFundingNoticeBoard(@RequestParam("bId") int bId, @RequestParam("writer") String writer, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		String login = null;
		boolean yn = false;
		if(m != null) {
			login = m.getMemberId();
		}
		if(!writer.equals(login)) {
			yn = true;
		}
		
		FundingNotice fn = fService.getFundingNotice(bId, yn);
//		System.out.println(fn);
//		System.out.println(bId);
		
		if(fn != null) {
			model.addAttribute("login", login);
			model.addAttribute("fn", fn);
			return "fundingNoticeDetail";
		}else {
			throw new FundingException("새소식 상세조회 실패");
		}
	}
	
	// 펀딩하기
//	@RequestMapping("doFunding.fund")
//	public String doFunding(@RequestParam("bId") int bId, HttpSession session, Model model) {
//		String id = ((Member)session.getAttribute("loginUser")).getMemberId();
//		
//		Funding f = fService.getFundingInfo(bId);
//		System.out.println(f);
//		ArrayList<Reward> rList = fService.fundingRewardList(bId);
////		System.out.println(rList);
//		
//		if(rList.size() > 0) {
//			model.addAttribute("rList", rList);
//			model.addAttribute("bId", bId);
//			model.addAttribute("id", id);
//			model.addAttribute("f", f);
//			return "doFundingView";
//		}else{
//			throw new FundingException("펀딩하기 실패");
//		}
//	}
	
	
}
