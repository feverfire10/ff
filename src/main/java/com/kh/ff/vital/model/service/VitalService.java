package com.kh.ff.vital.model.service;

import java.util.ArrayList;

import com.kh.ff.js.model.vo.Js;
import com.kh.ff.vital.model.vo.Vital;

public interface VitalService {
	
	ArrayList<Vital> selectVitalList(Js j);
	
	int insertVital(Vital v);

}
