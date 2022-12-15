package com.kh.wantit.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wantit.admin.model.service.AdminService;

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
	@RequestMapping("/memberManage.ad")
	public String memberManage() {
		return "adminMemberManage";
	}
	@RequestMapping("/noticeMake.ad")
	public String noticeMake() {
		return "adminNoticeMake";
	}
}
