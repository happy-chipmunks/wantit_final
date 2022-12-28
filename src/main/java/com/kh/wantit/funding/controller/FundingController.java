package com.kh.wantit.funding.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.exception.FundingException;
import com.kh.wantit.funding.model.service.FundingService;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.member.vo.Member;

@Controller
public class FundingController {
	
	@Autowired
	private FundingService fService;
	
	// 펀딩 글 목록
	@RequestMapping("fundingList.fund") 
	public String fundingList(Model model) {
		ArrayList<Funding> fundingList = fService.fundingList();
		
		if(fundingList != null) {
			model.addAttribute("fundingList", fundingList);
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
	public String insertFunding(@ModelAttribute Funding f, @RequestParam("file") MultipartFile representativeFile, HttpServletRequest request) {
		String name = ((Member)request.getSession().getAttribute("loginUser")).getMemberNickname();
		f.setCreatorNickname(name);
		
		Image i = new Image();
		if(!representativeFile.equals("")) {
			String[] returnArr = saveFile(representativeFile, request);
			
			if(returnArr[1] != null) {
				i.setOriginName(representativeFile.getOriginalFilename());
				i.setImageRename(returnArr[1]);
				i.setImageSrc(returnArr[0]);
				i.setImageBoardCate(1);
				i.setImageLevel(0);
			}
		}
		
		int result1 = fService.insertFunding(f);
		int result2 = fService.insertImage(i);
		
		 if(result1 + result2 == 2) {
			 return "redirect:fundingList.fund";
		} else { 
			 throw new FundingException("펀딩 등록 실패"); 
		}
		 
	}
	
	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\funding";
		
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
	
	// summernote 이미지 저장
//	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
//	@ResponseBody
//	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
//		JsonObject jsonObject = new JsonObject();
//		
//		//내부 경로로 저장
//		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
//		String fileRoot = contextRoot="resources/fileupload/";
//		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
//		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
//		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일명
//		
//		File targetFile = new File(fileRoot + savedFileName);
//		try {
//			InputStream fileStream = multipartFile.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
//			jsonObject.addProperty("url", "/summernote/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
//			jsonObject.addProperty("responseCode", "success");
//		} catch (IOException e) {
//			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
//			jsonObject.addProperty("responseCode", "error");
//			e.printStackTrace();
//		}
//		String a = jsonObject.toString();
//		return a;
//		
//	}
	
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		
		//내부 경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot="resources/fileupload/";
		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		
		// 랜덤 UUID+확장자로 저장될 savedFileName
		String savedFileName = UUID.randomUUID() + extension;
		
		File targetFile = new File(fileRoot + savedFileName);
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);		// 파일 저장
			jsonObject.addProperty("url", "/summernoteImage/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);		// 실패 시 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	// 펀딩 오픈 예정 페이지 이동
	@RequestMapping("fundingComingSoon.fund")
	public String fundingComingSoon() {
		return "fundingComingSoon";
	}
	
	
	
	
	
}
