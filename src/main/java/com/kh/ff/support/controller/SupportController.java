package com.kh.ff.support.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ff.common.model.vo.PageInfo;
import com.kh.ff.common.template.Pagination;
import com.kh.ff.support.model.service.SupportService;
import com.kh.ff.support.model.vo.Support;
import com.kh.ff.user.model.vo.User;

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
	
	@RequestMapping("supWaitList.me")
	public String supWaitList(Model model, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		int listCount = supService.supWaitList();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Support> list1 = supService.selectWaitOne(pi);
		ArrayList<Support> list2 = supService.selectWaitTwo(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		
		return "support/supportMain";
	}
	@RequestMapping("supCompleteList.me")
	public String supCompleteList(Model model, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		int listCount = supService.supCompleteList();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Support> list1 = supService.selectCompleteOne(pi);
		ArrayList<Support> list2 = supService.selectCompleteTwo(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		
		return "support/supportMain";
	}
	
	@RequestMapping("supUpdateClinic.me")
	public String deleteUser(int aaaa, HttpSession session, Model model) {
		int chartNo = aaaa;
		int result = supService.updateClinic(chartNo);
		
		if(result > 0) {
			return "redirect:supCompleteList.me";
		}else {
			model.addAttribute("msg", "사용자 탈퇴 실패");
			return "common/errorPage";
		}
	}

}
