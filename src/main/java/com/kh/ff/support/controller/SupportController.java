package com.kh.ff.support.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ff.support.model.service.SupportService;

@Controller
public class SupportController {

	@Autowired
	private SupportService supService;
	
	@RequestMapping("supportMain.me")
	public String supportMain() {
		return "support/supportMain";
	}
	
	/*@RequestMapping("supportSelect.me")*/
}
