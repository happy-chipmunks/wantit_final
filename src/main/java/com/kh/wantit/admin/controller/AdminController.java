package com.kh.wantit.admin.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.wantit.admin.model.exception.AdminException;
import com.kh.wantit.admin.model.service.AdminService;
import com.kh.wantit.admin.model.vo.AFunding;
import com.kh.wantit.admin.model.vo.AdReply;
import com.kh.wantit.admin.model.vo.AddReply;
import com.kh.wantit.admin.model.vo.AdminInquiry;
import com.kh.wantit.admin.model.vo.Ads;
import com.kh.wantit.admin.model.vo.EdReply;
import com.kh.wantit.admin.model.vo.NReply;
import com.kh.wantit.admin.model.vo.NoReply;
import com.kh.wantit.admin.model.vo.Notice;
import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.admin.model.vo.Pagination;
import com.kh.wantit.admin.model.vo.Reply;
import com.kh.wantit.admin.model.vo.ReviewReport;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.member.vo.Creator;
import com.kh.wantit.member.vo.Member;
import com.kh.wantit.wanting.exception.WantingException;

@Controller
public class AdminController {
	@Autowired
	private AdminService aService;

	@RequestMapping("admin.ad")
	public String admin() {
		return "adminMainpage";
	}

	// 프로젝트 승인/거절

	@RequestMapping("projectManage.ad")
	public String projectManage(@RequestParam(value = "page", required = false) Integer page, Model model,
			HttpSession session) {
		String id = ((Member) session.getAttribute("loginUser")).getMemberId();

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		ArrayList<Integer> listCount = aService.getListCountPM(1);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount.get(0) + listCount.get(1), 10);

		ArrayList<AFunding> mList = aService.selectOkList(pi, 1);

		ArrayList<Integer> rCountList = new ArrayList<Integer>();
		int count = mList.size();

//				System.out.println(mList);
		model.addAttribute("pi", pi);
		model.addAttribute("mList", mList);
		model.addAttribute("mCount", count);
		model.addAttribute("rCountList", rCountList);
		return "adminPageProject";

	}

	// 프로젝트 컨펌
	@RequestMapping("confirmProject.ad")
	public String okProject(@RequestParam("id") String id, @RequestParam("type") String type) {
//				System.out.println(id);
//				System.out.println(type);
		if (type.equals("F")) {
//					System.out.println("f");
			int result1 = aService.okProjectF(id);
			return "redirect:projectManage.ad";
//				}else if( type.equals("W")){
////					System.out.println("w");
//					int result2 = aService.okProjectEditW(id);
//					return "redirect:projectManage.ad";
		} else {
			throw new AdminException("프로젝트 승인 실패");
		}
	}

	// 프로젝트 수정 승인
	@RequestMapping("confirmEditProject.ad")
	public String okEditProject(@RequestParam("id") int id, @RequestParam("type") String type) {
//					System.out.println(id);
//					System.out.println(type);
		if (type.equals("F")) {
			int result1 = aService.okEditProjectF(id);
			return "redirect:projectManage.ad";
		} else if (type.equals("W")) {
			int result2 = aService.okEditProjectW(id);
			return "redirect:projectManage.ad";
		} else {
			throw new AdminException("프로젝트 승인 실패");
		}
	}

	// 프로젝트 거절
	@RequestMapping("refuseProject.ad")
	public String noProject(@RequestParam("id") String id, @RequestParam("type") String type) {
//				System.out.println(id);
//				System.out.println(type);
		if (type.equals("F")) {
//					System.out.println("f");
			int result1 = aService.noProjectF(id);
			return "redirect:projectManage.ad";
//				}else if( type.equals("W")){
////					System.out.println("w");
//					int result2 = aService.noProjectW(id);
//					return "redirect:projectManage.ad";
		} else {
			throw new AdminException("프로젝트 승인 실패");
		}
	}

	// 프로젝트 수정 거절
	@RequestMapping("refuseEditProject.ad")
	public String noEditProject(@RequestParam("id") String id, @RequestParam("type") String type) {
//					System.out.println(id);
//					System.out.println(type);
		if (type.equals("F")) {
			System.out.println("f");
			int result1 = aService.noEditProjectF(id);
			int result2 = aService.noEditProjectFF(id);
			return "redirect:projectManage.ad";
		} else if (type.equals("W")) {
			int result3 = aService.noEditProjectW(id);
			int result4 = aService.noEditProjectWW(id);
			return "redirect:projectManage.ad";
		} else {
			throw new AdminException("프로젝트 승인 실패");
		}
	}

	// 프로젝트 삭제 승인
	@RequestMapping("confirmDeleteProject.ad")
	public String confirmDeleteProject(@RequestParam("id") String id, @RequestParam("type") String type) {
		if (type.equals("W")) {
			int result1 = aService.successEdit(id);
			return "redirect:projectManage.ad";
		} else {
			throw new AdminException("프로젝트 승인 실패");
		}
	}

	// 프로젝트 삭제 거부
	@RequestMapping("refuseDeleteProject.ad")
	public String refuseDeleteProject(@RequestParam("id") String id, @RequestParam("type") String type) {
		if (type.equals("W")) {
			int result1 = aService.failEdit(id);
			int result2 = aService.failEditWW(id);
			return "redirect:projectManage.ad";
		} else {
			throw new AdminException("프로젝트 승인 실패");
		}
	}

	// 리뷰신고관리
	@RequestMapping("reviewManage.ad")
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
	@RequestMapping("noticeManage.ad")
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

//			System.out.println(check);

		int listCount = aService.getListCountN(1);

		NReply reeply = new NReply();
		reeply.setCode(code);
		reeply.setTitle(title);
		reeply.setReply(reply);

		n.setNoticeDivision(check);
		n.setNoticeTitle(title);
		n.setNoticeContent(make);

		if (reply != null) {
//				System.out.println(reply);
//				System.out.println(title);
//				System.out.println(code);	
			int result = aService.answerContentN(reeply);
		}

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
//			ArrayList<Notice> nList = aService.selectAllNotice(pi,1);
//			ArrayList<Notice> eList = aService.selectAllEvent(pi,1);

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

	// 공지사항 작성
	@RequestMapping("noticeMake.ad")
	public String insertNotice() {
		return "adminNoticeMake";
	}

	// 공지사항 작성
	@RequestMapping("insertNotice.ad")
	public String inserteNotice(@ModelAttribute Notice n, @RequestParam(value = "check", required = false) String check,
			@RequestParam(value = "title", required = false) String title,
			@RequestParam("notice-file") ArrayList<MultipartFile> files, HttpServletRequest request) {
		String admin = ((Member) request.getSession().getAttribute("loginUser")).getMemberId();
		n.setAdmin(admin);

//			System.out.println(files); // 받아온 파일들 ArrayList

		n.setNoticeDivision(check);
		n.setNoticeTitle(title);

//			System.out.println(n);
		int result1 = aService.selectNewWrite(n); // 원팅 삽입
		int result2 = 0; // 이미지 삽입

		// 이미지 속성값 설정
		ArrayList<Image> list = new ArrayList<Image>();
//			System.out.println(result1);
		for (int i = 0; i < files.size(); i++) {
//				System.out.println(i);
			MultipartFile upload = files.get(i);
//				System.out.println(upload);
//				System.out.println(upload.getOriginalFilename());

			if (!upload.getOriginalFilename().equals("")) { // upload에 오리지날 이름이 빈칸이 아니라면
				// if(upload != null && !upload.isEmpty()) { // upload가 null이 아니고 upload가 비어있지
				// 않다면
				String[] returnArr = saveFile(upload, request, i);
				// 파일이 upload 객체에 있는데 saveFile 함수를 거쳐서
				// returnArr[0]에는 저장경로 returnArr[1]에는 변경한 이름이 들어있다

				if (returnArr[1] != null) {
					// 리네임이 null이 아니라면
					Image img = new Image(); // img에 속성값을 넣어서 추가하자

					String originFileName = upload.getOriginalFilename();
					img.setImageForm(originFileName.substring(originFileName.lastIndexOf(".")));
					img.setOriginName(originFileName);
					img.setImageRename(returnArr[1]);
					img.setImageSrc(returnArr[0]);
					img.setImageBoardCate(6);
					list.add(img); // 받아온 files에 정보를 넣어서 Image list에 넣자
//						System.out.println(upload.getOriginalFilename() + "list넣기");
				}
			}
		}

		// 이미지 속성값 설정 - 썸네일
		for (int i = 0; i < list.size(); i++) {
			Image img = list.get(i);
			if (i == 0) {
				img.setImageLevel(0);
			} else {
				img.setImageLevel(1);
			}
			result2 = aService.insertImage(img); // 이미지 삽입
//				System.out.println(img + "삽입");

		}

		if (result1 > 0 && result2 > 0) {
			return "redirect:noticeManage.ad";
		} else {
			throw new AdminException("공지사항 작성 실패");
		}
	}

	// ==================== 이미지 ====================
	public String[] saveFile(MultipartFile file, HttpServletRequest request, int i) {
		// saveFile이 있는 이유 : 우리가 지정한 경로에 넣어주고 자체형식으로 이름을 지정해줘야함

		String root = request.getSession().getServletContext().getRealPath("resources");
		// WEB-INF안에 있는 resources(정적파일관리)를 도달하려고 하는 경로

		// 윈도우OS 경로
		String savePath = root + "\\notice";
		// 맥OS 경로
//				String savePath = root + "/admin"; 

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs(); // 폴더가 없으면 폴더 만들기
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		// 날짜 이용하기 위해서 simpleDateFormat 이용

		int ranNum = (int) (Math.random() * 1000);
		String originFileName = file.getOriginalFilename();
		String renameFileName = "notice " + sdf.format(new Date(System.currentTimeMillis())) + i + ranNum
				+ originFileName.substring(originFileName.lastIndexOf("."));
		// 이름을 다시 지어줌 : 데이터 업로드된 날짜 및 시간 (+ 랜덤값은 넣기 싫어) + 몇번째 + 랜덤 + 원본파일에서 가장 마지막 . 뒤에
		// 추출(파일확장자명 추출)

		String renamePath = folder + "\\" + renameFileName;
		// 변경된 이름을 파일에 다시 저장

		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}

		String[] returnArr = new String[2];
		returnArr[0] = savePath; // 저장 경로 넣기
		returnArr[1] = renameFileName; // 변경한 이름 넣기

		return returnArr;
	}

	// 광고 이미지 배너 이미지로
	public String[] saveBanner(MultipartFile file, HttpServletRequest request, int i) {
		// saveFile이 있는 이유 : 우리가 지정한 경로에 넣어주고 자체형식으로 이름을 지정해줘야함

		String root = request.getSession().getServletContext().getRealPath("resources");
		// WEB-INF안에 있는 resources(정적파일관리)를 도달하려고 하는 경로

		// 윈도우OS 경로
		String savePath = root + "\\bannerImage";
		// 맥OS 경로
//				String savePath = root + "/admin"; 

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs(); // 폴더가 없으면 폴더 만들기
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		// 날짜 이용하기 위해서 simpleDateFormat 이용

		int ranNum = (int) (Math.random() * 1000);
		String originFileName = file.getOriginalFilename();
		String renameFileName = "bannerImage " + sdf.format(new Date(System.currentTimeMillis())) + i + ranNum
				+ originFileName.substring(originFileName.lastIndexOf("."));
		// 이름을 다시 지어줌 : 데이터 업로드된 날짜 및 시간 (+ 랜덤값은 넣기 싫어) + 몇번째 + 랜덤 + 원본파일에서 가장 마지막 . 뒤에
		// 추출(파일확장자명 추출)

		String renamePath = folder + "\\" + renameFileName;
		// 변경된 이름을 파일에 다시 저장

		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}

		String[] returnArr = new String[2];
		returnArr[0] = savePath; // 저장 경로 넣기
		returnArr[1] = renameFileName; // 변경한 이름 넣기

		return returnArr;
	}

	// ==================== 써머노트 이미지 ====================
	@RequestMapping("summernoteImage.ad")
	public void profileUpload(String email, MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String root = request.getSession().getServletContext().getRealPath("resources");
		// WEB-INF안에 있는 resources(정적파일관리)를 도달하려고 하는 경로
		String savePath = root + "\\notice\\summernote";
		// 맥OS 경로

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs(); // 폴더가 없으면 폴더 만들기
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		// 날짜 이용하기 위해서 simpleDateFormat 이용
		int ranNum = (int) (Math.random() * 1000);
		String originFileName = file.getOriginalFilename();
		String renameFileName = "notice" + sdf.format(new Date(System.currentTimeMillis())) + ranNum + "sm"
				+ originFileName.substring(originFileName.lastIndexOf("."));
		// 이름을 다시 지어줌 : 데이터 업로드된 날짜 및 시간 (+ 랜덤값은 넣기 싫어) + 랜덤 + 원본파일에서 가장 마지막 . 뒤에
		// 추출(파일확장자명 추출)
		String renamePath = folder + "//" + renameFileName;
		// 변경된 이름을 파일에 다시 저장

		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		} // 여기까지는 일반 첨부파일과 동일

//			System.out.println("파일경로 : " + renamePath);
		PrintWriter out = response.getWriter();
		// out 출력 : org.apache.catalina.connector.CoyoteWriter@6472c824

		out.println(renameFileName); // 파일명 전송
		out.close(); // 닫아줘야 한다
	}

	// 공지사항 수정 페이지 가고
	@RequestMapping("editNotice.ad")
	public String editNotice(@RequestParam("code") int code, @RequestParam("division") String division, Model model,
			HttpSession session) {
//	        System.out.println(code);
//	        System.out.println(division);
		NoReply nr = new NoReply();
		nr.setCode(code);
		nr.setDivision(division);
		// 원팅 가져오기
		Notice n = aService.selectNoticeDetail(nr);

		// 이미지 가져와서 썸네일만 보내기
		ArrayList<Image> imageList = aService.selectImage(code);
		Image thumbnail = null;
		for (int i = 0; i < imageList.size(); i++) {
			if (imageList.get(i).getImageLevel() == 0) {
				thumbnail = imageList.get(i);
			}
		}
		// System.out.println("원팅 상세보기 이미지 : " + imageList);

		if (n != null && imageList != null) {
			model.addAttribute("notice", n);
			model.addAttribute("thumbnail", thumbnail);
			return "adminNoticeEdit";
		} else {
			throw new WantingException("원팅 상세보기 실패");
		}

	}

	// 공지사항 수정
	@RequestMapping("noticeEdit.ad")
	public String editNotice() {
		return "adminNoticeEdit";
	}

	// 공지사항 수정완료
	@RequestMapping("editConfirm.ad")
	public String editConfirm(@RequestParam("code") int code, @RequestParam("division") String division,
			@RequestParam("title") String title, @RequestParam("content") String content, @ModelAttribute Notice n,
			HttpServletRequest request, Model model) {

//	        System.out.println(code);
//	        System.out.println(content);
//	        System.out.println(division);
//	        System.out.println(title);
		EdReply er = new EdReply();
		er.setCode(code);
		er.setDivision(division);
		er.setTitle(title);
		er.setContent(content);

		int result1 = aService.confirmNotice(er);
		ArrayList<Image> imageList = aService.selectImage(n.getNoticeNum());

		Image thumbnail = null;
		for (int i = 0; i < imageList.size(); i++) {
			if (imageList.get(i).getImageLevel() == 0) {
				thumbnail = imageList.get(i);
			}
		}

		if (result1 > 0 && imageList != null) {
			model.addAttribute("notice", n);
			model.addAttribute("thumbnail", thumbnail);
			return "redirect:noticeManage.ad";
		} else {
			throw new AdminException("공지 수정 요청 실패");
		}

		// } else {
		// throw new WantingException("원팅 수정 요청 실패");
		// }
	}

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
	@RequestMapping("inquiryManage.ad")
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
	@RequestMapping("adManage.ad")
	public String adManage(@RequestParam(value = "page", required = false) Integer page, Model model) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int listCount = aService.getListCountA(1);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);

		ArrayList<Ads> mList = aService.selectAllAds(pi, 1);
		ArrayList<Image> iList = aService.selectAdImage();

//		System.out.println(mList);
//		System.out.println(iList);
		ArrayList<Integer> rCountList = new ArrayList<Integer>();
		int count = mList.size();

		model.addAttribute("pi", pi);
		model.addAttribute("mList", mList);
		model.addAttribute("iList", iList);
		model.addAttribute("mCount", count);
		model.addAttribute("rCountList", rCountList);
		return "adminAdManagement";
	}

	// 광고 승인
	@RequestMapping("confirmAd.ad")
	public String confirmAd(@ModelAttribute Ads ads, @RequestParam("adsNum") String adsNum,
			ArrayList<MultipartFile> files, @RequestParam("boardId") String boardId,
			@RequestParam("imageNum") int imageNum, Model model, HttpServletRequest request) {
//		System.out.println(adsNum);
//		System.out.println(boardId);

		AddReply ar = new AddReply();
		ar.setAdsNum(adsNum);
		ar.setBoardId(boardId);
		ar.setImageNum(imageNum);

		int result1 = aService.confirmAd(ar);
		int result2 = aService.confirmAdImage(ar);

		if (result1 > 0) {
			return "redirect:adManage.ad";
		} else {
			throw new AdminException("광고 삭제에 실패하였습니다.");
		}

	}

	// 광고 거절
	@RequestMapping("refuseAd.ad")
	public String refuseAd(@RequestParam("adsNum") String adsNum, @RequestParam("boardId") String boardId, Model model,
			HttpSession session) {
//		System.out.println(adsNum);
//		System.out.println(boardId);

		AdReply ar = new AdReply();
		ar.setAdsNum(adsNum);
		ar.setBoardId(boardId);

		int result1 = aService.refuseAd(ar);
		int result2 = aService.refuseAdImage(ar);

		if (result1 > 0) {
			return "redirect:adManage.ad";
		} else {
			throw new AdminException("광고 삭제에 실패하였습니다.");
		}
	}

	// 회원 관리
	@RequestMapping("memberManage.ad")
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
	public String adminCreatorApproval(Model model, @RequestParam(value = "page", required = false) Integer page) {
		ArrayList<Creator> cList = aService.creatorApproval();
		ArrayList<Image> iList = aService.businessImage();

//       System.out.println(cList);
//       System.out.println(iList);

		for (int i = 0; i < cList.size(); i++) {
			cList.get(i).setBusinessFileName(iList.get(i).getImageRename());
		}

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = aService.getListCount(1);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 7);

		model.addAttribute("pi", pi);
		model.addAttribute("cList", cList);
		return "adminCreatorApproval";
	}

	// 크리에이터 승인
	@RequestMapping("updateMemberType.ad")
	@ResponseBody
	public int updateMemberType(@RequestParam("id") String changeId, Model model) {
		// System.out.println(changeId);
		int result = aService.updateMemberType(changeId);

		if (result > 0) {
			return result;
		} else {
			throw new AdminException("크리에이터 승인 실패");
		}
	}

	// 크리에이터 거절
	@RequestMapping("creatorDelete.ad")
	@ResponseBody
	public int creatorDelete(@RequestParam("delId") String delCreator) {
//       System.out.println(delCreator);
		int result1 = aService.deleteCreator(delCreator);
		int result2 = aService.updateCreatorType(delCreator);

		int result = result1 + result2;

		if (result == 2) {
			return result;
		} else {
			throw new AdminException("크리에이터 거절 실패");
		}

	}

}
