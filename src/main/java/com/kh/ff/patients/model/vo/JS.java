package com.kh.ff.patients.model.vo;

import java.sql.Timestamp;

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
public class JS {
	
	private int chartNo;
	private String receiptDate;
	private int clinicState;
	private int patientsNo;
	private int patientsPno;

}
