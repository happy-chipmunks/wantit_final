package com.kh.wantit.wanting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wantit.wanting.model.service.WantingService;

@Controller
public class WantingController {
	
	@Autowired
	private WantingService wService;
	
	@RequestMapping("wantingMain.want")
	public String wantingMain() {
			return "wantingMain";
	}
	
	@RequestMapping("wantingWrite.want")
	public String wantingWrite() {
	      return "wantingWrite";
	}

	@RequestMapping("wantingNotice.want")
	public String wantingNotice() {
	      return "wantingNotice";
	}
	
	@RequestMapping("wantingNoticeDetail.want")
	public String wantingNoticeDetail() {
	      return "wantingNoticeDetail";
	}
	
	

}
