package com.kh.ff.support.model.vo;

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
public class PrescriptionChart {
	private int presciptionNo;
	private String ActionYesNo;
	private String prescriptUserCode;
	private int chartNo;
	private int totalAd;
	private int numTimes;
	private int numDays;
	private String salaryClassific;
	private String nightTime;
	private String Emergency;
}
