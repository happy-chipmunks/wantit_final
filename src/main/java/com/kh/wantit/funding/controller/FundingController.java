package com.kh.wantit.funding.controller;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.exception.FundingException;
import com.kh.wantit.funding.model.service.FundingService;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.funding.model.vo.Reward;
import com.kh.wantit.member.vo.Member;

@Controller
public class FundingController {
	
	@Autowired
	private FundingService fService;
	
	// 펀딩 글 목록
	@RequestMapping("fundingList.fund") 
	public String fundingList(Model model) {
		ArrayList<Funding> fundingList = fService.fundingList();
		ArrayList<Image> imageList = fService.fundingImageList();
//		System.out.println(imageList);
		
		if(fundingList != null && imageList != null) {
			model.addAttribute("fundingList", fundingList);
			model.addAttribute("imageList", imageList);
			return "fundingProceed";
		}else {
			throw new FundingException("펀딩 목록 불러오기 실패");
		}
	}
	
	// 펀딩 작성 페이지 이동
	@RequestMapping("insertFundingBoard.fund")
	public String insertFundingBoard() {
		return "fundingWrite";
	}
	
	// 펀딩 상세페이지
	@RequestMapping("fundingMain.fund")
	public String fundingMain() {
		return "fundingMain";
	}
	
	// 펀딩 등록
	@RequestMapping("insertFunding.fund")
	public String insertFunding(@ModelAttribute Funding f, @RequestParam("file") ArrayList<MultipartFile> files, HttpServletRequest request, @RequestParam("category") String cate, @ModelAttribute Reward r) {
		String id = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		// System.out.println(id);
		
		int creatorNum = fService.getCreatorNum(id);
		
		String creatorName = fService.getCreatorName(id);
		f.setCreatorNum(creatorNum);
		f.setCreatorNickname(creatorName);
		// System.out.println(cate);
		f.setFundingCate(cate);
		// System.out.println(f.getFundingEnd());
		
		
		int result1 = fService.insertFunding(f);
		int result2 = 0;
		// System.out.println(r);
		int result3 = fService.insertReward(r);
		
		ArrayList<Image> list = new ArrayList<Image>();
		for(int j = 0; j < files.size(); j++) {
			MultipartFile upload = files.get(j);
			
			if(!upload.getOriginalFilename().equals("")) {
				String[] returnArr = saveFile(upload, request, j);
				
				if(returnArr[1] != null) {
					Image i = new Image();
					i.setOriginName(upload.getOriginalFilename());
					i.setImageForm(upload.getOriginalFilename().substring(upload.getOriginalFilename().lastIndexOf(".")));
					i.setImageRename(returnArr[1]);
					i.setImageSrc(returnArr[0]);
					i.setImageBoardCate(1);
//					i.setImageLevel(0);
					list.add(i);
				}
			}
		}
		// System.out.println(list);
		
		for(int j = 0; j < list.size(); j++) {
			Image i = list.get(j);
			if(j == 0) {
				i.setImageLevel(0);
			}else {
				i.setImageLevel(1);
			}
			result2 = fService.insertImage(i);
		}
		
		 if(result1 > 0 && result2 > 0 && result3 >0) {
			 return "redirect:fundingList.fund";
		} else { 
			 throw new FundingException("펀딩 등록 실패"); 
		}
		 
	}
	
	// 이미지 저장
	public String[] saveFile(MultipartFile file, HttpServletRequest request, int j) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\funding";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		String originFileName = file.getOriginalFilename();
		String renameFileName = "funding" + sdf.format(new Date(System.currentTimeMillis())) + j + ranNum
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
	
	// 펀딩 summernote 이미지
	@RequestMapping("uploadSummernoteImageFile.fund")
	public void profileUpload(String emial, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\funding\\summernote";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*1000);
		String originFileName = file.getOriginalFilename();
		String renameFileName = "funding" + sdf.format(new Date(System.currentTimeMillis())) + ranNum + "sm" + originFileName.substring(originFileName.lastIndexOf("."));

		String renamePath = folder + "\\" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		
		System.out.println("파일경로: " + renamePath);
		PrintWriter out = response.getWriter();
		
		out.println(renameFileName);
		out.close();
	}
	
	// 펀딩 오픈 예정 페이지 이동
	@RequestMapping("fundingComingSoon.fund")
	public String fundingComingSoon() {
		return "fundingComingSoon";
	}
	
	
	
	
	
}
