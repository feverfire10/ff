package com.kh.ff.js.model.vo;

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
public class Js {
	
	private int chartNo;			// 차트번호
	private String receiptDate;		// 내원날짜
	private int clinicState;		// 진료상태(0:진료대기, 1:진료보류, 2:진료완료)
	private int patientsNo;			// 환자번호
	//------------------- 추가 컬럼
	private String patientsName;	// 환자이름
	private int age;				// 환자나이
	private String gender;			// 성별
	private String adhd;			// 초재진 구분
	private String mo;				// 의사이름
	private String insurance;		// 보험유형
	private String patientsPno;		// 주민번호
	private String startDay;		// 검색 시작일
	private String endDay;			// 검색 종료일

}
