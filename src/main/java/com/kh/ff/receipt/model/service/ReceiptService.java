package com.kh.ff.receipt.model.service;

import java.util.ArrayList;

import com.kh.ff.receipt.model.vo.BillForm;
import com.kh.ff.receipt.model.vo.Receipt;

public interface ReceiptService {
	
	ArrayList<Receipt> selectReceiptWait();
	
	ArrayList<Receipt> selectReceiptComp();
	
	BillForm selectBillForm(BillForm chartNo);
	
	int selectSalaryClassific(BillForm chartNo);
	
	int insertReceipt(Receipt r);

	ArrayList<BillForm> selectBillFormList(int num);
	
	int medicalCompleteSelectBillForm(int chartNo);
	int medicalCompleteInsertBillForm(int chartNo);
	int medicalCompleteUpdateBillForm(int chartNo);
}
