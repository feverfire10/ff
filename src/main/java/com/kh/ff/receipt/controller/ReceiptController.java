package com.kh.ff.receipt.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.ff.receipt.model.service.ReceiptService;
import com.kh.ff.receipt.model.vo.BillForm;
import com.kh.ff.receipt.model.vo.Receipt;

@Controller
public class ReceiptController {
	
	@Autowired
	private ReceiptService rService;
	
	@RequestMapping(value="selectReceiptWait.r")
	public void selectReceiptWait() {
		ArrayList<Receipt> list = rService.selectReceiptWait();
	}
	
	@RequestMapping(value="selectReceiptComp.r")
	public void selectReceiptComp() {
		ArrayList<Receipt> list = rService.selectReceiptComp();
	}
	
	@RequestMapping(value="selectBillForm.bf")
	public ModelAndView selectBillForm(BillForm cn, ModelAndView mv) {
		BillForm bf = rService.selectBillForm(cn);
		int classific = rService.selectSalaryClassific(cn);
		if(bf != null) {
			mv.addObject("bf", bf).addObject("classific", classific).setViewName("administration/bill");
			return mv;
		} else {
			mv.addObject("msg", "수납창 생성 실패").setViewName("common/errorPage");
			return mv;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="insertPayment.r")
	public int insertReciept(Receipt r) {
		int result = rService.insertReceipt(r);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="selectBillFormList.bf")
	public void selectBillFormList(int num, HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<BillForm> list = rService.selectBillFormList(num);
		response.setContentType("application/json; charset=UTF-8"); 
		new Gson().toJson(list, response.getWriter());
	}

}
