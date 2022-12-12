package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import member.MemberService;

@Controller
public class memberController {
	
	private MemberService mService;

	@RequestMapping("/memberenroll.me")
	public String enroll() {
		return "myPage_enroll";
	}
}
