package com.kh.wantit.pay.vo;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class PaySchedule {
	private String customerUId;
	private String merchantUId;
	private String merchantName;
	private String buyerName;
	private String buyerTel;
	private String buyerAddr;
	private String scheduleStatus;
	private String paymentStatus;
	private String rewardBuyList;
	private String cardNumber;
	private String cardName;
	private String impUId;
	
	public PaySchedule(Map<String, String> scheduleMap) {
		this.customerUId = scheduleMap.get("customer_uid");
		this.merchantUId = scheduleMap.get("merchant_uid");
		this.merchantName = scheduleMap.get("merchant_name");
		this.buyerName = scheduleMap.get("buyer_name");
		this.buyerTel = scheduleMap.get("buyer_tel");
		this.buyerAddr = scheduleMap.get("buyer_addr");
		this.scheduleStatus = scheduleMap.get("schedule_status");
		this.paymentStatus = scheduleMap.get("payment_status");
		this.rewardBuyList = scheduleMap.get("reward_buy_list");
		this.cardNumber = scheduleMap.get("card_number");
		this.cardName = scheduleMap.get("card_name");
		this.impUId = scheduleMap.get("imp_uid");
	}
	
}
