package com.kh.ff.prescription.model.vo;

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
public class Prescription {
	// -------------------------------- 처방 부분
	private String prescripUserCode;		// 처방사용자코드
	private String prescripCode;			// 처방청구코드
	private String prescripType;			// 처방분류
	private String prescripName;			// 처방명칭
	private int prescripInsup;				// 처방보험금액
	private int prescripGenep;				// 처방일반금액
	private String prescripInsuOffice;		// 제약회사
	// ------------------------------- 차트 부분
	private int prescriptionNo;				// 처방저장순서
	private String actionYn;				// 시행여부
	private int chartNo;					// 차트번호
	private int totalAd;					// 총투여
	private int numTimes;					// 횟수
	private int numDays;					// 일수
	private int salaryClassific;			// 급여구분
	private String nighttime;				// 야간여부
	private String emergency;				// 응급여부
	// ------------------------------- 추가컬럼
	private String adhd;					// 초/재진
	private String preCodeInput;			// 처방코드 리스트 묶어놓은곳
}
