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
	public int insertReciept(Receipt r, int billFormNo) {
		int result1 = rService.insertReceipt(r);
		int result2 = rService.updateClinicState(billFormNo);
		int result3 = rService.updateChainNote(r);
		return result1 * result2;
	}
	
	@ResponseBody
	@RequestMapping(value="selectBillFormList.bf")
	public void selectBillFormList(int num, HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<BillForm> list = rService.selectBillFormList(num);
		response.setContentType("application/json; charset=UTF-8"); 
		new Gson().toJson(list, response.getWriter());
	}
	
	@RequestMapping(value="updateBillForm.bf")
	public void updateBillForm(int chartNo, HttpServletResponse response) throws JsonIOException, IOException {
		// update 전 확인
		int checkState = rService.selectClinicState(chartNo);
		String msg = "수납대기중인 항목은 삭제가 불가능합니다.";
		if(checkState == 4) {
			int result1 = rService.deleteReceipt(chartNo);
			if(result1 > 0) {
				int result2 = rService.updateBillForm(chartNo);
				if(result2 > 0) {
					msg = "수납 결과를 삭제하고 선택된 항목을 대기상태로 변경합니다.";
				} else {
					msg = "수납 결과는 삭제했지만 진료상태값을 변경하지 못했습니다. 관리자에게 문의하세요.";
				}
			} else {
				msg = "수납 결과 변경에 실패했습니다.";
			}
		}
		new Gson().toJson(msg, response.getWriter());
	}

}
