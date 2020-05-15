package com.kh.ff.prescription.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ff.prescription.model.service.PrescriptionService;
import com.kh.ff.prescription.model.vo.Prescription;

@Controller
public class PrescriptionController {
	
	@Autowired
	private PrescriptionService pService;
	
	@ResponseBody
	@RequestMapping(value="selectPrescriptionAll.pr", produces="application/json")
	public String selectPrescriptionAll() {
		//ArrayList<Prescription> pAllList = pService.selectPrescriptionAll();
		//return new Gson().toJson(pAllList);
		return null;
	}
	@ResponseBody
	@RequestMapping(value="selectPrescriptionBase.pr", produces="application/json")
	public String selectPrescriptionBase() {
		//ArrayList<Prescription> bList = pService.selectPrescriptionBase();
		//return new Gson().toJson(bList);
		return null;
	}
	@ResponseBody
	@RequestMapping(value="selectPrescriptionMedi.pr", produces="application/json")
	public String selectPrescriptionMedi() {
		//ArrayList<Prescription> mList = pService.selectPrescriptionMedi();
		//return new Gson().toJson(mList);
		return null;
	}
	@ResponseBody
	@RequestMapping(value="selectPrescriptionHand.pr", produces="application/json")
	public String selectPrescriptionHand() {
		//ArrayList<Prescription> hList = pService.selectPrescriptionHand();
		//return new Gson().toJson(hList);
		return null;
	}
	@ResponseBody
	@RequestMapping(value="selectPrescriptionXray.pr", produces="application/json")
	public String selectPrescriptionXray() {
		//ArrayList<Prescription> xList = pService.selectPrescriptionXray();
		//return new Gson().toJson(xList);
		return null;
	}
	@ResponseBody
	@RequestMapping(value="selectPrescriptionCheckup.pr", produces="application/json")
	public String selectPrescriptionCheckup() {
		//ArrayList<Prescription> cList = pService.selectPrescriptionCheckup();
		//return new Gson().toJson(cList);
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value="infoPrice.pr", produces="application/json")
	public String infoPrice(Prescription p) {
		Prescription basicP = null;
		
		if(p.getPrescripType().equals("1")) {
			basicP = pService.infoPriceGene(p);
		}else {
			basicP = pService.infoPriceInsu(p);
		}
		return new Gson().toJson(basicP);
	}
	@ResponseBody
	@RequestMapping(value="emerPrice.pr", produces="application/json")
	public String emerPrice(Prescription p) {
		Prescription basicP = null;
		
		if(p.getPrescripType().equals("1")) {
			basicP = pService.infoPriceGene(p);
		}else {
			basicP = pService.infoPriceInsu(p);
		}
		return new Gson().toJson(basicP);
	}
	
	@ResponseBody
	@RequestMapping(value="deletePreCode.pr", produces="application/json; charset=utf-8")
	public String deletePreCode(Prescription p) {
		int result = pService.deletePreCode(p);
		String msg = "";
		if(result > 0) {
			msg = "선택 처방 삭제 완료";
		}else {
			msg = "선택 처방 삭제 실패";
		}
		return new Gson().toJson(msg);
	}
	
	@ResponseBody
	@RequestMapping(value="divPrescriptionArea.pr", produces="application/json; charset=utf-8")
	public String divPrescriptionArea() {
		//ArrayList<Prescription> divList = pService.divPrescriptionArea();
		//return new Gson().toJson(divList);
		return null;
	}

}
