package com.kh.ff.rightClinic.model.vo;

import java.sql.Date;

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
public class PatientJs {
	
	private int patientsNo;			// 환자번호
	private String patientsName;	// 환자이름
	private String patientsPno;		// 환자주민번호
	private String insurance;		// 보험유형
	private String address;			// 주소
	private String phone;			// 전화번호
	private Date firstVisit;		// 최초내원일
	private Date lastVisit;			// 전 진료일
	private String firstDo;			// 진료실
	private String lastDo;			// 전 진료실
	private String mo;				// 담당의
	private String adhd;			// 초재진
	private String dayNote;			// 당일메모
	private String chainNote;		// 연속메모
	private String night;			// 야간업무
	private String emergency;		// 응급여부
	private int chartNo;			// 차트번호
	private String receiptDate;		// 내원날짜
	private int clinicState;		// 진료상태
}





