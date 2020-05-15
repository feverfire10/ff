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
public class DiseaseRc {
	
	private int chartNo;			// 차트번호
	private int diseaseNo;			// 상병번호
	private String diseaseCode;		// 상병코드
	private String diseaseKname;	// 상병한글명칭
	private String diseaseEname;	// 상병영문명칭
}
