package com.kh.wantit.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.wantit.admin.model.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService aService;

}
