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
	 *	수납성공 시 수납대기 -> 수납완료로 번호값 변경
	 */
	@Override
	public int updateClinicState(int billFormNo) {
		return rDao.updateClinicState(sqlSession, billFormNo);
	}
	
	/**
	 *  수납성공 시 환자테이블 연속메모에 영수메모값 추가하기
	 */
	@Override
	public int updateChainNote(Receipt r) {
		return rDao.updateChainNote(sqlSession, r);
	}
	
	/**
	 *	수납관리 테이블에 값 뿌리기
	 */
	@Override
	public ArrayList<BillForm> selectBillFormList(int num) {
		return rDao.selectBillFormList(sqlSession, num);
	}

	/**
	 * 진료 저장 전 영수폼 존재 유무 조회용 서비스
	 */
	@Override
	public int medicalCompleteSelectBillForm(int chartNo) {
		return rDao.medicalCompleteSelectBillForm(chartNo, sqlSession);
	}
	/**
	 * 영수폼 insert용 서비스
	 */
	@Override
	public int medicalCompleteInsertBillForm(int chartNo) {
		return rDao.medicalCompleteInsertBillForm(chartNo, sqlSession);
	}
	/**
	 * 영수폼 update용 서비스
	 */
	@Override
	public int medicalCompleteUpdateBillForm(int chartNo) {
		return rDao.medicalCompleteUpdateBillForm(chartNo, sqlSession);
	}

	

	/**
	 *  차트번호에 대한 상태값 가져오기
	 */
	@Override
	public int selectClinicState(int chartNo) {
		return rDao.selectClinicState(sqlSession, chartNo);
	}

	/**
	 *  상태값이 4일 경우 수납결과 DB 제거
	 */
	@Override
	public int deleteReceipt(int chartNo) {
		return rDao.deleteReceipt(sqlSession, chartNo);
	}

	/**
	 *  차트번호에 대한 상태값 2로 변경
	 */
	@Override
	public int updateBillForm(int chartNo) {
		return rDao.updateBillForm(sqlSession, chartNo);
	}

}
