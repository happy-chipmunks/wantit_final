package com.kh.wantit.member.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.wantit.member.Service.MemberService;
import com.kh.wantit.member.exception.MemberException;
import com.kh.wantit.member.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	//회원가입페이지 이동
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
	
	// 중복검사 결과 확인 메서드
		public String getResult(int count) {
			String result = count>0 ? "yes" : "no";
			return result;
		}
	//회원가입 메소드 
	@RequestMapping("/loginfinished.me")
	public String enroll(@ModelAttribute("Member") Member member,@RequestParam("memberPwd2")String memberPwd2,
						@RequestParam("memberAddress") String add1,@RequestParam("memberAddress2") String add2) {
		if(!member.getMemberPwd().equals(memberPwd2)) {
			throw new MemberException("비밀번호가 일치하지 않습니다.");
		}
		String enPwd = bcrypt.encode(member.getMemberPwd());
		member.setMemberPwd(enPwd);
		String alladd = add1.concat(" ").concat(add2);
		member.setMemberAddress(alladd);
		
		int result = mService.enroll(member);
		
		if(result>0){
			return "redirect:/";
		} else {
			throw new MemberException("회원가입에 실패했습니다.");
		}
		
		
	}
	//로그인 메소드
	@RequestMapping("/login.me")
	public String login(@ModelAttribute("Member")Member member,HttpSession session) {
		Member loginUser = mService.login(member);
		
		String rawPwd = member.getMemberPwd();
		String enPwd = loginUser.getMemberPwd();
		
		if(bcrypt.matches(rawPwd, enPwd)) {
			session.setMaxInactiveInterval(1800);
			session.setAttribute("loginUser", loginUser);
			return "redirect:/";
		} else {
			throw new MemberException("로그인에 실패 하셨습니다.");
		}
		
	
	}
	// 아이디 중복 검사 메서드
		@RequestMapping("checkUesrname.me")
		@ResponseBody
		public String checkUserName(@RequestParam("userName")String userName){
			int count = mService.checkUserName(userName);
			return getResult(count);
		}
		// 닉네임 중복 검사 메서드
		@RequestMapping("checkNickName.me")
		@ResponseBody
		public String checkNickName(@RequestParam("nickName")String nickName){
			int count = mService.checkNickName(nickName);
			return getResult(count);
		}
		
		
		
		//회원가입 문자인증 로직 
		@RequestMapping("/sendSMS1.me")
		@ResponseBody
		public String sendSMS(String Phone) {
			
			Random rand = new Random();
			String numStr = "";
			for(int i=0; i<4; i++) {
				String ran = Integer.toString(rand.nextInt(10));
				numStr+=ran;
			}
			
			mService.certifiedmemberPhone(Phone,numStr);
			
			return numStr;
		}
		
		
}
	
	
	
	
	
	
	
	

