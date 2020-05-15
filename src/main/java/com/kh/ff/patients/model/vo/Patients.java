package com.kh.ff.patients.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Patients {

	
	private int patientsNo;
	private String patientsName;
	private String patientsPno;
	private String insurance;
	private String address;
	private String phone;
	private String firstVisit;
	private String lastVisit;
	private String Do;
	private String lastDo;
	private String mo;
	private String adhd;
	private String dayNote;
	private String chainNote;
	private int chartNo;

}
