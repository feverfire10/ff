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
public class SymptomRc {
	private int chartNo;			// 차트번호
	private int symptomNo;			// 증상번호
	private String symptomHistory;  // 증상내역
}
