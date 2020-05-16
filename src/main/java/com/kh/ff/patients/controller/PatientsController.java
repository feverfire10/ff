package com.kh.ff.patients.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.ff.patients.model.service.PatientsService;
import com.kh.ff.patients.model.vo.JS;
import com.kh.ff.patients.model.vo.Patients;
import com.kh.ff.patients.model.vo.SearchCondition;


@Controller
public class PatientsController {
	
	@Autowired
	private PatientsService paService;
	
	
	@RequestMapping("patientsInfo.me")
	public String myPage() {
		return "patients/patientsView";
	}
	
	// 환자 접수 -> 먼저 select해서 초진이면 환자 테이블 & 접수 테이블에 담기고  / 재진이면 접수 테이블 & 환자 테이블에 전진료일 컬럼만 수정
	// 이 후 진료관리로 보내야함
	// 초진일때 : 환자테이블, 접수테이블 INSERT
	// 재진일때 : 접수 INSERT 환자 UPDATE
	@ResponseBody
	@RequestMapping(value="insert.p")
	public String insertPatients(Patients p, String selectDay, Model model) {
		//Patients test1 = new Patients();
		//test1.setPatientsPno(patientsPno);
		//JS test = paService.checkJs(js);
		//if(test == null) {
			Patients p2 = paService.selectPatient(p); // 추가 전 검색 --> p2
			if(p2 == null) { // 처음 온 환자
				int result1 = paService.insertPatients(p); // 환자 추가 --> result1에 담김
				Patients pp = paService.selectPatient(p); // PK를 꺼내기 위한 재검색 --> pp
				int result2 = paService.insertJS(pp.getPatientsNo()); // pp의 PK로 JS테이블에 행 추가하는 메소드(결과값 result2)
				//pp = paService.selectPatientsChart(pp); // --> pp에 다시 chartNo값 추가하기위한 메소드
				if(result1 * result2 > 0) { // 1 * 1 = 1 /// 1 * 0 = 0
					Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
					return gson.toJson(pp);
				} else {
					return "접수실패";
				}
			} else { // 전에 온 환자
				int result1 = paService.updatePatient(p); // lastVisit, lastDo 업데이트 하기위한 메소드
				Patients p1 = paService.selectPatient(p2); // PK를 꺼내기 위한 재검색 --> p1
				int result2 = paService.insertJS(p1.getPatientsNo()); // JS테이블에 행 추가 --> result
				//Patients pp = paService.selectPatientsChart(p1); // pp에 다시 chartNo를 추가하는 메소드 (p2를 보내서 PK도 담김)
				if(result1 * result2 > 0) {
					Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
					return gson.toJson(p1);
				} else {
					return "접수실패";
				}
			}
		//} else {
		//	return "접수실패";
		//}
		
	}
	
	// update (진료관리 항목에서 각 버튼 클릭시 접수 테이블에 진료 상태 컬럼 수정됨)  0 : 진료전, 1 : 진료보류, 2 : 진료완료, 3: 예약대기
	
	
	// 환자조회수준
	@ResponseBody
	@RequestMapping(value="selectPatients.p")
	public void selectPatients(String option, String keyword, HttpServletResponse response) throws JsonIOException, IOException{
		SearchCondition sc = new SearchCondition();
		sc.setContent(keyword);
		switch(option) {
		case "name":
			sc.setName(option);
			break;
		case "idnum":
			sc.setIdnum(option);
			break;
		}
		ArrayList<Patients> list = paService.selectPatients(sc);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
	}
	
	
	// 진료 관리 탭 조회 3개
	@ResponseBody
	@RequestMapping(value="selectTreatment.p")
	public void selectTreatment(int num, HttpServletResponse response) throws IOException {
		ArrayList<Patients> list = paService.selectTreatment(num);
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
	}
	
	
	
	
	// update (진료관리 항목에서 각 버튼 클릭시 접수 테이블에 진료 상태 컬럼 수정됨)  0 : 진료전, 1 : 진료보류, 2 : 진료완료, 3: 예약대기
		@ResponseBody
		@RequestMapping(value="updatePatients.js")
		public void updatePatients(JS jsChart, HttpServletResponse response) throws JsonIOException, IOException {
			//if(jsChart.getClinicState() == 5) {
			//	int result = paService.deletePatients(jsChart);
			//	response.setContentType("application/json; charset=UTF-8");
			//	new Gson().toJson(result, response.getWriter());
			//} else {
				int result = paService.updatePatients(jsChart);
				response.setContentType("application/json; charset=UTF-8");
				new Gson().toJson(result, response.getWriter());
			//}

			
		}
	
	
	
	
}