package com.kh.ff.symptom.model.vo;

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
public class Symptom {
	
	private int symptomNo;				// 증상저장순서
	private String symptomHistory;		// 증상내역
	private int chartNo;				// 차트번호
	// ------------------------- 추가컬럼
	private String receiptDate;			// 내원일자

}
