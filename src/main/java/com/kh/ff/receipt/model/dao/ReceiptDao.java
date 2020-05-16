package com.kh.ff.receipt.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ff.receipt.model.vo.BillForm;
import com.kh.ff.receipt.model.vo.Receipt;

@Repository("rDao")
public class ReceiptDao {
	
	public ArrayList<Receipt> selectReceiptWait(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("receiptMapper.selectReceiptWait");
	}
	
	public ArrayList<Receipt> selectReceiptComp(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("receiptMapper.selectReceiptComp");
	}
	
	public BillForm selectBillForm(SqlSessionTemplate sqlSession, BillForm chartNo) {
		return sqlSession.selectOne("receiptMapper.selectBillForm", chartNo);
	}
	
	public int selectSalaryClassific(SqlSessionTemplate sqlSession, BillForm chartNo) {
		return sqlSession.selectOne("receiptMapper.selectSalaryClassific", chartNo);
	}
	
	public int insertReceipt(SqlSessionTemplate sqlSession, Receipt r) {
		return sqlSession.insert("receiptMapper.insertReceipt", r);
	}
	
	public int updateClinicState(SqlSessionTemplate sqlSession, int billFormNo) {
		return sqlSession.update("receiptMapper.updateClinicState", billFormNo);
	}
	
	public int updateChainNote(SqlSessionTemplate sqlSession, Receipt r) {
		return sqlSession.update("receiptMapper.updateChainNote", r);
	}
	
	public ArrayList<BillForm> selectBillFormList(SqlSessionTemplate sqlSession, int num){
		return (ArrayList)sqlSession.selectList("receiptMapper.selectBillFormList", num);
	}
	
	public int selectClinicState(SqlSessionTemplate sqlSession, int chartNo) {
		return sqlSession.selectOne("receiptMapper.selectClinicState", chartNo);
	}
	
	public int deleteReceipt(SqlSessionTemplate sqlSession, int chartNo) {
		return sqlSession.delete("receiptMapper.deleteReceipt", chartNo);
	}
	
	public int updateBillForm(SqlSessionTemplate sqlSession, int chartNo) {
		return sqlSession.update("receiptMapper.updateBillForm", chartNo);
	}

}
