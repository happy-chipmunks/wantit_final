package com.kh.wantit.member.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import java.util.Random;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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

	@Autowired
	private JavaMailSender mailSender;

	// 회원가입페이지 이동
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
	public String myPageCreator() {
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
		String result = count > 0 ? "yes" : "no";
		return result;
	}

	// 회원가입 메소드
	@RequestMapping("/loginfinished.me")
	public String enroll(@ModelAttribute("Member") Member member, @RequestParam("memberPwd2") String memberPwd2,
			@RequestParam("memberAddress") String add1, @RequestParam("memberAddress2") String add2) {
		if (!member.getMemberPwd().equals(memberPwd2)) {
			throw new MemberException("비밀번호가 일치하지 않습니다.");
		}
		String enPwd = bcrypt.encode(member.getMemberPwd());
		member.setMemberPwd(enPwd);
		String alladd = add1.concat(" ").concat(add2);
		member.setMemberAddress(alladd);

		int result = mService.enroll(member);

		if (result > 0) {
			return "redirect:/";
		} else {
			throw new MemberException("회원가입에 실패했습니다.");
		}

	}
	// 로그인 메소드

	@RequestMapping("/login.me")
	public String login(@ModelAttribute("Member") Member member, HttpSession session, Model model,
			@RequestParam("beforeURL") String beforeURL) {

		Member loginUser = mService.login(member);

		if (loginUser == null) {
			model.addAttribute("msg", "사용자 ID 또는 비밀번호를 잘못 입력했습니다.<br>" + "입력하신 내용을 다시 확인해주세요.");
			return "myPage_login";
		}

		String rawPwd = member.getMemberPwd();
		String enPwd = loginUser.getMemberPwd();

		if (bcrypt.matches(rawPwd, enPwd)) {
			session.setAttribute("loginUser", loginUser);
			System.out.println(loginUser);
			if (beforeURL.equals("")) {
				return "redirect:home.do";
			} else {
				System.out.println(beforeURL);
				return "redirect:" + beforeURL;
			}
		} else {
			model.addAttribute("msg", "ID 또는 password를 확인해주세요.");

			return "myPage_login";
		}
	}

	// 아이디 중복 검사 메서드
	@RequestMapping("checkUesrname.me")
	@ResponseBody
	public String checkUserName(@RequestParam("userName") String userName) {
		int count = mService.checkUserName(userName);
		return getResult(count);
	}

	// 닉네임 중복 검사 메서드
	@RequestMapping("checkNickName.me")
	@ResponseBody
	public String checkNickName(@RequestParam("nickName") String nickName) {
		int count = mService.checkNickName(nickName);
		return getResult(count);
	}

	// 회원가입 문자인증 로직
	@RequestMapping("/sendSMS1.me")
	@ResponseBody
	public String sendSMS(String Phone) {

		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}

		mService.certifiedmemberPhone(Phone, numStr);

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

	// 회원수정사이트로 이동
	@RequestMapping("/updatemyinfo.me")
	public String updatemyinfo() {
		return "myPage_updatemyinfo";
	}

	// 회원수정 메소드
	@RequestMapping("/updatemember.me")
	public String updatemember(@ModelAttribute Member member, @RequestParam("memberPwd2") String memberPwd2,
			HttpSession session, @RequestParam("memberAddress") String add1,
			@RequestParam("memberAddress2") String add2) {
		if (!member.getMemberPwd().equals(memberPwd2)) {
			throw new MemberException("비밀번호가 일치하지 않습니다.");
		}
		String rawPwd = member.getMemberPwd();
		String enPwd = bcrypt.encode(rawPwd);
		member.setMemberPwd(enPwd);

		int result = mService.updateInfo(member);

		System.out.println(member);
		if (result > 0) {
			return "redirect:/myPageinfo.me";
		} else {
			throw new MemberException("회원 정보 수정에 실패하셨습니다.");
		}

	}

	// 회원 탈퇴 메서드
	@RequestMapping("/deleteMember.me")
	public String deleteMember(HttpSession session) {
		String userName = ((Member) session.getAttribute("loginUser")).getMemberId();
		int result = mService.deleteMember(userName);

		if (result > 0) {
			session.invalidate();
			return "redirect:/";
		} else {
			throw new MemberException("회원 탈퇴 실패");
		}
	}

	// 아이디 찾기 페이지이동
	@RequestMapping("/checkId.me")
	public String checkId() {
		return "checkid";
	}

	@RequestMapping("/findcheckid.me")
	public String findcheckid(@RequestParam("checkname") String checkname,
			@RequestParam("memberPhone") String memberPhone, @RequestParam("memberEmail") String memberEmail,
			Model model) {

		Member memberFind = new Member();
		memberFind.setMemberName(checkname);
		memberFind.setMemberPhone(memberPhone);
		memberFind.setMemberEmail(memberEmail);

		Member resultMember = mService.findmemberId(memberFind);
		System.out.println(resultMember);
		model.addAttribute("chechIdresult", resultMember);

		return "Result_checkid";
	}

	// 비밀번호 페이지 이동(아이디조회)
	@RequestMapping("/checkPwd.me")
	public String checkPwd() {
		return "checkpwd";
	}

	// 비밀번호 찾기페이지에서 아이디찾기
	@RequestMapping("/findonecheckPwd.me")
	public String findcheckPwd(@RequestParam("checkId") String checkId, Model model) {

		Member findPwd = new Member();
		findPwd.setMemberId(checkId);
		System.out.println(checkId);

		Member PwdMember = mService.findcheckPwd(findPwd);
		String realemail = PwdMember.getMemberEmail();
		String eemail1 = realemail.substring(0, 2) + "*****";
		String eemail2 = realemail.substring(realemail.indexOf("@") + 1, realemail.indexOf("@") + 2) + "*****";
		String eemail3 = realemail.substring(realemail.lastIndexOf("."));
		String eemail = eemail1 + "@" + eemail2 + eemail3;

		PwdMember.setMemberEmail(eemail);

		model.addAttribute("findPwdone", PwdMember);

		return "checkpwd2";
	}

	@RequestMapping("findtwocheckPwd.me")
	@ResponseBody
	public String findtwocheckPwd(@RequestParam("name") String name, @RequestParam("email") String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		/* System.out.println(memberId); */
		System.out.println(name);
		System.out.println(email);

		Member checkIdemail = new Member();
		checkIdemail.setMemberName(name);
		checkIdemail.setMemberEmail(email);

		int checkIdEmail2 = mService.checkMember(checkIdemail);
		System.out.println(checkIdEmail2);// 이값확인하기

		if (checkIdEmail2 > 0) {
			// 인증번호(난수) 생성
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;

			String subject = "[WANTIT] 본인확인 이메일 인증";
			String content = "홈페이지에 방문해주셔서 감사합니다.<br>" + "[WANTIT]비밀번호 찾기 인증 이메일입니다.<br>" + "인증번호는" + checkNum
					+ "입니다.<br>" + "해당 인증번호를 인증번호 확인란에 기입해주세요.";
			String from = "WANTIT<wjdche94@naver.com>";
			String to = email;

			try {
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
				// true는 멀티파트 메세지를 사용하겠다는 의미

				/*
				 * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 MimeMessageHelper mailHelper = new
				 * MimeMessageHelper(mail,"UTF-8");
				 */

				mailHelper.setFrom(from);
				// 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
				// 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
				// mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
				mailHelper.setTo(to);
				mailHelper.setSubject(subject);
				mailHelper.setText(content, true);
				// true는 html을 사용하겠다는 의미입니다.

				/*
				 * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
				 */

				mailSender.send(mail);

			} catch (Exception e) {
				e.printStackTrace();
			}
			String num = Integer.toString(checkNum);

			return num;
		} else {

			return "error";
		}
	}

	// 비밀번호 변경창 이동
	@RequestMapping("checkpwdfinal.me")
	public String checkpwdfinal(@RequestParam("memberId") String id, Model model) {
		System.out.println("이동하는값" + id);// 사용자아이디 확인

		model.addAttribute("memberId", id);
		return "checkpwd3";
	}

	@RequestMapping("checkpwdfinal1.me")
	public String checkpwdfinal1(@RequestParam("memberId") String memberId,
			@RequestParam("memberPwd") String memberPwd) {
		System.out.println("가져온값 :" + memberId);

		Member updatePwd = new Member();
		updatePwd.setMemberId(memberId);
		updatePwd.setMemberPwd(memberPwd);
		System.out.println("새로운 비밀번호 :" + updatePwd.getMemberPwd());

		String newPwd = updatePwd.getMemberPwd();
		String newenPwd = bcrypt.encode(newPwd);
		updatePwd.setMemberPwd(newenPwd);

		System.out.println(updatePwd);
		int result = mService.updateenPwd(updatePwd);

		System.out.println(result);
		if (result > 0) {
			return "redirect:/";
		} else {
			return null;
		}

	}

}
