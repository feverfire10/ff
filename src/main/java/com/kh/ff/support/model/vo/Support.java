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
public class Support {
	private int chartNo;					// 차트번호
	private String receiptDate;			// 내원날짜
	private String patientsName;		// 환자명
	private String patientsPrivateNo;	// 주민번호
	private String insurance;			// 보험유형
	private String prescripType;		// 처방분류
	private String prescripUserCode;	// 처방코드
	private String prescripName;		// 처방명
	private int numTimes;				// 시행횟수
	private String nightTime;			// 야간
	private String emergency;			// 응급
	private String mo;					// 담당의
	private int clinicState;				// 진료상태
}
