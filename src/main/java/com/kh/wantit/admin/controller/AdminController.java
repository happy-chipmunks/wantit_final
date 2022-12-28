package com.kh.wantit.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.wantit.admin.model.exception.AdminException;
import com.kh.wantit.admin.model.service.AdminService;
import com.kh.wantit.admin.model.vo.AdminInquiry;
import com.kh.wantit.admin.model.vo.Ads;
import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.admin.model.vo.Pagination;
import com.kh.wantit.admin.model.vo.Reply;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.member.vo.Creator;
import com.kh.wantit.member.vo.Member;

@Controller
public class AdminController {
	@Autowired
	private AdminService aService;
	
	@RequestMapping("/admin.ad")
	public String admin() {
		return "adminMainpage";
	}
	
	@RequestMapping("/projectManage.ad")
	public String projectManage() {
		return "adminPageProject";
	}
	
	@RequestMapping("/reviewManage.ad")
	public String reviewManage() {
		return "adminReportManagement";
	}
	
	@RequestMapping("/noticeManage.ad")
	public String noticeManage() {
		return "adminNotice";
	}
	
	//문의 관리
	@RequestMapping("/inquiryManage.ad")
	public String inquiryManage(@RequestParam(value="page", required=false) Integer page, Model model, @RequestParam(value="reply", required=false) String reply, @RequestParam(value="code", required=false) String code) {
		
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getListCount(1);
		
		Reply reeply = new Reply();
		reeply.setCode(code);
		reeply.setReply(reply);
		
		if(reply != null) {
			System.out.println(reply);
			int result = aService.answerContent(reeply);
			System.out.println(code);
		}
		
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		 
		ArrayList<AdminInquiry> mList = aService.selectAllInquiry(pi, 1);
		ArrayList<Integer> rCountList = new ArrayList<Integer>();
		int count = mList.size();
		
		model.addAttribute("pi", pi);
		model.addAttribute("mList", mList);
		model.addAttribute("mCount", count);
		model.addAttribute("rCountList", rCountList);
		model.addAttribute("Reply", reply);
		model.addAttribute("code", code);		
		return "adminInquiryManagement";
	}
	
	//광고 관리
	@RequestMapping("/adManage.ad")
	public String adManage(@RequestParam(value="page", required=false) Integer page, Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getListCount(1);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		
		ArrayList<Ads> mList = aService.selectAllAds(pi, 1);
		ArrayList<Integer> rCountList = new ArrayList<Integer>();
		int count = mList.size();
		
		model.addAttribute("pi", pi);
		model.addAttribute("mList", mList);
		model.addAttribute("mCount", count);
		model.addAttribute("rCountList", rCountList);
		return "adminAdManagement";
	}
	

	//회원 관리
	@RequestMapping("/memberManage.ad")
	public String memberManage(@RequestParam(value="page", required=false) Integer page, Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getListCount(1);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Member> mList = aService.selectAllMember(pi, 1);
		ArrayList<Integer> rCountList = new ArrayList<Integer>();
		int count = mList.size();
		
		model.addAttribute("pi", pi);
		model.addAttribute("mList", mList);
		model.addAttribute("mCount", count);
		model.addAttribute("rCountList", rCountList);
		return "adminMemberManage";
	}
	
	//모달
	@RequestMapping("/noticeMake.ad")
	public String noticeMake() {
		return "adminNoticeMake";
	}
	
	// 회원 강퇴
	@RequestMapping("deleteMember.ad")
	public String deleteMember(@RequestParam("id") String id) {
		int result = aService.deleteMember(id);
		if(result>0) {
			return "redirect:memberManage.ad";
		} else {
			throw new AdminException("회원 강퇴에 실패하였습니다.");
		}
	}
	
	// 크리에이터 승인 팝업
	@RequestMapping("adminCreatorApproval.ad")
	public String adminCreatorApproval(Model model) {
		ArrayList<Creator> cList = aService.creatorApproval();
		ArrayList<Image> iList = aService.businessImage();
		
		if(cList != null && iList != null) {
			model.addAttribute(cList);
			model.addAttribute(iList);
			return "adminCreatorApproval";
		}else {
			throw new AdminException("크리에이터 승인 팝업 불러오는 것에 실패하였습니다.");
		}
		
	}
}
