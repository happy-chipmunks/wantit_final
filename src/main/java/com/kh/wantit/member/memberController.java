package com.kh.wantit.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Handles requests for the application home page.
 */
@Controller
public class memberController {
	
	//하하
	
	//메인에서 로그인페이지 이동
	@RequestMapping("/memberenroll.me")
	   public String enroll() {
	      return "myPage_enroll";
	   }
	   //마이페이지메인(서포터)
	   @RequestMapping("/myPageSupporter.me")
	   public String myPageSupporter() {
	      return "myPage_sup";
	   }
	   //마이페이지 서포터 펀딩페이지
	   @RequestMapping("/myPageSupporterFunding.me")
	   public String myPageSupporterFunding() {
	      return "myPage_sup_funding";
	   }
	   //마이페이지 서포터 원팅페이지
	   @RequestMapping("/myPageSupporterWanting.me")
	   public String myPageSupporterWanting() {
	      return "myPage_sup_wanting";
	   }
	   //마이페이지 서포터 찜
	   @RequestMapping("/myPageSupporterDibs.me")
	   public String myPageSupporterDibs() {
	      return "myPage_sup_dibs";
	   }
	   //마이페이지 서포터 문의
	   @RequestMapping("/myPageSupporterInquiry.me")
	   public String myPageSupporterInquiry() {
	      return "myPageSupporterInquiry";
	   }
	   //마이페이지 서포터 알림
	   @RequestMapping("/myPageSupporterAlarm.me")
	   public String myPageSupporterAlarm() {
	      return "myPage_sup_alarm";
	   }
	   //마이페이지 서포터 팔로우
	   @RequestMapping("/myPageSupporterFollow.me")
	   public String myPageSupporterFollow() {
	      return "myPage_sup_follow";
	   }
	   //마이페이지 서포터 결제내역
	   @RequestMapping("/myPageSupporterPayList.me")
	   public String myPageSupporterPayList() {
	      return "myPage_sup_payList";
	   }
	   //마이페이지 크리에이터 페이지
	   @RequestMapping("/myPageCreator.me")
	   public String myPageCreator() {
	      return "myPage_creator";
	   }
	   //마이페이지 크리에이터 펀딩페이지
	   @RequestMapping("/myPageCreatorFunding.me")
	   public String myPageCreatorFunding() {
	      return "myPage_creator_funding";
	   }
	   //마이페이지 크리에이터 문의페이지
	   @RequestMapping("/myPageCreatorInquiry.me")
	   public String myPageCreatorInquiry() {
	      return "myPage_creator_inquiry";
	   }
	   //마이페이지 크리에이터 알림
	   @RequestMapping("/myPageCreatorAlarm.me")
	   public String myPageCreatorAlarm() {
	      return "myPage_creator_alarm";
	   }
	   // 마이페이지 크리에이터 팔로우
	   @RequestMapping("/myPageCreatorFollow.me")
	   public String myPageCreatorFollow() {
	      return "myPage_creator_follow";
	   }
	   // 마이페이지 크리에이터 광고의뢰
	   @RequestMapping("/myPageCreatorAds.me")
	   public String myPageCreatorAds() {
	      return "myPage_creator_ads";
	   }
	   
	   
	
	
}
