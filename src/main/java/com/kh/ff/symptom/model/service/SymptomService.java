package com.kh.ff.symptom.model.service;

import java.util.ArrayList;

import com.kh.ff.js.model.vo.Js;
import com.kh.ff.symptom.model.vo.Symptom;

public interface SymptomService {
	
	ArrayList<Symptom> selectSymptomHistory(Js j);
	
	ArrayList<Symptom> selectHistoryAll(Js j);
	
	int insertSymptom(Symptom s);

}
