package com.kh.ff.support.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ff.support.model.service.SupportService;
import com.kh.ff.support.model.vo.Support;

@Controller
public class SupportController {

	@Autowired
	private SupportService supService;
	
	@RequestMapping("supportMain.me")
	public String supportMain() {
		return "support/supportMain";
	}
	
	/* @RequestMapping("supportSelectPatient.me") */
	
	@ResponseBody
	@RequestMapping(value="supportSelectList.me", produces="application/json; charset=utf-8")
	public String supportSelectList(String receiptDate,String prescripType, String clinicState) {
		ArrayList<Support> list = supService.supportSelectList(receiptDate,prescripType, clinicState);

		return new Gson().toJson(list);
	}
}
