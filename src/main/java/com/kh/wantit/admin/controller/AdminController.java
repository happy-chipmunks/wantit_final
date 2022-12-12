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
	
	
}
