package com.kh.ff.js.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.ff.disease.model.vo.Disease;
import com.kh.ff.js.model.service.JsService;
import com.kh.ff.js.model.vo.Js;
import com.kh.ff.patients.model.vo.Patients;
import com.kh.ff.prescription.model.vo.Prescription;
import com.kh.ff.symptom.model.vo.Symptom;
import com.kh.ff.vital.model.vo.Vital;

@Controller
public class JsController {
	
	@Autowired
	private JsService jService;
	
	@RequestMapping(value="modalPaientsList.js")
	public void modalPaientsList(Js j, HttpServletResponse response) throws JsonIOException, IOException {
		//System.out.println(j);
		ArrayList<Js> mpList = jService.modalPaientsList(j);
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(mpList, response.getWriter());
	}
	
	@RequestMapping(value="betweenDayList.js")
	public void betweenDayList(String startDay, String endDay, HttpServletResponse response) throws JsonIOException, IOException {
		Js j = new Js();
		j.setStartDay(startDay);
		j.setEndDay(endDay);
		ArrayList<Js> betList = jService.betweenDayList(j);
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(betList, response.getWriter());
	}

}
