package com.kh.ff.user.model.vo;

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
public class User {

	private String userCode;			// 사용자코드(아이디)
	private String userPassword;		// 사용자암호
	private String userName;			// 담당자명
	private String userDepartment;		// 소속과목
	private String userNo;					// 사원번호
	private String userLicense;			// 면허번호
	private String userSocialNo;	// 주민번호
	private String userEmail;			// 이메일
	private String userDoctor;			// 의사여부
	private String userApplicationDate;	// 적용일자
	private String userExpirationDate;	// 만료일자
	private String userStatus;			// 상태
	private String powerMaster;			// 마스터권한	
	private String powerReceipt;	// 외래접수
	private String powerClinic;		// 외래진료
	private String powerList;		// 환자조회
	private String powerSub;		// 지원부서
	private String powerResult;		// 통계
	private String powerSheet;		// 진단서
	private String powerMessage;	// 메신저
	
}
