package com.kh.wantit.pay.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.params.HttpClientParams;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParamConfig;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EntityUtils;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.JsonNodeType;
import com.google.gson.JsonObject;
import com.kh.wantit.pay.exception.PayException;
import com.kh.wantit.pay.service.PayService;
import com.kh.wantit.pay.vo.PaySchedule;
import com.kh.wantit.pay.vo.Reward;
import com.kh.wantit.pay.vo.TestMember;


@Controller
public class PayController {
	
	private final static String IMP_KEY = "4048636354863648";
	private final static String IMP_SECRET = "eIUGzNqVpnvHS9APkG2TwFJzKKg77AVUGAoVAmm53LOT5GVXN2xCPfDu99eKNMjODAcB0sEsnmC0riXm";
	private final static String RESTAPI_GET_TOKEN = "https://api.iamport.kr/users/getToken";
	private final static String RESTAPI_GET_BILLINGKEY = "https://api.iamport.kr/subscribe/customers/";
	private final static String RESTAPI_TRY_PAY_SCHEDULE = "https://api.iamport.kr/subscribe/payments/schedule";
	private final static String RESTAPI_TRY_PAY_UNSCHEDULE = "https://api.iamport.kr/subscribe/payments/unschedule";
	private final static String RESTAPI_SEARCH_PAYLIST = "https://api.iamport.kr/payments";
	private final static String RESTAPI_SEARCH_PAY_ONE = "https://api.iamport.kr/subscribe/payments/schedule/";
	private final static String RESTAPI_PAY_AGAIN = "https://api.iamport.kr/subscribe/payments/again";
	
	@Autowired
	private PayService pService;

	@RequestMapping("payView.pay")
	public String payView(@RequestParam("fundingNum") int fundingNum, Model model) {
		
		ArrayList<Reward> rewardList = pService.getRewardList(fundingNum);
		String fundingTitle = pService.getFundingTitle(fundingNum);
		model.addAttribute("rewardList", rewardList);
		model.addAttribute("fundingTitle", fundingTitle);
		model.addAttribute("fundingNum", fundingNum);
		return "payView";
	}
	
	/*
	 * 관리자 or 크리에이터 쪽 결제상태 최신화작업
	 */
	@RequestMapping("payStatusRenewal.pay")
	public String payStatusRenewal(@RequestParam("fundingNum") int fundingNum, Model model) {
		
		ArrayList<String> merchantUIdList = pService.getMerchantUId(fundingNum);
		String[] merchant_uid = new String[merchantUIdList.size()];
		for(int i=0 ; i<merchant_uid.length ; i++) {
			merchant_uid[i] = merchantUIdList.get(i);
		}
		String accessToken = getAccessToken();
		
		CloseableHttpClient client = HttpClientBuilder.create().build();
		
		StringBuilder sb = new StringBuilder();
		sb.append(RESTAPI_SEARCH_PAYLIST).append("?");
		for(int i=0 ; i<merchantUIdList.size() ; i++) {
			System.out.println(i);
			if(i != 0 && i != merchantUIdList.size()) {
				sb.append("&");
			}
			sb.append("merchant_uid[]=" + merchantUIdList.get(i));
			System.out.println(sb.toString());
			
		}
		String replace = sb.toString().replaceAll(" ", "%20");
		System.out.println(replace);
		HttpGet get = new HttpGet(replace);
		get.setHeader("Authorization", accessToken);
		
		ArrayList<String> responseMerchantUId = new ArrayList<String>();
		ArrayList<String> responseStatus = new ArrayList<String>();
		try {
			
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			System.out.println(resNode);
			
			for(int i=0 ; i<resNode.size() ; i++) {
				responseMerchantUId.add(resNode.get(i).get("merchant_uid").asText());
				responseStatus.add(resNode.get(i).get("status").asText());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				get.releaseConnection();
				client.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		for(int i=0 ; i<responseMerchantUId.size() ; i++) {
			Map<String, String> updateStatusMap = new HashMap<String, String>();
			updateStatusMap.put("mUId", responseMerchantUId.get(i));
			updateStatusMap.put("payStatus", responseStatus.get(i));
			
			System.out.println(updateStatusMap.toString());
			
			int updateStatus = pService.updatePayStatus(updateStatusMap);
		
			System.out.println("updateStatus : " + updateStatus);
			
//			if(updateStatus < 0) {
//				throw new PayException("paystatus update failed.");
//			}
		}
		

		return "";
	}
	
	@RequestMapping("cancelPaySchedule.pay")
	public String cancelPaySchedule(@RequestParam("customerUId") String customerUId, 
			@RequestParam("merchantUId") String merchantUId, @RequestParam("buyerName") String buyerName, Model model) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("customerUId", customerUId);
		map.put("merchantUId", merchantUId);
		map.put("buyerName", buyerName);
		
		System.out.println(map.toString());
		
		int checkScheduled = pService.checkScheduled(map);
		String access_token = getAccessToken();
		System.out.println(access_token);
		System.out.println(checkScheduled);
		
		if(checkScheduled == 1) {
			CloseableHttpClient client = HttpClientBuilder.create().build();
			HttpPost post = new HttpPost(RESTAPI_TRY_PAY_UNSCHEDULE);
			post.setHeader("Authorization", access_token);
			System.out.println(post.toString());
			
			Map<String, String> entityMap = new HashMap<String, String>();
			entityMap.put("customer_uid", customerUId);
			entityMap.put("merchant_uid", merchantUId);
			System.out.println(entityMap.toString());
			
			try {
				post.setEntity(new UrlEncodedFormEntity(convertParameter(entityMap), "UTF-8"));
				HttpResponse res = client.execute(post);
				ObjectMapper mapper = new ObjectMapper();
				String body = EntityUtils.toString(res.getEntity());
				JsonNode rootNode = mapper.readTree(body);
				int resCode = rootNode.get("code").asInt();
				String message = rootNode.get("message").asText();
				System.out.println("message : " + message);
				System.out.println("resCode : " + resCode);
				if(resCode != 0) {
					throw new PayException(message);
				} else {
					JsonNode resNode = rootNode.get("response");
					System.out.println("unscheduled resNode : " + resNode.toString());
					String schedule_status = resNode.get(0).get("schedule_status").asText();
					System.out.println("schedule_status : " + schedule_status);
					if(schedule_status.equals("revoked")) {
						Map<String, String> unscheduleMap = new HashMap<String, String>();
						unscheduleMap.put("customer_uid", customerUId);
						unscheduleMap.put("merchant_uid", merchantUId);
						unscheduleMap.put("buyer_name", buyerName);
						
						int updateScheduleStatus = pService.updateScheduleStatus(unscheduleMap);
						System.out.println(updateScheduleStatus);
						model.addAttribute("cancelPayScuccess", "cancelPayScuccess");
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					post.releaseConnection();
					client.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		} else {
			throw new PayException("해당 결제정보가 존재하지 않습니다.");
		}
		return "../home";
	}
	
	@RequestMapping("loginTest.pay")
	public String loginTest(Model model) {
		
		TestMember m = pService.loginTest();
		
		model.addAttribute("loginUser", m);
		return "../home";
	}
	
	@RequestMapping("paySchedule.pay")
	public String paySchedule(@RequestParam("rewardCount") int[] rewardCount, @RequestParam("rewardNum") int[] rewardNum,
												@RequestParam("fundingTitle") String fundingTitle, @RequestParam("totalAmount") int totalAmount,
												@RequestParam("cardNum") String[] cardNum, @RequestParam("cardExpiry") String[] cardExpiry,
												@RequestParam("cardPwd") String cardPwd, @RequestParam("cardBirth") String cardBirth,
												@RequestParam("buyerName") String buyerName, @RequestParam("buyerTel") String buyerTel,
												@RequestParam("buyerAddr") String[] buyerAddr, @RequestParam("postReq") String postReq,
												@RequestParam("rewardExpectDate") Date[] rewardExpectDate,  @RequestParam("fundingNum") int fundingNum,
												@RequestParam("rewardTitle") String[] rewardTitle, Model model) {
		
		StringBuilder sb = new StringBuilder();
		
		Date date = Date.valueOf("2022-01-01");
		for(int i=0 ; i<rewardExpectDate.length ; i++) {
			if(date.compareTo(rewardExpectDate[i]) == -1) {
				date = rewardExpectDate[i];
			}
			
			System.out.println(date);
			
		}
		String creditCardNumber = cardNum[0] + "-" +  cardNum[1] + "-" + cardNum[2] + "-" + cardNum[3];
		String creditCardExpiry = "20" + cardExpiry[1] + "-" + cardExpiry[0];
		String buyerFullAddress = buyerAddr[0] + " // " + buyerAddr[1];
		
		System.out.println(creditCardNumber);
		System.out.println(creditCardExpiry);
		System.out.println(buyerFullAddress);
		System.out.println();
		
		//아임포트 access token 발급
		String accessToken = getAccessToken();
		System.out.println(accessToken);
		
		
		//아임포트 billing key 발급, customer_id 값 가져오기
		Map<String, String> billingMap = getBillingKey(buyerName, creditCardNumber, creditCardExpiry, cardBirth, cardPwd, accessToken);
		System.out.println(billingMap.toString());
		
		PaySchedule ps = null;
		Map<String, String> scheduleMap = new HashMap<String, String>();
		if(billingMap.containsKey("responseMessage")) {
			throw new PayException(billingMap.get("responseMessage"));
			
		} else if(billingMap.containsKey("customer_uid")) {
			System.out.println(billingMap.get("customer_uid"));
			
			//아임포트 결제예약
			scheduleMap = paySchedule(fundingTitle, date, totalAmount, buyerName, buyerTel, buyerFullAddress, accessToken, billingMap.get("customer_uid"));
			System.out.println(scheduleMap.toString());
			System.out.println(buyerName);
			
			if(scheduleMap.containsKey("message")) {
				throw new PayException(scheduleMap.get("message"));
			} else {
				for(int i=0 ; i<rewardCount.length ; i++) {
					if(rewardCount[i] != 0) {
						Map<String, Integer> map = new HashMap<String, Integer>();
						map.put("rewardNum", rewardNum[i]);
						map.put("rewardCount", rewardCount[i]);
						if(i != rewardCount.length - 1) {
							sb.append(i+1 + ". " + rewardTitle[i]);
							sb.append("/");
						} else {
							sb.append(i+1 + ". " + rewardTitle[i]);
						}
						
						pService.changeRewardSellCount(map);
					}
				}
				scheduleMap.put("reward_buy_list", sb.toString());
				scheduleMap.put("card_name", billingMap.get("card_name"));
				scheduleMap.put("card_number", billingMap.get("card_number"));
				scheduleMap.put("fundingNum", String.valueOf(fundingNum));
				pService.insertPaySchedule(scheduleMap);
				
				ps = new PaySchedule(scheduleMap);
				
			}
		}
		
		int totalCount = 0;
		model.addAttribute("paySchedule", ps);
		model.addAttribute("rewardTitles", rewardTitle);
		model.addAttribute("totalAmount", totalAmount);
		for(int i=0 ; i<rewardCount.length; i++) {
			totalCount += rewardCount[i];
		}
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("rewardCount", rewardCount);
		return "payReceiptView";
	}
	
	/*
	 * 빌링키 이용 재결제
	 */
	@RequestMapping("payAgain.pay")
	public String payAgain(@ModelAttribute PaySchedule paySchedule, Model model) {
		
		String accessToken = getAccessToken();
		
		CloseableHttpClient client = HttpClientBuilder.create().build();
		
		HttpPost post = new HttpPost(RESTAPI_PAY_AGAIN);
		post.setHeader("Authorization", accessToken);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("customer_uid", paySchedule.getCustomerUId());
		map.put("merchant_uid", paySchedule.getMerchantUId());
		map.put("amount", String.valueOf(paySchedule.getAmount()));
		map.put("name", paySchedule.getMerchantName());
		
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map), "UTF-8"));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			System.out.println(rootNode.toString());

			int resCode = rootNode.get("code").asInt();
			if(resCode != 0) {
				String resMessage = rootNode.get("message").asText();
				throw new PayException(resMessage);
			} else {
				JsonNode resNode = rootNode.get("response");
				System.out.println(resNode.toString());
				String status = resNode.get("status").asText();
				if(status.equals("paid")) {
					Map<String, String> uMap = new HashMap<String, String>();
					uMap.put("payStatus", status);
					uMap.put("mUId", resNode.get("merchant_uid").asText());
					
					pService.updatePayStatus(uMap);
					
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				post.releaseConnection();
				client.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		return "";
		
	}

	/*
	 * 아임포트 결제예약
	 */
	private Map<String, String> paySchedule(String fundingTitle, Date scheduleDate, int totalAmount, 
																			String buyerName, String buyerTel, String buyerFullAddress, 
																			String accessToken, String customer_uid) {
		String responseMessage = "";
		
		String merchant_uid = "";
		int merchantSeqeunce = pService.selectMerchantSequence();
		merchant_uid = fundingTitle + "_" + merchantSeqeunce;
		
		LocalDate tempDate = LocalDate.now();
		String dateTime = tempDate.toString();
		
		long schedule_at = scheduleDate.getTime() / 1000;
		schedule_at += 3600;
		//12월 25일 00시 00분으로 인식함.
		System.out.println("schedule_date : " + scheduleDate.getTime());
		System.out.println("schedule_at : " + schedule_at);
		System.out.println("merchant_uid : " + merchant_uid);
		
		CloseableHttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(RESTAPI_TRY_PAY_SCHEDULE);
		post.setHeader("Authorization", accessToken);
		
		JSONObject json = new JSONObject();
		json.put("customer_uid", customer_uid);
		
		JSONArray jsonArray = new JSONArray();
		JSONObject scheduleJson = new JSONObject();
		scheduleJson.put("amount", totalAmount);
		scheduleJson.put("schedule_at", schedule_at);
		scheduleJson.put("currency", "KRW");
		scheduleJson.put("merchant_uid", merchant_uid);
		scheduleJson.put("name", fundingTitle);
		scheduleJson.put("buyer_name", buyerName);
		scheduleJson.put("buyer_tel", buyerTel);
		scheduleJson.put("buyer_addr", buyerFullAddress);
		
		jsonArray.put(scheduleJson);
		json.put("schedules", jsonArray);
		
		Map<String, String> scheduleResultMap = new HashMap<String, String>();
		
		try {
			post.setEntity(new StringEntity(json.toString(), ContentType.APPLICATION_JSON));
			HttpResponse res = client.execute(post);
			
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			
			JsonNode resultResponseNode = null;
			if (resNode != null) {
				 resultResponseNode = resNode.get(0);
			}
			
			if(rootNode.get("code").asInt() == 1 || rootNode.get("code").asInt() == -1) {
				responseMessage = rootNode.get("message").asText();
				scheduleResultMap.put("message", responseMessage);
			} else {
				Iterator<String> iterator = resultResponseNode.fieldNames();
				while(iterator.hasNext()) {
					String nodeKey = iterator.next();
					switch (nodeKey) {
					case "customer_uid": scheduleResultMap.put("customer_uid", resultResponseNode.get(nodeKey).asText());
						break;
					case "merchant_uid": scheduleResultMap.put("merchant_uid", resultResponseNode.get(nodeKey).asText());
						break;
					case "name": scheduleResultMap.put("merchant_name", resultResponseNode.get(nodeKey).asText());
						break;
					case "buyer_name": scheduleResultMap.put("buyer_name", resultResponseNode.get(nodeKey).asText());
						break;
					case "buyer_tel": scheduleResultMap.put("buyer_tel", resultResponseNode.get(nodeKey).asText());
						break;
					case "buyer_addr": scheduleResultMap.put("buyer_addr", resultResponseNode.get(nodeKey).asText());
						break;
					case "schedule_status": scheduleResultMap.put("schedule_status", resultResponseNode.get(nodeKey).asText());
						break;
					case "payment_status": scheduleResultMap.put("payment_status", resultResponseNode.get(nodeKey).asText());
						break;
					case "amount": scheduleResultMap.put("amount", resultResponseNode.get(nodeKey).asText());
					break;
					default: break;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				post.releaseConnection();
				client.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return scheduleResultMap;
	}

	/*
	 * 아임포트 billing key 발급, customer_id 값 가져오기
	 */
	private Map<String, String> getBillingKey(String buyerName, String creditCardNumber, String creditCardExpiry,
																				String cardBirth, String cardPwd, String accessToken) {
		String customerId = "";
		String responseMessage = "";
		String cardNumber = "";
		String cardName = "";
		String reName = buyerName + "_";
		CloseableHttpClient client = HttpClientBuilder.create().build();
		LocalDate tempDate = LocalDate.now();
		String dateTime = tempDate.toString();
		String creditCardLastNum = creditCardNumber.substring(creditCardNumber.length() - 4);
		
		System.out.println("api 호출 url : " + RESTAPI_GET_BILLINGKEY + reName + dateTime + "_" + creditCardLastNum);
		System.out.println("카드번호 : " + creditCardNumber);
		System.out.println("유효기간 : " + creditCardExpiry);
		System.out.println("생년월일 : " + cardBirth);
		System.out.println("비밀번호 : " + cardPwd);
		HttpPost post = new HttpPost(RESTAPI_GET_BILLINGKEY + reName + dateTime + "_" + creditCardLastNum);
		post.setHeader("Authorization", accessToken);
		Map<String, String> map = new HashMap<String, String>();
		map.put("pg", "inicis");
		map.put("customer_uid", reName + dateTime + "_" + creditCardLastNum);
		map.put("card_number", creditCardNumber);
		map.put("expiry", creditCardExpiry);
		map.put("birth", cardBirth);
		map.put("pwd_2digit", cardPwd);
		
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			
			System.out.println("code : " + rootNode.get("code").asInt());
			System.out.println("message : " + rootNode.get("message").asText());
			
			if(rootNode.get("code").asInt() == -1) {
				responseMessage = rootNode.get("message").asText();
			} else {
				customerId = resNode.get("customer_uid").asText();
				cardName = resNode.get("card_name").asText();
				cardNumber = resNode.get("card_number").asText();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				post.releaseConnection();
				client.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		Map<String, String> resultMap = new HashMap<String, String>();
		if(responseMessage.equals("")) {
			resultMap.put("customer_uid", customerId);
			resultMap.put("card_name", cardName);
			resultMap.put("card_number", cardNumber);
		} else {
			resultMap.put("responseMessage", responseMessage);
		}

		return resultMap;
	}

	/*
	 *  아임포트 access token 발급
	 */
	private String getAccessToken() {
		String result = "";
		CloseableHttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(RESTAPI_GET_TOKEN);
		Map<String, String> map = new HashMap<String, String>();
		map.put("imp_key", IMP_KEY);
		map.put("imp_secret", IMP_SECRET);
		
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			result = resNode.get("access_token").asText();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				post.releaseConnection();
				client.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	/*
	 * REST API 송신 데이터 ENTITY작업
	 */
	private List<NameValuePair> convertParameter(Map<String, String> map) {
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		
		Set<Map.Entry<String, String>> entries = map.entrySet();
		for(Map.Entry<String, String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return paramList;
	}
}
