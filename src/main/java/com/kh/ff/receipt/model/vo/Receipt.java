package com.kh.ff.receipt.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Receipt {
	
	private int billFormNo;
	private int totalBill;
	private int discount;
	private int cardPay;
	private String memo;
	private Date payDate;
	private int cashPay;

}
