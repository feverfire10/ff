package com.kh.ff.disease.model.service;

import java.util.ArrayList;

import com.kh.ff.disease.model.vo.Disease;
import com.kh.ff.js.model.vo.Js;

public interface DiseaseService {
	
	ArrayList<Disease> selectDiseaseHittory(Js j);
	
	ArrayList<Disease> selectDiseaseAll();
	
	ArrayList<Disease> selectNowHistory(Disease d);
	
	int insertDisease(int codeNo, int chartNo);
	
	int deleteDiseaseCode(Disease d);
	
	ArrayList<Disease> divDiseaseArea();

}
