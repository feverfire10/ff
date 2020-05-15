package com.kh.ff.medical.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.ff.disease.model.service.DiseaseService;
import com.kh.ff.disease.model.vo.Disease;
import com.kh.ff.js.model.service.JsService;
import com.kh.ff.js.model.vo.Js;
import com.kh.ff.prescription.model.service.PrescriptionService;
import com.kh.ff.prescription.model.vo.Prescription;
import com.kh.ff.receipt.model.service.ReceiptService;
import com.kh.ff.symptom.model.service.SymptomService;
import com.kh.ff.symptom.model.vo.Symptom;
import com.kh.ff.vital.model.service.VitalService;
import com.kh.ff.vital.model.vo.Vital;

@Controller
public class MedicalController {
	
	@Autowired
	private JsService jService;
	@Autowired
	private VitalService vService;
	@Autowired
	private SymptomService sService;
	@Autowired
	private DiseaseService dService;
	@Autowired
	private PrescriptionService pService;
	@Autowired
	private ReceiptService rService;

	@RequestMapping("medicalMain.me")
	public String medecalMain(Js j, Model model) {
		System.out.println(j);
		ArrayList<Js> list = jService.selectStateList(j);
		ArrayList<Js> hList = jService.selectHoldList(j);
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("hList", hList);
		
		return "medical/medicalMain";
	}
	
	//@ResponseBody
	@RequestMapping(value="detailPatients.me")
	public void detailPatients(Js j, HttpServletResponse response) throws JsonIOException, IOException {
		System.out.println(j);
		ArrayList<Js> dateBar = jService.selectDateBar(j);
		ArrayList<Vital> vList = vService.selectVitalList(j);
		ArrayList<Symptom> s = sService.selectSymptomHistory(j);		// 해당 날자에 입력된 증상
		ArrayList<Symptom> sList = sService.selectHistoryAll(j);
		ArrayList<Disease> dHistory = dService.selectDiseaseHittory(j);
		ArrayList<Prescription> pList = pService.selectPrescriptionList(j);
		
		
		HashMap<String, ArrayList> map = new HashMap<>();
		map.put("dateBar", dateBar);
		map.put("v", vList);
		map.put("s", s);
		map.put("sList", sList);
		map.put("dHistory", dHistory);
		map.put("pList", pList);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(map, response.getWriter());
	}
	
	@RequestMapping("stayUpdatePatients.me")
	public String stayUpdatePatients(Js j, Vital v, Symptom s, Disease d, Prescription p) { 
		System.out.println(j);
		System.out.println(v);
		System.out.println(s);
		System.out.println(d);
		System.out.println(p);
		
		String nowDate = j.getReceiptDate();
		int insertVital = vService.insertVital(v);
		int insertSymptom = sService.insertSymptom(s);
		String[] dList = d.getDnoInput().split(",");
		int chartNo = d.getChartNo();
		String[] pList = p.getPreCodeInput().split(",");
		if(dList[0] != "") {
			if(dList.length>1) {
				for(int i=0; i<dList.length; i++) {
					dService.insertDisease(Integer.parseInt(dList[i]), chartNo);
				}		
			}else if(dList.length==1) {
				dService.insertDisease(Integer.parseInt(dList[0]), chartNo);
			}			
		}
		
		if(pList[0] != "") {
			if(pList.length>1) {
				for(int i=0; i<pList.length; i++) {
					pService.insertPrscription(pList[i], p);
				}
			}else if(pList.length==1){
				pService.insertPrscription(pList[0], p);
			}			
		}
		jService.updateClinicState(j.getChartNo());
		
		// 차트번호로 영수폼 존재하는지 확인하는 서비스 연결
		int selectResult = rService.medicalCompleteSelectBillForm(j.getChartNo());
		//System.out.println(selectResult);
		if(selectResult > 0) {
			// 존재함
			System.out.println(111);
			rService.medicalCompleteUpdateBillForm(j.getChartNo());
		}else {
			// 없음
			System.out.println(222);
			rService.medicalCompleteInsertBillForm(j.getChartNo());
		}
		
		return "redirect:medicalMain.me?receiptDate="+nowDate;
	}
	
	@RequestMapping("completePatients.me")
	public String completePatients(Js j, Vital v, Symptom s, Disease d, Prescription p) { 
		//System.out.println(j);
		String nowDate = j.getReceiptDate();
		int insertVital = vService.insertVital(v);
		int insertSymptom = sService.insertSymptom(s);
		String[] dList = d.getDnoInput().split(",");
		int chartNo = d.getChartNo();
		String[] pList = p.getPreCodeInput().split(",");
		if(dList[0] != "") {
			if(dList.length>1) {
				for(int i=0; i<dList.length; i++) {
					dService.insertDisease(Integer.parseInt(dList[i]), chartNo);
				}		
			}else if(dList.length==1) {
				dService.insertDisease(Integer.parseInt(dList[0]), chartNo);
			}			
		}
		
		if(pList[0] != "") {
			if(pList.length>1) {
				for(int i=0; i<pList.length; i++) {
					pService.insertPrscription(pList[i], p);
				}
			}else if(pList.length==1){
				pService.insertPrscription(pList[0], p);
			}			
		}
		jService.completePatients(j.getChartNo());
		
		// 차트번호로 영수폼 존재하는지 확인하는 서비스 연결
		int selectResult = rService.medicalCompleteSelectBillForm(j.getChartNo());
		//System.out.println(selectResult);
		if(selectResult > 0) {
			// 존재함
			System.out.println(111);
			rService.medicalCompleteUpdateBillForm(j.getChartNo());
		}else {
			// 없음
			System.out.println(222);
			rService.medicalCompleteInsertBillForm(j.getChartNo());
		}
		
		return "redirect:medicalMain.me?receiptDate="+nowDate;
	}
	

}
