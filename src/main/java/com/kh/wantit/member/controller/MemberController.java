package com.kh.wantit.member.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.wantit.admin.model.service.AdminService;
import com.kh.wantit.admin.model.vo.Ads;
import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.admin.model.vo.Pagination;
import com.kh.wantit.common.model.vo.Alarm;
import com.kh.wantit.common.model.vo.BannerImage;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.service.FundingService;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.funding.model.vo.FundingMessage;
import com.kh.wantit.funding.model.vo.Review;
import com.kh.wantit.member.Service.MemberService;
import com.kh.wantit.member.exception.MemberException;
import com.kh.wantit.member.vo.Creator;
import com.kh.wantit.member.vo.Member;
import com.kh.wantit.pay.service.PayService;
import com.kh.wantit.pay.vo.PaySchedule;
import com.kh.wantit.wanting.model.service.WantingService;
import com.kh.wantit.wanting.model.vo.Wanting;

@Controller
@SessionAttributes
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private PayService pService;
	
	@Autowired
	private FundingService fService;
	
	@Autowired
	private WantingService wService;
	
	@Autowired
	private AdminService aService;

	
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
	public String myPageSupporterWanting(@RequestParam(value = "page", required = false) Integer page, HttpSession session, Model model) {
		String id = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		int currentPage = 1;
		if(page != null) 
			currentPage = page;
		
		ArrayList<Integer> wantingNumList = wService.selectWantingNumList(id);
		PageInfo pi = Pagination.getPageInfo(currentPage, wantingNumList.size(), 6);
		ArrayList<Wanting> wantingList = wService.selectAttendWantList(pi, wantingNumList);
		ArrayList<Image> imageList = wService.selectImageList();
		
		model.addAttribute("wantingList", wantingList);
		model.addAttribute("imageList", imageList);
		model.addAttribute("pi", pi);
		
		
		
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
	
	@RequestMapping("/myPageSupporterFollow.me")
	public String myPageSupporterFollow() {
		return "myPage_sup_follow";
	}
	
	@RequestMapping("/myPageSupporterPayList.me")
	public String myPageSupporterPayList(@RequestParam(value = "page", required = false) Integer page,  
																		HttpSession session, Model model) {
		String userNickName = ((Member)session.getAttribute("loginUser")).getMemberNickname();
		int currentPage = 1;
		if(page != null) 
			currentPage = page;
		
		int payListCount = pService.getPayListCount(userNickName);
		PageInfo pi = Pagination.getPageInfo(currentPage, payListCount, 5);
		ArrayList<PaySchedule> payScheduleList = pService.selectPayList(pi, userNickName);
		ArrayList<Funding> payFundList = new ArrayList<Funding>();
		ArrayList<Image> imageList = fService.fundingImageList();
		
		ArrayList<Boolean> alreadyWriteReview = new ArrayList<Boolean>();
		
		
		for(PaySchedule p : payScheduleList) {
			Funding fund = fService.getFunding(Integer.parseInt(p.getFundingNum()), false);
			
			Review r = new Review();
			r.setReviewer(((Member)session.getAttribute("loginUser")).getMemberId());
			r.setFundingNum(Integer.parseInt(p.getFundingNum()));
			
			int checkExistReview = fService.checkExistReview(r);
			if(checkExistReview == 1) 
				alreadyWriteReview.add(true);
			 else 
				alreadyWriteReview.add(false);
			
			payFundList.add(fund);
		}
		
		model.addAttribute("payScheduleList", payScheduleList);
		model.addAttribute("payFundList", payFundList);
		model.addAttribute("imageList", imageList);
		model.addAttribute("alreadyWriteReviewList", alreadyWriteReview);
		model.addAttribute("pi", pi);
		
		
		return "myPage_sup_payList";
	}
	@RequestMapping("reviewPage.me")
	public String insertReview(@RequestParam("fundingNum") int fundingNum, @RequestParam("fundingTitle") String fundingTitle,
													@RequestParam("rewardBuyList") String buyList, @RequestParam("creatorNum") int creatorNum, 
													Model model) {
		
		model.addAttribute("fundingNum", fundingNum);
		model.addAttribute("fundingTitle", fundingTitle);
		model.addAttribute("buyList", buyList);
		model.addAttribute("creatorNum", creatorNum);
		return "../review/writeReview";
	}
	
	@RequestMapping("insertReview.me")
	public String insertReview(@RequestParam("fundingNum") int fundingNum, @RequestParam("reviewRating") double rating,
													@RequestParam("reviewContent") String reviewContent, HttpSession session, 
													@RequestParam("creatorNum") int creatorNum, Model model) {
		String userId = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		Review review = new Review();
		review.setFundingNum(fundingNum);
		review.setReviewContent(reviewContent);
		review.setReviewRating(rating);
		review.setCreatorNum(creatorNum);
		review.setReviewer(userId);
		
		System.out.println(review);
		
		int result = fService.insertReview(review);
		
		if(result > 0) {
			model.addAttribute("msg", "리뷰가 작성되었습니다 !");
		} else {
			//에러처리
		}
		return "../review/insertReviewResult";
	}
	
	
	
	@RequestMapping("myPage_sup_message.me")
	public String myPagesupMessage(HttpSession session, @RequestParam(value="page", required=false) Integer page, Model model) {
		String id = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		int currentPage = 1;
		if(page != null && page > 1) {
			currentPage = page;
		}
		
		int dontReadListCount = mService.getMsgDontReadListCount(id);
		int senderMsgListCount = mService.getSenderMsgListCount(id);
		System.out.println(senderMsgListCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, senderMsgListCount, 10);
		
		ArrayList<FundingMessage> senderMsgList = mService.getSenderMsgList(id, pi);
		
		if(senderMsgList != null) {
			model.addAttribute("senderMsgList", senderMsgList);
			model.addAttribute("pi", pi);
			model.addAttribute("dontReadListCount", dontReadListCount);
			model.addAttribute("id", id);
			
			return "myPage_sup_message";
		}else {
			throw new MemberException("쪽지함 목록 보기 실패");
		}
	}
	
	@RequestMapping("/myPageCreator.me")
	public String myPageCreator(HttpSession session, Model model) {
		String id = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		String creatorCheck = mService.creatorCheck(id);
		Creator creatorRegistration = mService.creatorRegistration(id);
		

		Image cimage = new Image();
		cimage.setImageBoardCate(9);
		cimage.setImageBoardId(id);
		
		 Image img = mService.selectcImage(cimage);
		 System.out.println("크리에이터페이지 :"+img);
		
		 boolean check = false;
			if(img != null && creatorCheck.equals("creator")) { // 이미지있음 , 크리에이터임
				check = true;
				session.setAttribute("icmage",img.getImageRename());
				session.setAttribute("creatorRegistration", creatorRegistration);
				session.setAttribute("check", check);
			}else if(img == null && creatorCheck.equals("creator")) { // 이미지 없음 , 크리에이터임
				check = true;
				session.setAttribute("icmage",null);
				session.setAttribute("creatorRegistration", creatorRegistration);
				session.setAttribute("check", check);
			}else if(img != null && !creatorCheck.equals("creator")){// 이미지 있음 크리에이터 아님
				check = false;
				session.setAttribute("icmage",img.getImageRename());
				session.setAttribute("creatorRegistration", creatorRegistration);
				session.setAttribute("check", check);
			}else if(img == null &&  !creatorCheck.equals("creator")) {// 이미지 없고 크리에이터 아님
				check = false;
				session.setAttribute("icmage",null);
				session.setAttribute("creatorRegistration", creatorRegistration);
				session.setAttribute("check", check);
			}
			return "myPage_creator";
	}		
		 
		 
		 
	
	@RequestMapping("/myPageCreatorFunding.me")
	public String myPageCreatorFunding(HttpSession session, Model model) {
		String id = ((Member)session.getAttribute("loginUser")).getMemberId();
		ArrayList<Funding> myFundingList = fService.getMyFundingList(id);
		ArrayList<Image> imageList = fService.fundingImageList();
		
		model.addAttribute("fundingList", myFundingList);
		model.addAttribute("imageList", imageList);
		
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
	public String myPageCreatorAds(HttpSession session, Model model) {
		String userId = ((Member)session.getAttribute("loginUser")).getMemberId();
		ArrayList<Funding> fundingList = fService.getUserFundingList(userId);
		
		model.addAttribute("fundingList", fundingList);
		return "myPage_creator_ads";
	}
	
	@RequestMapping("adsRequest.me")
	public String adsRequest(@ModelAttribute Ads ads, @RequestParam("file") MultipartFile file, 
												HttpServletRequest req, Model model) {
		System.out.println(ads);
		int insertAds = aService.insertAds(ads);
		
		Image img = new Image();
		String[] returnArr = saveFile(file, req);
		String file2 = file.getOriginalFilename();
		if(returnArr[1] != null) {
			img.setImageForm(file2.substring(file2.lastIndexOf(".")));
			img.setOriginName(file.getOriginalFilename());
			img.setImageRename(returnArr[1]);
			img.setImageSrc(returnArr[0]);
			img.setImageBoardCate(8);
			img.setImageLevel(0);
			img.setImageBoardId(String.valueOf(ads.getFundingNum()));
		}
		
		int result = mService.insertmemberImage(img);
		int imageNum = mService.getImageNum(img);
		
		BannerImage bi = new BannerImage();
		bi.setStartDate(ads.getAdsStart());
		bi.setEndDate(ads.getAdsEnd());
		bi.setImageNum(imageNum);
		
		int insertBannerImage = aService.insertBannerImage(bi);
		
		if(insertAds > 0 && result > 0 && insertBannerImage <= 0) {
			throw new MemberException("광고 의뢰 실패");
		} else {
			return "redirect:myPageCreator.me";
		}
		
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
				 
				 
				 Image image = new Image();
				 image.setImageBoardCate(3);
				 image.setImageBoardId(loginUser.getMemberId());
//시작				 
//				 Image cimage = new Image();
//				 cimage.setImageBoardCate(9);
//				 cimage.setImageBoardId(loginUser.getMemberId());
				 
				 
			
//				 Image cimg = mService.selectcImage(cimage);
//				 System.out.println(cimg);
				 
				
				 Image img = mService.selectImage(image);
			System.out.println(image);
				 System.out.println(img);
//				 Image cimg = mService.selectImage(cimage);
				if(img == null ) {
					return "redirect:home.do";    
				}else {
					session.setAttribute("image", img.getImageRename());
					return "redirect:home.do";  
				}
				 
			   }else{
				   System.out.println(beforeURL);
				   return "redirect:"+ beforeURL;   
			   }
		   }else{
			   model.addAttribute("msg","ID 또는 password를 확인해주세요.");
			   
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
		public String updatemember(@ModelAttribute Member member,HttpSession session,
								   @RequestParam("memberAddress") String add1,@RequestParam("memberAddress2") String add2) {
			
			String Address = add1+"// "+add2;
			System.out.println("=================================");
			System.out.println(Address);
			System.out.println("=================================");
			System.out.println(member);
			member.setMemberAddress(Address);
			
			int result = mService.updateInfo(member);
			
			System.out.println(member);
			if(result>0) {
				session.removeAttribute("loginUser");
				session.setAttribute("loginUser", member);
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
		//비밀번호 페이지 이동(아이디조회)
		@RequestMapping("/checkPwd.me")
		public String checkPwd() {
			return "checkpwd";
		}
		//비밀번호 찾기페이지에서 아이디찾기
		@RequestMapping("/findonecheckPwd.me")
		public String findcheckPwd(@RequestParam("checkId") String checkId,Model model) {
			
			Member findPwd = new Member();
			findPwd.setMemberId(checkId);
			System.out.println(checkId);
			
			Member PwdMember = mService.findcheckPwd(findPwd);
			String realemail = PwdMember.getMemberEmail();
			String eemail1 = realemail.substring(0, 2)+"*****";
			String eemail2 = realemail.substring(realemail.indexOf("@")+1, realemail.indexOf("@")+2)+"*****";
			String eemail3 = realemail.substring(realemail.lastIndexOf("."));
			String eemail = eemail1 + "@" + eemail2 + eemail3;
			
			PwdMember.setMemberEmail(eemail);
			
			
			model.addAttribute("findPwdone", PwdMember);
			
			
			return "checkpwd2";
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
	  @RequestMapping("findtwocheckPwd.me")
	  @ResponseBody
	  public String findtwocheckPwd(@RequestParam("name") String name ,@RequestParam("email") String email) {
		    System.out.println("이메일 인증 요청이 들어옴!");
			System.out.println("이메일 인증 이메일 : " + email);
			/* System.out.println(memberId); */
			System.out.println(name);
			System.out.println(email);
			
			Member checkIdemail = new Member();
			checkIdemail.setMemberName(name); 
			checkIdemail.setMemberEmail(email);
			
			int checkIdEmail2 = mService.checkMember(checkIdemail); 
			System.out.println(checkIdEmail2);//이값확인하기 
			
			if(checkIdEmail2 > 0) {
				//인증번호(난수) 생성
				Random random = new Random();
				int checkNum = random.nextInt(888888) + 111111;
				
				
				    String subject = "[WANTIT] 본인확인 이메일 인증";
			        String content = "홈페이지에 방문해주셔서 감사합니다.<br>"
			        				+ "[WANTIT]비밀번호 찾기 인증 이메일입니다.<br>"
			        				+ "인증번호는"+checkNum+"입니다.<br>"
			        				+"해당 인증번호를 인증번호 확인란에 기입해주세요.";
			        String from = "WANTIT<jaedog0818@naver.com>";
			        String to = email;
			        
			       
			        
			        try {
			            MimeMessage mail = mailSender.createMimeMessage();
			            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
			            // true는 멀티파트 메세지를 사용하겠다는 의미
			            
			            /*
			             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
			             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
			             */
			            
			            mailHelper.setFrom(from);
			            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
			            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
			            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
			            mailHelper.setTo(to);
			            mailHelper.setSubject(subject);
			            mailHelper.setText(content, true);
			            // true는 html을 사용하겠다는 의미입니다.
			            
			            /*
			             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
			             */
			            
			            mailSender.send(mail);
			            
			        } catch(Exception e) {
			            e.printStackTrace();
			        }
			        String num = Integer.toString(checkNum);
			        
			        return num;
			    }else {
					
			    	return "error";
			    }
			}
			
			
			
	  
	  //비밀번호 변경창 이동
	  	@RequestMapping("checkpwdfinal.me")
	  	public String checkpwdfinal(@RequestParam("memberId") String id,Model model) {
	  		System.out.println("이동하는값"+id);//사용자아이디 확인
	  		
	  		model.addAttribute("memberId",id);
	  		return "checkpwd3";
	  	}
	  
	  @RequestMapping("checkpwdfinal1.me")//비밀번호 찾기 다시 구현 
	  public String checkpwdfinal1(@RequestParam("memberId") String memberId,@RequestParam("memberPwd") String memberPwd) {
		  System.out.println("가져온값 :"+memberId);
		  
		  
		  Member updatePwd = new Member();
		  updatePwd.setMemberId(memberId);
		  updatePwd.setMemberPwd(memberPwd);
		 System.out.println("새로운 비밀번호 :"+updatePwd.getMemberPwd());
		  
		 String rawPwd = updatePwd.getMemberPwd();
		 String enPwd = bcrypt.encode(rawPwd);
		 updatePwd.setMemberPwd(enPwd);
		  
		  System.out.println("새로운비번 객체"+updatePwd);
		 int result = mService.updateenPwd(updatePwd); 
		  
		 System.out.println(result);
		  if(result > 0) {
			  return  "redirect:/";
		  }else {
			  return null;
		  }

	  
	  }
	 // 서포터 프로필 사진 업로드  	
	 @RequestMapping("insertMemberImg.me")
	 public String memberImg(@RequestParam("file") MultipartFile file ,@RequestParam("memberId") String memberId ,HttpServletRequest request ,Model model,
			 HttpSession session) {
		 System.out.println("memberId :"+memberId);
		 System.out.println("파일목록 :"+file);
		


		 Image m = new Image();
		 m.setImageBoardCate(3);
		 m.setImageBoardId(memberId);
		 if(!file.equals("")) {
			 int supdelete = mService.deleteboforeImage(m); 
			 
			 
		String[] returnArr = saveFile(file, request);
		 System.out.println(returnArr);
		 String file2 = file.getOriginalFilename();
		 System.out.println("파일 이름 :"+file2);
		 if(returnArr[1] != null) {
			 
			    m.setImageForm(file2.substring(file2.lastIndexOf(".")));
				m.setOriginName(file.getOriginalFilename());
				m.setImageRename(returnArr[1]);
				m.setImageSrc(returnArr[0]);
				m.setImageBoardCate(3);
				m.setImageLevel(0);
				m.setImageBoardId(memberId);
			}
		 
		 System.out.println("세팅후파일 :"+m);
		} 
		 int result = mService.insertmemberImage(m);//사진등록
		 
		 if(result > 0) {
			 Image image = new Image();
			 image.setImageBoardCate(3);
			 image.setImageBoardId(memberId);
			 
			 Image img = mService.selectImage(image);
			 ArrayList<Integer> allProfileImage = mService.allProfileImage(memberId);
			 System.out.println(allProfileImage);
			 System.out.println(img);
				/* model.addAttribute("image",img.getImageRename()); */
				 session.setAttribute("image", img.getImageRename()); 
		 }else {
			 throw  new MemberException("프로필 사진등록 실패");
		 }
		 return "myPage_sup";
}	
	 
	 

	@RequestMapping("insertcreatorMemberImg.me")	//크리에이터 사진등록
	public String insertcreatorMemberImg(@RequestParam("file") MultipartFile file1 ,@RequestParam("memberId") String memberId ,HttpServletRequest request ,Model model,
			 HttpSession session) {
		 System.out.println("memberId :"+memberId);
		 System.out.println("파일목록 :"+file1);
		
		 Image cm = new Image();
		 cm.setImageBoardCate(9);
		 cm.setImageBoardId(memberId);
		 
		
		
		 System.out.println("크리에이터이미지 수정"+cm);
		 if(!file1.equals("")) {
			 int credelete = mService.deleteboforecImage(cm);
			 
			 
			 String[] returnArr = saveFile(file1, request);
			 System.out.println(returnArr);
			 String file3 = file1.getOriginalFilename();
			 System.out.println("파일 이름 :"+file3);
			 if(returnArr[1] != null) {
				 
				 cm.setImageForm(file3.substring(file3.lastIndexOf(".")));
				 cm.setOriginName(file1.getOriginalFilename());
				 cm.setImageRename(returnArr[1]);
				 cm.setImageSrc(returnArr[0]);
				 cm.setImageBoardCate(9);
				 cm.setImageLevel(0);
				 cm.setImageBoardId(memberId);
		 }
			 System.out.println("크리에이터세팅후파일 :"+cm);
	}
		 int result = mService.insertcreatorImage(cm);//크리에이터사진등록
		 
		 if(result > 0) {
			 Image image = new Image();
			 image.setImageBoardCate(9);
			 image.setImageBoardId(memberId);
			 
			 Image img = mService.selectcreatorImage(image);
			 

					 session.setAttribute("icmage", img.getImageRename()); 
	
		}else {
			 throw  new MemberException("프로필 삭제 후  등록");
		}
		 return "myPage_creator";
}
	
	
	
	@RequestMapping("deletesupMemberImg.me")//서포터프로필 삭제
	public String deletesupMemberImg(@RequestParam("filedelete") String filedelete,HttpSession session,Model model) {
		
		System.out.println(filedelete);
		
		int result = mService.deletesupImg(filedelete);
		System.out.println(result);
		if(result > 0) {
			session.setAttribute("image", null);
			return "myPage_sup";
		}else {
			return null;
		}
		
	}
	
	@RequestMapping("deletecreMemberImg.me")
	public String deletecreMemberImg(@RequestParam("cfiledelete") String cfiledelete,HttpSession session) {
		
		int result = mService.deletesupImg(cfiledelete);
		
		if(result > 0) {
			session.setAttribute("icmage", null);
		}
		return "myPage_creator";
	}
	
	 // 크리에이터 받은 쪽지
		@RequestMapping("creatorMessage.me")
		public String creatorMessage(Model model, HttpSession session, @RequestParam(value="page", required=false) Integer page) {
			Member m = (Member)session.getAttribute("loginUser");
			String id = m.getMemberId();
			
			int currentPage = 1;
			if(page != null && page > 1) {
				currentPage = page;
			}
			
			int dontReadListCount = mService.getMsgDontReadListCount(id);
			int msgListCount = mService.getMsgListCount(id);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, msgListCount, 10);
			
			ArrayList<FundingMessage> msgList = mService.getMsgList(id, pi);
			if(msgList != null) {
				model.addAttribute("msgList", msgList);
				model.addAttribute("pi", pi);
				model.addAttribute("dontReadListCount", dontReadListCount);
				model.addAttribute("id", id);
				return "myPage_creator_message";
			}else {
				throw new MemberException("쪽지 불러오기 실패. 다시 시도해 주세요");
			}
		}
		
		// 크리에이터 문의 답변
		@RequestMapping("replyMessage.me")
		public String replyMessage(@ModelAttribute FundingMessage fm, HttpSession session) {
			String receiver = ((Member)session.getAttribute("loginUser")).getMemberId();
			
			System.out.println(fm);
			int result = 0;
			FundingMessage fmr = new FundingMessage();
			fmr.setMessageCode(fm.getMessageCode());
			fmr.setReplyContent(fm.getReplyContent());
			System.out.println(fmr);
			if(receiver.equals(fm.getReceiver())) {
				result = mService.replyMessage(fmr);
			}
			
			if(result > 0) {
				return "redirect:creatorMessage.me";
			}else {
				throw new MemberException("답변하기 실패");
			}
			
		}
		
		
		// 마이페이지 알림 리스트 보내면서 페이지 이동
		@RequestMapping("/myPageSupporterAlarm.me")
		public String myPageSupporterAlarm(@RequestParam(value="page", required=false) Integer page, Model model, HttpSession session) {
			String id = ((Member)session.getAttribute("loginUser")).getMemberId();
			
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			int listCount = wService.getAlarmListCount(id);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
			
			ArrayList<Alarm> alarmList = wService.selectAlarmListPaging(pi, id); // 메소드는 그냥 원팅 꺼 가져옴
			if(alarmList != null) {
				model.addAttribute("alarmList", alarmList);
				return "myPage_sup_alarm";
			} else {
				throw new MemberException("마이페이지 알림 불러오기 실패");
			}
		}
	
}
	
	
	
	
	
	
	
	

