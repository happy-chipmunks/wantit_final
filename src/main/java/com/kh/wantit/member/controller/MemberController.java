package com.kh.wantit.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.wantit.member.Service.MemberService;
import com.kh.wantit.member.exception.memberException;
import com.kh.wantit.member.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;

	@RequestMapping("/memberenroll.me")
	public String enroll() {
		return "myPage_enroll";
	}
	
	@RequestMapping("/myPageSupporter.me")
	public String myPageSupporter() {
		return "myPage_sup";
	}
	
	@RequestMapping("/myPageSupporterFunding.me")
	public String myPageSupporterFunding() {
		return "myPage_sup_funding";
	}
	
	@RequestMapping("/myPageSupporterWanting.me")
	public String myPageSupporterWanting() {
		return "myPage_sup_wanting";
	}
	
	@RequestMapping("/myPageSupporterDibs.me")
	public String myPageSupporterDibs() {
		return "myPage_sup_dibs";
	}
	
	@RequestMapping("/myPageSupporterInquiry.me")
	public String myPageSupporterInquiry() {
		return "myPageSupporterInquiry";
	}
	
	@RequestMapping("/myPageSupporterAlarm.me")
	public String myPageSupporterAlarm() {
		return "myPage_sup_alarm";
	}
	
	@RequestMapping("/myPageSupporterFollow.me")
	public String myPageSupporterFollow() {
		return "myPage_sup_follow";
	}
	
	@RequestMapping("/myPageSupporterPayList.me")
	public String myPageSupporterPayList() {
		return "myPage_sup_payList";
	}
	
	@RequestMapping("/myPageCreator.me")
	public String myPageCreator() {
		return "myPage_creator";
	}
	
	@RequestMapping("/myPageCreatorFunding.me")
	public String myPageCreatorFunding() {
		return "myPage_creator_funding";
	}
	
	@RequestMapping("/myPageCreatorInquiry.me")
	public String myPageCreatorInquiry() {
		return "myPage_creator_inquiry";
	}
	
	@RequestMapping("/myPageCreatorAlarm.me")
	public String myPageCreatorAlarm() {
		return "myPage_creator_alarm";
	}
	
	@RequestMapping("/myPageCreatorFollow.me")
	public String myPageCreatorFollow() {
		return "myPage_creator_follow";
	}
	
	@RequestMapping("/myPageCreatorAds.me")
	public String myPageCreatorAds() {
		return "myPage_creator_ads";
	}
	
	
	@RequestMapping("/loginfinished.me")
	public String enroll(@ModelAttribute("Member") Member member,@RequestParam("memberPwd2")String memberPwd2) {
		
		System.out.println(member);
		System.out.println(memberPwd2);
		
		
		member.setPostcode("testpostcode");
		System.out.println(member);
		int a = mService.enroll(member);
		
		System.out.println(a);
		return "redirect:/";
	}
	
	
	}
	
	
	
	
	
	
	
	

