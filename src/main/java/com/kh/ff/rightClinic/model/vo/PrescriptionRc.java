package com.kh.ff.rightClinic.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class PrescriptionRc {

	private int chartNo;					// 차트번호
	private String actionYn;				// 시행여부
	private String prescripUserCode;		// 처방코드
	private int totalAd;					// 총투여
	private int numTimes;					// 횟수
	private int numDays;					// 일수
	private String salaryClassific;			// 급여구분
	private String nightTime;				// 야간
	private String emergency;				// 응급
	private String prescripCode;			// 처방청구코드
	private String prescripType;			// 처방분류
	private String prescripName;			// 처방명칭
	private int prescripInsup;				// 처방보험금액
	private int prescripGenep;				// 처방일반금액
	private String prescripInsuOffice;		// 제약회사
}
