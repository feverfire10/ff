package com.kh.ff.rightClinic.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;
import com.kh.ff.rightClinic.model.service.RightClinicService;
import com.kh.ff.rightClinic.model.vo.DiseaseRc;
import com.kh.ff.rightClinic.model.vo.PatientJs;
import com.kh.ff.rightClinic.model.vo.PrescriptionRc;
import com.kh.ff.rightClinic.model.vo.SymptomRc;
import com.kh.ff.vital.model.vo.Vital;

@Controller
public class RightClinicController {

	@Autowired
	private RightClinicService rcService;

	@RequestMapping("rcMain.rc")
	public String rcMainForm() {
		return "ClinicRight/rightClinicForm";
	}

	@ResponseBody
	@RequestMapping(value="selPatients.rc", produces="application/json; charset=utf-8")
	public String selPatientsList(String receiptDate, String patientsName, String clinicState) {
		System.out.println(clinicState);
		ArrayList<PatientJs> list = rcService.selPatientsList(receiptDate, patientsName, clinicState);

		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="initCal.rc", produces="application/json; charset=utf-8")
	public String initCal(String patiName, String patiSSN) {
		
		ArrayList<PatientJs> list = rcService.selOnePatientList(patiName, patiSSN);
		
		return new Gson().toJson(list);
	}
	
	
	@ResponseBody
	@RequestMapping("data.json")
	public void dataJson(HttpServletRequest request) throws FileNotFoundException {
	    
		String pathSet = request.getSession().getServletContext().getRealPath("data.json").toString();
		System.out.println(pathSet);	

		try{
            //파일 객체 생성
            File file = new File(pathSet);
            //입력 스트림 생성
            FileReader filereader = new FileReader(file);
            int singleCh = 0;
            while((singleCh = filereader.read()) != -1){
                System.out.print((char)singleCh);
            }
            filereader.close();
        }catch (FileNotFoundException e) {
            // TODO: handle exception
        }catch(IOException e){
            System.out.println(e);
        }
	}
	
	@ResponseBody
	@RequestMapping(value = "DiseaseHistory.rc", produces="application/json; charset=utf-8")
	public String selDiseaseHistory(String clickDate, String clickPatientsName, String clickPatientsPno) {
		System.out.println(clickDate);
		System.out.println(clickPatientsName);
		System.out.println(clickPatientsPno);
		ArrayList<DiseaseRc> list = rcService.selDiseaseHistory(clickDate, clickPatientsName, clickPatientsPno);

		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "SymptomHistory.rc", produces="application/json; charset=utf-8")
	public String selSymptomHistory(String clickDate, String clickPatientsName, String clickPatientsPno) {
		System.out.println(clickDate);
		System.out.println(clickPatientsName);
		System.out.println(clickPatientsPno);
		ArrayList<SymptomRc> list = rcService.selSymptomHistory(clickDate, clickPatientsName, clickPatientsPno);

		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "PrescriptionHistory.rc", produces="application/json; charset=utf-8")
	public String selPrescriptionHistory(String clickDate, String clickPatientsName, String clickPatientsPno) {
		System.out.println(clickDate);
		System.out.println(clickPatientsName);
		System.out.println(clickPatientsPno);
		ArrayList<PrescriptionRc> list = rcService.selPrescriptionHistory(clickDate, clickPatientsName, clickPatientsPno);

		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "vitalChart.rc", produces="application/json; charset=utf-8")
	public String selVitalChartList(String clickPatientsName, String clickPatientsPno) {
		ArrayList<Vital> list = rcService.selVitalChartList(clickPatientsName, clickPatientsPno);

		return new Gson().toJson(list);
	}
}












