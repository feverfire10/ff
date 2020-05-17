package com.kh.ff.support.model.service;

import java.util.ArrayList;

import com.kh.ff.common.model.vo.PageInfo;
import com.kh.ff.support.model.vo.Support;

public interface SupportService {
	
	
	// 환자 리스트 조회용 서비스
	ArrayList<Support> supportSelectList(String receiptDate,String prescripType, String clinicState);
	
	int supWaitList();
	
	ArrayList<Support> selectWaitOne(PageInfo pi);
	ArrayList<Support> selectWaitTwo(PageInfo pi);
	
	int supCompleteList();
	
	ArrayList<Support> selectCompleteOne(PageInfo pi);
	ArrayList<Support> selectCompleteTwo(PageInfo pi);
	
	int updateClinic(int chartNo);
}
