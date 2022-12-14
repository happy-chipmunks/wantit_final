package com.kh.wantit.funding.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wantit.funding.model.service.FundingService;

@Controller
public class FundingController {
	
	@Autowired
	private FundingService fService;
	
	@RequestMapping("insertFundingBoard.fund")
	public String insertFundingBoard() {
		return "insertFundingBoard";
	}
	
	
}
