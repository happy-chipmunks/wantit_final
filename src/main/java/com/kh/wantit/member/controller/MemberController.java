package com.kh.wantit.member.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.member.Service.MemberService;
import com.kh.wantit.member.exception.MemberException;
import com.kh.wantit.member.vo.Creator;
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
		return "myPage_sup_fundingList";
	}
	
	@RequestMapping("/myPageSupporterWanting.me")
	public String myPageSupporterWanting() {
		return "myPage_sup_wantingList";
	}
	
	@RequestMapping("/myPageSupporterDibs.me")
	public String myPageSupporterDibs() {
		return "myPage_sup_dibs";
	}
	
	@RequestMapping("/myPageSupporterInquiry.me")
	public String myPageSupporterInquiry() {
		return "myPage_sup_inquiry";
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
	public String myPageCreator(HttpSession session, Model model) {
		String id = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		Member creatorCheck = mService.creatorCheck(id);
		Creator creatorRegistration = mService.creatorRegistration(id);
		
		
		boolean check = false;
		if(creatorCheck.getMemberType() == "creator") {
			check = true;
			
			model.addAttribute("check", check);
		}else {
			model.addAttribute("creatorRegistration", creatorRegistration);
			model.addAttribute("check", check);
		}
		
		return "myPage_creator";
	}
	
	@RequestMapping("/myPageCreatorFunding.me")
	public String myPageCreatorFunding() {
		return "myPage_creator_fundingList";
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
		String alladd = add1 + " // " + add2;
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
	public String login(@ModelAttribute("Member")Member member,HttpSession session,Model model,
						@RequestParam("beforeURL") String beforeURL)  {
		
		Member loginUser = mService.login(member);
		
		if(loginUser == null ) {
			model.addAttribute("msg", "사용자 ID 또는 비밀번호를 잘못 입력했습니다.<br>"
					                  + "입력하신 내용을 다시 확인해주세요.");
			return "myPage_login";
		}
		
		String rawPwd = member.getMemberPwd();
		String enPwd = loginUser.getMemberPwd();
		
		
		if(bcrypt.matches(rawPwd, enPwd)) {
			session.setAttribute("loginUser", loginUser);
			System.out.println(loginUser);
			 if(beforeURL.equals("")) {
				   return "redirect:home.do";    
			   }else{
				   System.out.println(beforeURL);
				   return "redirect:"+ beforeURL;   
			   }
		   }else{
			   session.setAttribute("msg","ID 또는 password를 확인해주세요.");
			   
			   return "myPage_login";
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
		// 로그아웃 메서드
		@RequestMapping("/logout.me")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}
		
		
		@RequestMapping("/myPageinfo.me")
		public String myPageinfo() {
			return "myPage_sup";
		}
		//회원수정사이트로 이동
		@RequestMapping("/updatemyinfo.me")
		public String updatemyinfo() {
			return "myPage_updatemyinfo";
		}
		
		//회원수정 메소드
		@RequestMapping("/updatemember.me")
		public String updatemember(@ModelAttribute Member member,@RequestParam("memberPwd2")String memberPwd2,HttpSession session,
								   @RequestParam("memberAddress") String add1,@RequestParam("memberAddress2") String add2) {
			if(!member.getMemberPwd().equals(memberPwd2)) {
				throw new MemberException("비밀번호가 일치하지 않습니다.");
			}
			String rawPwd = member.getMemberPwd();
			String enPwd = bcrypt.encode(rawPwd);
			member.setMemberPwd(enPwd);
			
			int result = mService.updateInfo(member);
			
			System.out.println(member);
			if(result>0) {
				return "redirect:/myPageinfo.me";
			} else {
				throw new MemberException("회원 정보 수정에 실패하셨습니다.");
			}
			
		}
		
		// 회원 탈퇴 메서드
		@RequestMapping("/deleteMember.me")
		public String deleteMember(HttpSession session) {
			String userName = ((Member)session.getAttribute("loginUser")).getMemberId();
			int result = mService.deleteMember(userName);
			
			if(result>0) {
				session.invalidate();
				return "redirect:/";
			} else {
				throw new MemberException("회원 탈퇴 실패");
			}
		}
		
		//아이디 찾기 페이지이동
		@RequestMapping("/checkId.me")
		public String checkId() {
			return "checkid";
		}
		
		
		@RequestMapping("/findcheckid.me")
		public String findcheckid(@RequestParam("checkname")String checkname,@RequestParam("memberPhone")String memberPhone,
								@RequestParam("memberEmail")String memberEmail,Model model) {
			
			
			
			Member memberFind = new Member();
			memberFind.setMemberName(checkname);
			memberFind.setMemberPhone(memberPhone);
			memberFind.setMemberEmail(memberEmail);
			
			Member resultMember = mService.findmemberId(memberFind);  
			System.out.println(resultMember);
			model.addAttribute("chechIdresult", resultMember);
			
			return "Result_checkid";
		}
		//비밀번호 찾기
		@RequestMapping("/checkPwd.me")
		public String checkPwd() {
			return "checkpwd";
		}
		
		// 마이페이지-크리에이터 등록
		@RequestMapping("/creatorInsert.me")
		public String creatorInsert(HttpServletRequest request, @ModelAttribute Creator c, @RequestParam("file") MultipartFile file, @RequestParam("businessType") char type) {
			String id = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
			c.setCreator(id);
			System.out.println(type);
			if(type == 'N') {
				c.setBusinessType('N');
			}else {
				c.setBusinessType('Y');
			}
			
			System.out.println(file);
			Image i = new Image();
			if(!file.getOriginalFilename().equals("")) {
				String[] returnArr = saveFile(file, request);
				
				if(returnArr[1] != null) {
					i.setImageForm(file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")));
					i.setOriginName(file.getOriginalFilename());
					i.setImageRename(returnArr[1]);
					i.setImageSrc(returnArr[0]);
				}
			}
			
			int result1 = mService.creatorInsert(c);
			int result2 = mService.businessLicense(i);
			
			if(result1 > 0 && result2 > 0) {
				return "redirect:myPageCreator.me";
			}else {
				throw new MemberException("크리에이터 등록 실패");
			}
		}
		
		// 파일 저장
		public String[] saveFile(MultipartFile file, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\member";
			
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			int ranNum = (int)(Math.random()*100000);
			String originFileName = file.getOriginalFilename();
			String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum
														+ originFileName.substring(originFileName.lastIndexOf("."));
			
			String renamePath = folder + "\\" + renameFileName;
			try {
				file.transferTo(new File(renamePath));
			} catch (Exception e) {
				System.out.println("파일 전송 에러 : " + e.getMessage());
			}
			
			String[] returnArr = new String[2];
			returnArr[0] = savePath;
			returnArr[1] = renameFileName;
			
			return returnArr;
		}
		
}
	
	
	
	
	
	
	
	

