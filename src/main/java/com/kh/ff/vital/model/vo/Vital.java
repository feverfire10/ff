package com.kh.ff.vital.model.vo;

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
public class Vital {
	
	private int vitalNo;		// 바이탈번호
	private int maxBp;			// 최고혈압
	private int minBp;			// 최저혈압
	private int beforeBs;		// 식전혈당
	private int afterBs;		// 식후혈당
	private double weight;		// 몸무게
	private double height;		// 키
	private double fever;		// 체온
	private int chartNo;		// 차트번호
	// ------------------------ 추가 컬럼
	private String receiptDate;	// 입력일시
	
}
