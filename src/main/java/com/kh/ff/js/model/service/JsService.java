package com.kh.ff.js.model.service;

import java.util.ArrayList;

import com.kh.ff.js.model.vo.Js;
import com.kh.ff.patients.model.vo.Patients;

public interface JsService {
	
	// 진료대기환자 리스트 조회용
	ArrayList<Js> selectStateList(Js j);
	// 진료보류환자 리스트 조회용
	ArrayList<Js> selectHoldList(Js j);
	// 작업일자 부분 데이터 입력용
	ArrayList<Js> selectDateBar(Js j);
	
	int updateClinicState(int cNo);
	int completePatients(int cNo);
	
	ArrayList<Js> modalPaientsList(Js j);
	
	ArrayList<Js> betweenDayList(Js j);
	
	ArrayList<Js> sortpNo(Js j);
	ArrayList<Js> sortpName(Js j);
	ArrayList<Js> sortpPno(Js j);

}
