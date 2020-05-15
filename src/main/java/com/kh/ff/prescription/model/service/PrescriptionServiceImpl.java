package com.kh.ff.prescription.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ff.js.model.vo.Js;
import com.kh.ff.prescription.model.dao.PrescriptionDao;
import com.kh.ff.prescription.model.vo.Prescription;

@Service("pService")
public class PrescriptionServiceImpl implements PrescriptionService {

	@Autowired
	private PrescriptionDao pDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 1. 처방코드 전체 리스트 조회용 서비스
	 */
	@Override
	public ArrayList<Prescription> selectPrescriptionAll() {
		return pDao.selectPrescriptionAll(sqlSession);
	}
	/**
	 * 2. 처방 진찰타입 리스트 조회용 서비스
	 */
	@Override
	public ArrayList<Prescription> selectPrescriptionBase() {
		return pDao.selectPrescriptionBase(sqlSession);
	}
	/**
	 * 3. 처방 투약 타입 리스트 조회용 서비스
	 */
	@Override
	public ArrayList<Prescription> selectPrescriptionMedi() {
		return pDao.selectPrescriptionMedi(sqlSession);
	}
	/**
	 * 4. 처방 처치 타입 리스트 조회용 서비스
	 */
	@Override
	public ArrayList<Prescription> selectPrescriptionHand() {
		return pDao.selectPrescriptionHand(sqlSession);
	}
	/**
	 * 5. 처방 방사선 타입 리스트 조회용 서비스
	 */
	@Override
	public ArrayList<Prescription> selectPrescriptionXray() {
		return pDao.selectPrescriptionXray(sqlSession);
	}
	/**
	 * 6. 처방 검사 타입 리스트 조회용 서비스
	 */
	@Override
	public ArrayList<Prescription> selectPrescriptionCheckup() {
		return pDao.selectPrescriptionCheckup(sqlSession);
	}
	
	/**
	 * 7. 환자에게 기록된 처방 조회용 서비스
	 */
	@Override
	public ArrayList<Prescription> selectPrescriptionList(Js j) {
		return pDao.selectPrescriptionList(j, sqlSession);
	}
	
	/**
	 * 8. 응급적용전 기본단가 조회(일반가)용 서비스
	 */
	@Override
	public Prescription infoPriceGene(Prescription p) {
		return pDao.infoPriceGene(p, sqlSession);
	}
	/**
	 * 9. 응급적용전 기본단가 조회(보험가)용 서비스
	 */
	@Override
	public Prescription infoPriceInsu(Prescription p) {
		return pDao.infoPriceInsu(p, sqlSession);
	}
	
	/**
	 * 10. 환자 처방 저장용 서비스
	 */
	@Override
	public int insertPrscription(String pCode, Prescription p) {
		p.setPrescripUserCode(pCode);
		return pDao.insertPrescription(p, sqlSession);
	}
	
	/**
	 * 11. BillForm insert 해주는 서비스
	 */
	@Override
	public int insertBillForm(Prescription p) {
		return pDao.insertBillForm(p, sqlSession);
	}
	
	/**
	 * 12. 선택 처방 삭제용 서비스
	 */
	@Override
	public int deletePreCode(Prescription p) {
		return pDao.deletePreCode(p, sqlSession);
	}
	/**
	 * 13. 처방 div 조회용 서비스
	 */
	@Override
	public ArrayList<Prescription> divPrescriptionArea() {
		return pDao.divPrescriptionArea(sqlSession);
	}
	
	

}
