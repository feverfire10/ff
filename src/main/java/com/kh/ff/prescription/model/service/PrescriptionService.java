package com.kh.ff.prescription.model.service;

import java.util.ArrayList;

import com.kh.ff.js.model.vo.Js;
import com.kh.ff.prescription.model.vo.Prescription;

public interface PrescriptionService {
	
	ArrayList<Prescription> selectPrescriptionAll();
	ArrayList<Prescription> selectPrescriptionBase();
	ArrayList<Prescription> selectPrescriptionMedi();
	ArrayList<Prescription> selectPrescriptionHand();
	ArrayList<Prescription> selectPrescriptionXray();
	ArrayList<Prescription> selectPrescriptionCheckup();
	
	ArrayList<Prescription> selectPrescriptionList(Js j);
	
	Prescription infoPriceGene(Prescription p);
	Prescription infoPriceInsu(Prescription p);
	
	int insertPrscription(String pCode, Prescription p);
	
	int insertBillForm(Prescription p);
	
	int deletePreCode(Prescription p);
	
	ArrayList<Prescription> divPrescriptionArea();
	

}
