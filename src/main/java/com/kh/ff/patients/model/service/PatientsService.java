package com.kh.ff.patients.model.service;

import java.util.ArrayList;

import com.kh.ff.patients.model.vo.JS;
import com.kh.ff.patients.model.vo.Patients;
import com.kh.ff.patients.model.vo.SearchCondition;

public interface PatientsService {
	
	// 환자 추가 전 조회
	Patients selectPatient(Patients p);

	// 환자 접수용 서비스
	int insertPatients(Patients p);
	
	// 접수테이블 차트 쌓이게끔 
	int insertJS(int pno);
	
	// 재방문한 환자일 때 환자테이블 값 업데이트
	int updatePatient(Patients p);
	
	// 환자 + 접수 조회
	//Patients selectPatientsChart(Patients p);
	
	// 환자 검색
	ArrayList<Patients> selectPatients(SearchCondition sc);
	
	// 환자 관리 탭 조회용 ajax
	ArrayList<Patients> selectTreatment(int num);
	
	// 환자 관리에서 진료 상태 update
	int updatePatients(JS jsChart);
	
}
