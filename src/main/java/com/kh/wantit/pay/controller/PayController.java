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

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.JsonNodeType;
import com.google.gson.JsonObject;
import com.kh.wantit.funding.model.vo.Funding;
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
	private final static String RESTAPI_PAY_AGAIN = "https://api.iamport.kr/subscribe/payments/again";
	
	@Autowired
	private PayService pService;

	@RequestMapping("payView.pay")
	public String payView(@RequestParam("fundingNum") int fundingNum, Model model) {
		
		ArrayList<Reward> rewardList = pService.getRewardList(fundingNum);
		String fundingTitle = pService.getFundingTitle(fundingNum);
		Funding funding = pService.getFundingInfo(fundingNum);
		Date fundingEnd = funding.getFundingEnd();
		
		model.addAttribute("rewardList", rewardList);
		model.addAttribute("fundingTitle", fundingTitle);
		model.addAttribute("fundingNum", fundingNum);
		model.addAttribute("fundingEnd", fundingEnd);
		
		return "payView";
	}
	
	@RequestMapping("seeMyPaySchedule.pay") 
		public String seeMyPaySchedule(@ModelAttribute("paySchedule") PaySchedule paySchedule, 
																	@RequestParam("fundingTitle") String fundingTitle, Model model) {
			
			model.addAttribute("fundingTitle", fundingTitle);
			model.addAttribute("paySchedule", paySchedule);
			
		return "mpToPayReceiptView";
		}
	
	
	
	// 관리자 or 크리에이터 쪽 결제상태 최신화작업
	@RequestMapping("payStatusRenewal.pay")
	public String payStatusRenewal(@RequestParam("fundingNum") int fundingNum, 
																Model model, HttpServletRequest req) {
		
		//펀딩등록된 번호에 해당하는 merchant_uid값들을 가져옴
		ArrayList<String> merchantUIdList = pService.getMerchantUId(fundingNum);
		
		//액세스 토큰 발급
		String accessToken = getAccessToken();
		
		//결제상태 가져오는 api는 get방식으로 호출하기 때문에 파라미터들을 나열하기 위한 작업
		StringBuilder sb = new StringBuilder();
		sb.append(RESTAPI_SEARCH_PAYLIST).append("?");
		for(int i=0 ; i<merchantUIdList.size() ; i++) {
			if(i != 0 && i != merchantUIdList.size()) {
				sb.append("&");
			}
			sb.append("merchant_uid[]=" + merchantUIdList.get(i));
		}
		
		//요청 보낼시 띄어쓰기 처리
		String replace = sb.toString().replaceAll(" ", "%20");
		
		//http 웹 통신 위해 client 생성, get 방식
		CloseableHttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(replace);
		get.setHeader("Authorization", accessToken);
		
		//db에 paySchedule 데이터들을 업데이트하기 위한 list들
		ArrayList<String> responseMerchantUId = new ArrayList<String>();
		ArrayList<String> responseStatus = new ArrayList<String>();
		
		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			
			//반환된 body값 중 merchant_uid와 status 필드값들을 가져와서 각각 list에 넣음
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
		
		//가져온 list들을 대상으로 하나씩 paySchedule 테이블에 들어있는 데이터들 중
		//merchant_uid에 알맞은 데이터 중 status 칼럼을 업데이트
		for(int i=0 ; i<responseMerchantUId.size() ; i++) {
			Map<String, String> updateStatusMap = new HashMap<String, String>();
			updateStatusMap.put("mUId", responseMerchantUId.get(i));
			updateStatusMap.put("payStatus", responseStatus.get(i));
			
			pService.updatePayStatus(updateStatusMap);
		
		}
		String referer = req.getHeader("Referer");
		
		return "redirect:" + referer;
	}
	
	//예약된 결제건 취소
	@RequestMapping("cancelPaySchedule.pay")
	public String cancelPaySchedule(@RequestParam("customerUId") String customerUId, @RequestParam("fundingNum") int fundingNum,
															@RequestParam("merchantUId") String merchantUId, @RequestParam("buyerName") String buyerName, 
															@RequestParam("amount") int totalAmount, @RequestParam("rewardCount") int[] rewardCount, 
															Model model, RedirectAttributes re) {
		
		//예약결제 취소 요청위해 필요한 파라미터
		Map<String, String> map = new HashMap<String, String>();
		map.put("customerUId", customerUId);
		map.put("merchantUId", merchantUId);
		map.put("buyerName", buyerName);
		
		
		//db에 결제정보가 존재하는지 판단
		int checkScheduled = pService.checkScheduled(map);
		//액세스 토큰 필요하기 때문에 발급
		String access_token = getAccessToken();
		
		//결제정보가 존재할 때
		if(checkScheduled == 1) {
			//http 웹 통신 위해 client 생성, post 방식
			CloseableHttpClient client = HttpClientBuilder.create().build();
			HttpPost post = new HttpPost(RESTAPI_TRY_PAY_UNSCHEDULE);
			
			//헤더에 액세스토큰 추가
			post.setHeader("Authorization", access_token);
			
			//요청값 보낼 엔티티 생성
			Map<String, String> entityMap = new HashMap<String, String>();
			entityMap.put("customer_uid", customerUId);
			entityMap.put("merchant_uid", merchantUId);
			
			try {
				//엔티티안에 한글이 포함되어있기 때문에, 엔티티 설정 시 UTF-8 지정
				post.setEntity(new UrlEncodedFormEntity(convertParameter(entityMap), "UTF-8"));
				HttpResponse res = client.execute(post);
				
				ObjectMapper mapper = new ObjectMapper();
				String body = EntityUtils.toString(res.getEntity());
				JsonNode rootNode = mapper.readTree(body);
				
				//요청 성공, 실패여부 판단
				int resCode = rootNode.get("code").asInt();
				String message = rootNode.get("message").asText();
				
				//결제취소에 실패한 경우
				if(resCode != 0) {
					throw new PayException(message);
				} else {
					//결제취소에 성공한 경우
					JsonNode resNode = rootNode.get("response");
					
					//반환값 중 schedule_status에 해당하는 문자열 값 가져옴
					String schedule_status = resNode.get(0).get("schedule_status").asText();
					
					//취소가 된 상태일 경우(다른 상태는 확인하지 못함)
					if(schedule_status.equals("revoked")) {
						
						//db에 paySchedule 테이블에 현재 취소하는 건의 데이터중 status 칼럼값을 변경
						Map<String, String> unscheduleMap = new HashMap<String, String>();
						unscheduleMap.put("customer_uid", customerUId);
						unscheduleMap.put("merchant_uid", merchantUId);
						unscheduleMap.put("buyer_name", buyerName);
						
						pService.updateScheduleStatus(unscheduleMap);
						
						//취소하였으니 펀딩중인 제품의 달성금액을 차감시켜야 함
						//calculate값이 0이면 달성금액중 결제된 금액을 뺌
						Map<String, Integer> updateCurrentMoneyMap = new HashMap<String, Integer>();
						updateCurrentMoneyMap.put("fundingNum", fundingNum);
						updateCurrentMoneyMap.put("totalAmount", totalAmount);
						updateCurrentMoneyMap.put("calculate", 0);
						pService.updateCurrentMoney(updateCurrentMoneyMap);
						
						//등록된 제품의 남아있는 재고 업데이트
						//각 제품마다 구매한 만큼 다시 재고를 늘림
						ArrayList<Reward> rewardList = pService.getRewardList(fundingNum);
						for(int i=0 ; i<rewardList.size() ; i++) {
							Reward r = rewardList.get(i);
							r.setRewardSellCount(r.getRewardSellCount() - rewardCount[i]);
							pService.rollBackSellCount(r);
						}
						
						//메인 페이지로 돌아갈 때 알람창을 띄우기 위해 attribute 생성
						re.addAttribute("cancelPayScuccess", "cancelPayScuccess");
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
		return "redirect:home.do";
	}
	
	@RequestMapping("loginTest.pay")
	public String loginTest(Model model) {
		
		TestMember m = pService.loginTest();
		
		model.addAttribute("loginUser", m);
		return "../home";
	}
	
	//결제 예약(토큰, 빌링키)
	@RequestMapping("paySchedule.pay")
	public String paySchedule(@RequestParam("rewardCount") int[] rewardCount, @RequestParam("rewardNum") int[] rewardNum,
												@RequestParam("fundingTitle") String fundingTitle, @RequestParam("totalAmount") int totalAmount,
												@RequestParam("cardNum") String[] cardNum, @RequestParam("cardExpiry") String[] cardExpiry,
												@RequestParam("cardPwd") String cardPwd, @RequestParam("cardBirth") String cardBirth,
												@RequestParam("buyerName") String buyerName, @RequestParam("buyerTel") String buyerTel,
												@RequestParam("buyerAddr") String[] buyerAddr, @RequestParam("postReq") String postReq,
												@RequestParam("rewardExpectDate") Date[] rewardExpectDate,  @RequestParam("fundingNum") int fundingNum,
												@RequestParam("rewardTitle") String[] rewardTitle, @RequestParam("fundingEnd") Date fundingEnd, Model model) {
		
		//db에 선택한 상품과 개수 들어가게 할 StringBuilder 생성
		StringBuilder sb = new StringBuilder();
		
		//신용카드 형식으로 카드번호, 유효기간 조합, 배송지 상세주소 구분하기 위해 주소 재구성
		String creditCardNumber = cardNum[0] + "-" +  cardNum[1] + "-" + cardNum[2] + "-" + cardNum[3];
		String creditCardExpiry = "20" + cardExpiry[1] + "-" + cardExpiry[0];
		String buyerFullAddress = buyerAddr[0] + " // " + buyerAddr[1];
		
		//아임포트 access token 발급
		String accessToken = getAccessToken();
		
		//아임포트 billing key 발급, customer_id 값 가져오기
		Map<String, String> billingMap = getBillingKey(buyerName, creditCardNumber, creditCardExpiry, cardBirth, cardPwd, accessToken);
		
		//결제성공 뷰에 넘길 데이터 정의
		PaySchedule ps = null;
		
		//db에 paySchedule 테이블에 들어갈 데이터 정의
		Map<String, String> scheduleMap = new HashMap<String, String>();
		
		//빌링키 발급에 실패할 경우
		if(billingMap.containsKey("responseMessage")) {
			throw new PayException(billingMap.get("responseMessage"));
			
		//정상적으로 빌링키발급(customer_uid)에 성공할 경우
		} else if(billingMap.containsKey("customer_uid")) {
			
			//아임포트 결제예약 API 실행
			scheduleMap = paySchedule(fundingTitle, fundingEnd, totalAmount, buyerName, buyerTel, buyerFullAddress, accessToken, billingMap.get("customer_uid"), fundingNum);
			
			//예약결제에 실패할 경우
			if(scheduleMap.containsKey("message")) {
				throw new PayException(scheduleMap.get("message"));
				
			//예약결제 성공할 경우
			} else {
				
				//선택한 상품과 개수내용이 paySchedule에 들어감
				//등록되어있는 상품의 재고 변경하기위해 상품번호와 팔린 갯수 얻어서
				for(int i=0 ; i<rewardCount.length ; i++) {
					if(rewardCount[i] != 0) {
						Map<String, Integer> map = new HashMap<String, Integer>();
						map.put("rewardNum", rewardNum[i]);
						map.put("rewardCount", rewardCount[i]);
						if(i != rewardCount.length - 1) {
							sb.append(i+1 + ". " + rewardTitle[i] + "count=" + rewardCount[i]);
							sb.append("/");
						} else {
							sb.append(i+1 + ". " + rewardTitle[i] + "count=" + rewardCount[i]);
						}
						
						//상품 재고 업데이트
						pService.changeRewardSellCount(map);
					}
				}
				scheduleMap.put("reward_buy_list", sb.toString());
				scheduleMap.put("card_name", billingMap.get("card_name"));
				scheduleMap.put("card_number", billingMap.get("card_number"));
				scheduleMap.put("fundingNum", String.valueOf(fundingNum));
				//db에 예약한 결제 데이터 삽입
				pService.insertPaySchedule(scheduleMap);
				
				ps = new PaySchedule(scheduleMap);
			}
		}
		
		model.addAttribute("paySchedule", ps);
		model.addAttribute("rewardTitles", rewardTitle);
		model.addAttribute("totalAmount", totalAmount);
		
		//총 몇개 구매하였는지 구하기
		int totalCount = 0;
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

			int resCode = rootNode.get("code").asInt();
			if(resCode != 0) {
				String resMessage = rootNode.get("message").asText();
				throw new PayException(resMessage);
			} else {
				JsonNode resNode = rootNode.get("response");
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

	//아임포트 결제예약
	private Map<String, String> paySchedule(String fundingTitle, Date scheduleDate, int totalAmount, 
																			String buyerName, String buyerTel, String buyerFullAddress, 
																			String accessToken, String customer_uid, int fundingNum) {
		
		//예약결제 중 schedules FormData에 merchant_uid는 가맹점 주문번호
		//중복된 값이 들어오면 안되기 때문에 oracle에서 만들어둔 sequence를 가져와 데이터 변환
		String merchant_uid = "";
		int merchantSeqeunce = pService.selectMerchantSequence();
		merchant_uid = fundingTitle + "_" + merchantSeqeunce;
		
		
		//schedules FormData에 schedule_at 파라미터는 유닉스타임값을 보내야 하기 때문에 유닉스타임으로 변경
		//결제될 시간은 펀딩 마감종료일 + 1시간
		long schedule_at = (scheduleDate.getTime() + 86400000) / 1000 + 3600;
		
		//http 웹 통신위해 client 생성, post 방식으로 API 호출
		CloseableHttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(RESTAPI_TRY_PAY_SCHEDULE);
		//받아둔 토큰값 헤더에 삽입
		post.setHeader("Authorization", accessToken);
		
		//요청보낼 FormData 구성, 다른 API와 다르게 FormData 안에 FormData가 요청값으로 들어가기 때문에
		//jsonArray로 전송해야 함
		JSONArray jsonArray = new JSONArray();
		
		JSONObject json = new JSONObject();
		json.put("customer_uid", customer_uid);
		
		//FormData 중 scheuldes라는 FormData 요청값 필요하므로 해당 데이터만 담을 scheduleJson 객체 생성
		JSONObject scheduleJson = new JSONObject();
		scheduleJson.put("amount", totalAmount);						//구매 금액
		scheduleJson.put("schedule_at", schedule_at);					//자동 결제될 시간
		scheduleJson.put("currency", "KRW");								//화폐단위
		scheduleJson.put("merchant_uid", merchant_uid);			//가맹점 주문번호
		scheduleJson.put("name", fundingTitle);							//상품 게시물 제목
		scheduleJson.put("buyer_name", buyerName);					//구매자 이름
		scheduleJson.put("buyer_tel", buyerTel);							//구매자 번호
		scheduleJson.put("buyer_addr", buyerFullAddress);			//구매자 배송지 주소
		
		//jsonArray안에 scheduleJson 담고 최종적으로 요청보낼 json객체에 담기
		jsonArray.put(scheduleJson);
		json.put("schedules", jsonArray);
		
		//응답값 담을 map객체 선언
		Map<String, String> scheduleResultMap = new HashMap<String, String>();
		
		//실패시 응답메시지 담을 문자열 선언
		String responseMessage = "";
		try {
			//list형식으로 보내지 않고 json형식으로 전송해야 하기 때문에 위에 만들어둔 json객체를 엔티티로 사용
			post.setEntity(new StringEntity(json.toString(), ContentType.APPLICATION_JSON));
			HttpResponse res = client.execute(post);
			
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			
			//예약결제가 반환하는 body에는 객체가 배열형식으로 들어가있는 상태로 반환하기 때문에
			//객체배열에서 객체값을 얻기위해 JsonNode 객체 생성
			JsonNode resultResponseNode = null;
			if (resNode != null) {
				//응답 성공한 경우 resultResponseNode에 첫 인덱스 객체 가져옴
				 resultResponseNode = resNode.get(0);
			}
			
			if(rootNode.get("code").asInt() == 1 || rootNode.get("code").asInt() == -1) {
				//예약결제가 실패한 경우 응답메세지 삽입
				responseMessage = rootNode.get("message").asText();
				scheduleResultMap.put("message", responseMessage);
			} else {
				//예약결제가 성공한 경우 가져온 객체에 필드이름에 따라 알맞은 key, value값을 scheduleResultMap에 추가
				Iterator<String> iterator = resultResponseNode.fieldNames();
				while(iterator.hasNext()) {
					//iterator 사용해 가져온 key, value중 key값 기준으로 데이터 삽입
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
			
				//펀딩중인 제품의 달성금액을 업데이트
				//calculate의 value가 1이면 달성금액에 현재 결제하고 있는 금액을 추가
				Map<String, Integer> updateCurrentMoneyMap = new HashMap<String, Integer>();
				updateCurrentMoneyMap.put("fundingNum", fundingNum);
				updateCurrentMoneyMap.put("totalAmount", totalAmount);
				updateCurrentMoneyMap.put("calculate", 1);
				pService.updateCurrentMoney(updateCurrentMoneyMap);
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

	
	 // 아임포트 billing key 발급, customer_uid 값 가져오기
	 // 예약결제 이용시 등록된 customer_uid 빌링키가 있어야 해당하는 빌링키로 schedule 정보가 예약됨
	private Map<String, String> getBillingKey(String buyerName, String creditCardNumber, String creditCardExpiry,
																				String cardBirth, String cardPwd, String accessToken) {
		
		//빌링키 발급 실패시 담을 실패 메세지
		String responseMessage = "";
		
		//빌링키 발급 성공시 담을 customer_uid와 카드정보, 구매자 이름
		String response_customer_uid = "";
		String cardNumber = "";
		String cardName = "";
		String reName = buyerName + "_";
		
		//결제수단 식별 중복불가한 고유번호이므로 중복되지 않게 날짜와 카드번호 마지막 4자리 조합
		LocalDate tempDate = LocalDate.now();
		String dateTime = tempDate.toString();
		String creditCardLastNum = creditCardNumber.substring(creditCardNumber.length() - 4);
		String request_customer_uid =  reName + dateTime + "_" + creditCardLastNum;
		
		//http 웹 통신위해 client 생성, post 방식으로 API 호출
		CloseableHttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(RESTAPI_GET_BILLINGKEY + request_customer_uid);
		
		//받아둔 토큰값 헤더에 삽입
		post.setHeader("Authorization", accessToken);
		
		//빌링키 발급에 필요한 FormData
		Map<String, String> map = new HashMap<String, String>();
		map.put("pg", "inicis");																								// pg : 결제 가맹점
		map.put("customer_uid",request_customer_uid);													// customer_uid : 결제 고유번호
		map.put("card_number", creditCardNumber);														// card_number : 카드번호
		map.put("expiry", creditCardExpiry);																		// expiry : 카드 유효기간
		map.put("birth", cardBirth);																						// birth : 생년월일
		map.put("pwd_2digit", cardPwd);																			// 카드 비밀번호 앞 2자리
		
		//rest api 요청후 반한값들 담기
		try {
			//convertParameter 함수 이용해 엔티티 전송
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post);
			
			//HttpResponse로 요청 결과값 받아서 code값에 대한 로직처리
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			
			//빌링키 발급에 실패한 경우
			if(rootNode.get("code").asInt() == -1) {
				responseMessage = rootNode.get("message").asText();
			} else {
			//빌링키 발급에 성공한 경우
				response_customer_uid = resNode.get("customer_uid").asText();
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
		
		//빌링키 발급 결과에 대한 map 생성
		Map<String, String> resultMap = new HashMap<String, String>();
		//발급 성공한 경우
		if(responseMessage.equals("")) {
			resultMap.put("customer_uid", response_customer_uid);
			resultMap.put("card_name", cardName);
			resultMap.put("card_number", cardNumber);
		} else {
		//발급 실패한 경우 
			resultMap.put("responseMessage", responseMessage);
		}

		return resultMap;
	}

	
	   //아임포트 API 이용하기 위한 access token 발급
	private String getAccessToken() {
		//리턴할 토큰 저장하기 위한 result 변수 설정
		String result = "";
		
		//http 웹 통신 위해 client 생성, post 방식
		CloseableHttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(RESTAPI_GET_TOKEN);
		
		//아임포트 REST API키와 secret키 map으로 생성
		Map<String, String> map = new HashMap<String, String>();
		map.put("imp_key", IMP_KEY);
		map.put("imp_secret", IMP_SECRET);
		
		//rest api 요청 후 반환값 담기
		try {
			//convertParameter 함수 이용해 엔티티 전송
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post);
			
			//HttpResponse로 요청 결과값 받아서 body값 중 accest_token 키값 가져오기
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
	

	 // REST API 송신 데이터 ENTITY작업
	private List<NameValuePair> convertParameter(Map<String, String> map) {
		//http 프로토콜 클라이언트로 서버에 데이터 전송위해 Name, Value를 가지고있는 list형식으로 변환
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		
		Set<Map.Entry<String, String>> entries = map.entrySet();
		//map에 저장된 값들을 entrySet 이용하여 list에 추가
		for(Map.Entry<String, String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return paramList;
	}
}
