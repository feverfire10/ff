package com.kh.ff.receipt.model.vo;

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
public class BillForm {
	private int billFormNo;
	private int patientsNo;
	private String pbVisitDate;
	private int checkup; // 진찰료
	private int hospitalization;
	private int meals;
	private int dose; // 투약
	private int injection;
	private int anesthetize;
	private int operation; // 처치
	private int examination;
	private int radiation; // 방사선
	private int treatment;
	private int selfPay;
	private int physicalTherapy;
	private int psychotherapeutics;
	private int ultrasonic;
	private int selectionTreat;
	private int medicalHerbs;
	private int etc;
	private int chartNo;
	private String patientsName;
	private String dayNote;
	private String chainNote;
	private String insurance;
	private String patientsPno;
	private String adhd;
	private String mo;
}
