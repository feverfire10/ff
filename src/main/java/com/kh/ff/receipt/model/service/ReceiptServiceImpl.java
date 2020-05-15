package com.kh.ff.receipt.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ff.receipt.model.dao.ReceiptDao;
import com.kh.ff.receipt.model.vo.BillForm;
import com.kh.ff.receipt.model.vo.Receipt;

@Service("rService")
public class ReceiptServiceImpl implements ReceiptService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ReceiptDao rDao;

	/**
	 * 수납대기인 환자리스트 조회
	 */
	@Override
	public ArrayList<Receipt> selectReceiptWait() {
		return rDao.selectReceiptWait(sqlSession);
	}

	/**
	 * 수납완료인 환자리스트 조회
	 */
	@Override
	public ArrayList<Receipt> selectReceiptComp() {
		return rDao.selectReceiptComp(sqlSession);
	}

	/**
	 * 선택한 환자 수납금액 등 정보 조회
	 */
	@Override
	public BillForm selectBillForm(BillForm chartNo) {
		return rDao.selectBillForm(sqlSession, chartNo);
	}

	/**
	 * 일반/보험 조회용..
	 */
	@Override
	public int selectSalaryClassific(BillForm chartNo) {
		return rDao.selectSalaryClassific(sqlSession, chartNo);
	}

	/**
	 * 수납시 테이블에 데이터 넣는 과정
	 */
	@Override
	public int insertReceipt(Receipt r) {
		return rDao.insertReceipt(sqlSession, r);
	}

	/**
	 *	수납관리 테이블에 값 뿌리기
	 */
	@Override
	public ArrayList<BillForm> selectBillFormList(int num) {
		return rDao.selectBillFormList(sqlSession, num);
	}

}
