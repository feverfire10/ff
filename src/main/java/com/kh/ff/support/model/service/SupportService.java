package com.kh.ff.support.model.service;

import java.util.ArrayList;

import com.kh.ff.support.model.vo.Support;

public interface SupportService {
	
	// 조회용 서비스
	Support supportSelectPatient(int chartNo);
	
	// 환자 리스트 조회용 서비스
	ArrayList<Support> supportSelectList();
}
