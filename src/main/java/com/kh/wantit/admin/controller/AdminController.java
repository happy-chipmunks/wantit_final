package com.kh.wantit.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.wantit.admin.model.exception.AdminException;
import com.kh.wantit.admin.model.service.AdminService;
import com.kh.wantit.admin.model.vo.AFunding;
import com.kh.wantit.admin.model.vo.AReply;
import com.kh.wantit.admin.model.vo.AdminInquiry;
import com.kh.wantit.admin.model.vo.Ads;
import com.kh.wantit.admin.model.vo.FundingReport;
import com.kh.wantit.admin.model.vo.NReply;
import com.kh.wantit.admin.model.vo.Notice;
import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.admin.model.vo.Pagination;
import com.kh.wantit.admin.model.vo.Reply;
import com.kh.wantit.admin.model.vo.ReviewReport;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.member.vo.Creator;
import com.kh.wantit.member.vo.Member;

@Controller
public class AdminController {
	@Autowired
	private AdminService aService;

	@RequestMapping("/admin.ad")
	public String admin() {
		return "adminMainpage";
	}

	// 프로젝트 승인/거절
	@RequestMapping("/projectManage.ad")
	public String projectManage(@RequestParam(value = "page", required = false) Integer page, Model model) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		ArrayList<Integer> listCount = aService.getListCountPM(1);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount.get(0) + listCount.get(1), 10);

		ArrayList<AFunding> mList = aService.selectOkList(pi, 1);
		ArrayList<Integer> rCountList = new ArrayList<Integer>();
		int count = mList.size();

		model.addAttribute("pi", pi);
		model.addAttribute("mList", mList);
		model.addAttribute("mCount", count);
		model.addAttribute("rCountList", rCountList);

		return "adminPageProject";
	}

	// 프로젝트 컨펌
	@RequestMapping("confirmProject.ad")
	public String okProject(@RequestParam("id") String id, @RequestParam("type") String type) {
		System.out.println(id);
		System.out.println(type);
		if ( type.equals("F")) {
			System.out.println("f");
			int result1 = aService.okProjectF(id);
			return "redirect:projectManage.ad";
		}else if( type.equals("W")){
			System.out.println("w");
			int result2 = aService.okProjectW(id);
			return "redirect:projectManage.ad";
		}else{
			throw new AdminException("프로젝트 승인 실패");
		}
	}

//	// 회원 강퇴
//	@RequestMapping("noProject.ad")
//	public String noProject(@RequestParam("id") String id) {
//		int result = aService.noProject(id);
//		if (result > 0) {
//			return "redirect:projectManage.ad";
//		} else {
//			throw new AdminException("인생");
//		}
//	}

	// 펀딩신고관리
	@RequestMapping("/fundingManage.ad")
	public String fundingManage(@RequestParam(value = "page", required = false) Integer page, Model model) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int listCountF = aService.getListCountRF(1);

		PageInfo piF = Pagination.getPageInfo(currentPage, listCountF, 10);

		ArrayList<FundingReport> fList = aService.selectFundingReport(piF, 1);
		ArrayList<Integer> rCountList = new ArrayList<Integer>();
//		System.out.println(fList);
		int countF = fList.size();

		model.addAttribute("piF", piF);
		model.addAttribute("fList", fList);
		model.addAttribute("fCount", countF);
		model.addAttribute("rCountList", rCountList);

		return "adminFundingReportManagement";
	}

	// 글 삭제
	@RequestMapping("deleteFunding.ad")
	public String deleteFunding(@RequestParam("id") String id) {
		int result = aService.deleteFunding(id);
		if (result > 0) {
			return "redirect:fundingManage.ad";
		} else {
			throw new AdminException("글 삭제에 실패하였습니다.");
		}
	}

	// 리뷰신고관리
	@RequestMapping("/reviewManage.ad")
	public String reviewManage(@RequestParam(value = "page", required = false) Integer page, Model model) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCountR = aService.getListCountRR(1);

		PageInfo piR = Pagination.getPageInfo(currentPage, listCountR, 10);

		ArrayList<ReviewReport> rList = aService.selectReviewReport(piR, 1);
		ArrayList<Integer> rCountList = new ArrayList<Integer>();

		int countR = rList.size();

		model.addAttribute("piR", piR);
		model.addAttribute("rList", rList);
		model.addAttribute("rCount", countR);
		model.addAttribute("rCountList", rCountList);

		return "adminReportManagement";
	}

	// 글 삭제
	@RequestMapping("deleteReview.ad")
	public String deleteReview(@RequestParam("id") String id) {
		int result = aService.deleteReview(id);
		if (result > 0) {
			return "redirect:reviewManage.ad";
		} else {
			throw new AdminException("글 삭제에 실패하였습니다.");
		}
	}

	// 공지사항, 이벤트 관리
	@RequestMapping("/noticeManage.ad")
	public String noticeManage(Notice n, @RequestParam(value = "page", required = false) Integer page, Model model,
			@RequestParam(value = "check", required = false) String check,
			@RequestParam(value = "reply", required = false) String reply,
			@RequestParam(value = "code", required = false) String code,
			@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "make", required = false) String make) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

//		System.out.println(check);

		int listCount = aService.getListCountN(1);

		NReply reeply = new NReply();
		reeply.setCode(code);
		reeply.setTitle(title);
		reeply.setReply(reply);

		n.setNoticeDivision(check);
		n.setNoticeTitle(title);
		n.setNoticeContent(make);

//		System.out.println(n);

		if (reply != null) {
//			System.out.println(reply);
//			System.out.println(title);
//			System.out.println(code);
			int result = aService.answerContentN(reeply);
		}

		if (check != null) {
			int newNotice = aService.selectNewWrite(n);
		}
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
//		ArrayList<Notice> nList = aService.selectAllNotice(pi,1);
//		ArrayList<Notice> eList = aService.selectAllEvent(pi,1);

		ArrayList<Notice> mList = aService.selectAllwrite(pi, 1);
		ArrayList<Integer> rCountList = new ArrayList<Integer>();
		int count = mList.size();

		model.addAttribute("pi", pi);
		model.addAttribute("mList", mList);
		model.addAttribute("mCount", count);
		model.addAttribute("rCountList", rCountList);
		model.addAttribute("Reply", reply);
		model.addAttribute("code", code);
		model.addAttribute("title", title);
		model.addAttribute("check", check);

		return "adminNotice";
	}

	// 글 생성
//	@RequestMapping("/noticeManage.ad")
//	public String noticeManageMake(Notice n, Model model, @RequestParam(value="reply", required=false) String reply, @RequestParam(value="title", required=false) String title, @RequestParam(value="check", required=false) String check) {
//		
//		
//		NReply reeply = new NReply();
//		
//		reeply.setTitle(title);
//		reeply.setReply(reply);
//
//		return "adminNotice";
//	}

	// 글 삭제
	@RequestMapping("deleteNotice.ad")
	public String deleteNotice(@RequestParam("id") String id) {
		int result = aService.deleteNotice(id);
		if (result > 0) {
			return "redirect:noticeManage.ad";
		} else {
			throw new AdminException("글 삭제에 실패하였습니다.");
		}
	}

	// 문의 관리
	@RequestMapping("/inquiryManage.ad")
	public String inquiryManage(@RequestParam(value = "page", required = false) Integer page, Model model,
			@RequestParam(value = "reply", required = false) String reply,
			@RequestParam(value = "code", required = false) String code) {

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = aService.getListCountI(1);

		Reply reeply = new Reply();
		reeply.setCode(code);
		reeply.setReply(reply);

		if (reply != null) {
//			System.out.println(reply);
			int result = aService.answerContent(reeply);
//			System.out.println(code);
		}

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);

		ArrayList<AdminInquiry> mList = aService.selectAllInquiry(pi, 1);
		ArrayList<Integer> rCountList = new ArrayList<Integer>();
		int count = mList.size();

		model.addAttribute("pi", pi);
		model.addAttribute("mList", mList);
		model.addAttribute("mCount", count);
		model.addAttribute("rCountList", rCountList);
		model.addAttribute("Reply", reply);
		model.addAttribute("code", code);
		return "adminInquiryManagement";
	}

	// 광고 관리
	@RequestMapping("/adManage.ad")
	public String adManage(@RequestParam(value = "page", required = false) Integer page, Model model) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
//		System.out.println(acceptDivision);
		int listCount = aService.getListCountA(1);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);

//		int accept = aService.getAccept(acceptDivision);

		ArrayList<Ads> mList = aService.selectAllAds(pi, 1);
		ArrayList<Image> iList = aService.selectAllImage(1);

		ArrayList<Integer> rCountList = new ArrayList<Integer>();
		int count = mList.size();
//		System.out.println(mList);
//		System.out.println(iList.size());
		model.addAttribute("pi", pi);
		model.addAttribute("mList", mList);
		model.addAttribute("iList", iList);
		model.addAttribute("mCount", count);
		model.addAttribute("rCountList", rCountList);
//		model.addAttribute("accept", accept);
		return "adminAdManagement";
	}

	// 승인

	// 회원 관리
	@RequestMapping("/memberManage.ad")
	public String memberManage(@RequestParam(value = "page", required = false) Integer page, Model model) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = aService.getListCount(1);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);

		ArrayList<Member> mList = aService.selectAllMember(pi, 1);
		ArrayList<Integer> rCountList = new ArrayList<Integer>();
		int count = mList.size();

		model.addAttribute("pi", pi);
		model.addAttribute("mList", mList);
		model.addAttribute("mCount", count);
		model.addAttribute("rCountList", rCountList);
		return "adminMemberManage";
	}

	@RequestMapping("/noticeMake.ad")
	public String noticeMake() {
		return "adminNoticeMake";
	}

	// 회원 강퇴
	@RequestMapping("deleteMember.ad")
	public String deleteMember(@RequestParam("id") String id) {
		int result = aService.deleteMember(id);
		if (result > 0) {
			return "redirect:memberManage.ad";
		} else {
			throw new AdminException("회원 강퇴에 실패하였습니다.");
		}
	}

	// 크리에이터 승인 팝업
	@RequestMapping("adminCreatorApproval.ad")
	public String adminCreatorApproval(Model model) {
		ArrayList<Creator> cList = aService.creatorApproval();
		ArrayList<Image> iList = aService.businessImage();
		@RequestMapping("adminCreatorApproval.ad")
		public String adminCreatorApproval(Model model, @RequestParam(value="page", required=false) Integer page) {
			ArrayList<Creator> cList = aService.creatorApproval();
			ArrayList<Image> iList = aService.businessImage();
			
//			System.out.println(cList);
//			System.out.println(iList);
			
			for(int i = 0; i < cList.size(); i++) {
				cList.get(i).setBusinessFileName(iList.get(i).getImageRename());
			}
			
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			
			int listCount = aService.getListCount(1);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 7);
			
				model.addAttribute("pi", pi);
				model.addAttribute("cList", cList);
				return "adminCreatorApproval";
	@RequestMapping("adminCreatorApproval.ad")
	public String adminCreatorApproval(Model model) {
		ArrayList<Creator> cList = aService.creatorApproval();
		ArrayList<Image> iList = aService.businessImage();

		}
//		System.out.println(cList);
//		System.out.println(iList);
		
		for(int i = 0; i < cList.size(); i++) {
			cList.get(i).setBusinessFileName(iList.get(i).getImageRename());
		// 크리에이터 승인
		@RequestMapping("updateMemberType.ad")
		@ResponseBody
		public int updateMemberType(@RequestParam("id") String changeId, Model model) {
			// System.out.println(changeId);
			int result = aService.updateMemberType(changeId);
			
			if(result > 0) {
				return result;
			}else {
				throw new AdminException("크리에이터 승인 실패");
			}
//		System.out.println(cList);
//		System.out.println(iList);

		for (int i = 0; i < cList.size(); i++) {
			cList.get(i).setBusinessFileName(iList.get(i).getImageRename());
		}
		
		if(cList.size() > 0) {
			model.addAttribute("cList", cList);
			return "adminCreatorApproval";
		}else {
			throw new AdminException("크리에이터 승인 팝업 불러오는 것에 실패하였습니다.");
		
		// 크리에이터 거절
		@RequestMapping("creatorDelete.ad")
		@ResponseBody
		public int creatorDelete(@RequestParam("delId") String delCreator) {
			System.out.println(delCreator);
			int result1 = aService.deleteCreator(delCreator);
			int result2 = aService.updateCreatorType(delCreator);
			
			int result = result1 + result2;
			
			if(result == 2) {
				return result;
			}else {
				throw new AdminException("크리에이터 거절 실패");
			}
			

		if (cList.size() > 0) {
			model.addAttribute("cList", cList);
			return "adminCreatorApproval";
		} else {
			throw new AdminException("크리에이터 승인 팝업 불러오는 것에 실패하였습니다.");
		}
		
	}

	}
}
