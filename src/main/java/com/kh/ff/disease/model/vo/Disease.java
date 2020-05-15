package com.kh.ff.disease.model.vo;

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
public class Disease {
	
	private int diseaseNo;				// 상병저장순서
	private String diseaseCode;			// 상병코드
	private String diseaseKorName;		// 상병한글명칭
	private String diseaseEngName;		// 상병영문명칭
	// -------------------------- 차트 부분
	private int chartNo;				// 차트번호
	//--------------------------- 추가컬럼
	private String userDepartment;		// 과목
	private String userLicense;			// 면허번호
	private String dnoInput;			// 상병코드 리스트 묶어놓은곳

}
