package com.kh.ff.rightClinic.model.service;

import java.util.ArrayList;

import com.kh.ff.rightClinic.model.vo.DiseaseRc;
import com.kh.ff.rightClinic.model.vo.PatientJs;
import com.kh.ff.rightClinic.model.vo.PrescriptionRc;
import com.kh.ff.rightClinic.model.vo.SymptomRc;

public interface RightClinicService {
	
	ArrayList<PatientJs> selPatientsList(String receiptDate, String patientsName, String clinicState);
	
	ArrayList<PatientJs> selOnePatientList(String patiName, String patiSSN);
	
	ArrayList<DiseaseRc> selDiseaseHistory(String clickDate, String clickPatientsName, String clickPatientsPno);
	
	ArrayList<SymptomRc> selSymptomHistory(String clickDate, String clickPatientsName, String clickPatientsPno);
	
	ArrayList<PrescriptionRc> selPrescriptionHistory(String clickDate, String clickPatientsName, String clickPatientsPno);
}








