package com.kh.wantit.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.wantit.admin.model.exception.AdminException;
import com.kh.wantit.admin.model.service.AdminService;
import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.admin.model.vo.Pagination;
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
	@RequestMapping("/inquiryManage.ad")
	public String inquiryManage() {
		return "adminInquiryManagement";
	}
	@RequestMapping("/adManage.ad")
	public String adManage() {
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
}
