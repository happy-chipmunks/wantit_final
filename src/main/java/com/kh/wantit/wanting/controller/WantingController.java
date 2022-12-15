package com.kh.wantit.wanting.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wantit.member.vo.Member;
import com.kh.wantit.wanting.model.service.WantingService;
import com.kh.wantit.wanting.model.vo.Wanting;

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
	
	@RequestMapping("insertWanting.want")
	public String inserteWanting(HttpSession session, @ModelAttribute Wanting w) {
		String wantingWriter = ((Member)session.getAttribute("loginUser")).getMemberId();
		w.setWantingWriter(wantingWriter);
		
		int result = wService.insertWanting(w);
		return null;
	}
	
	

}
