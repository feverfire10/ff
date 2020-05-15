package com.kh.ff.disease.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ff.disease.model.service.DiseaseService;
import com.kh.ff.disease.model.vo.Disease;

@Controller
public class DiseaseController {
	
	@Autowired
	private DiseaseService dService;
	
	@ResponseBody
	@RequestMapping(value="selectDiseaseAll", produces="application/json; charset=utf-8")
	public String selectDiseaseAll() {
		ArrayList<Disease> diseaseAll = dService.selectDiseaseAll();
		return new Gson().toJson(diseaseAll);
	}
	
	@ResponseBody
	@RequestMapping(value="deleteDiseaseCode.di", produces="application/json; charset=utf-8")
	public String deleteDiseaseCode(Disease d) {
		int result = dService.deleteDiseaseCode(d);
		String msg = "";
		if(result > 0) {
			msg = "선택 상병 삭제 성공";
		}else {
			msg = "선택 상병 삭제 실패";
		}
		return new Gson().toJson(msg);
	}
	
	@ResponseBody
	@RequestMapping(value="divDiseaseArea.di", produces="application/json; charset=utf-8")
	public String divDiseaseArea() {
		ArrayList<Disease> divList = dService.divDiseaseArea();
		return new Gson().toJson(divList);
	}

}
