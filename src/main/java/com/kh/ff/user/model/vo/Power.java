package com.kh.ff.user.model.vo;

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
public class Power {

	private String userCode;		// 사용자코드(아이디)
	private String powerMaster;		// 마스터
	private String powerReceipt;	// 외래접수
	private String powerClinic;		// 외래진료
	private String powerList;		// 환자조회
	private String powerSub;		// 지원부서
	private String powerResult;		// 통계
	private String powerSheet;		// 진단서
	private String powerMessage;	// 메신저
	
}
