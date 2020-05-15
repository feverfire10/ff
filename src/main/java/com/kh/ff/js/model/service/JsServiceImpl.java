package com.kh.ff.js.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ff.js.model.dao.JsDao;
import com.kh.ff.js.model.vo.Js;
import com.kh.ff.patients.model.vo.Patients;

@Service("jService")
public class JsServiceImpl implements JsService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private JsDao jDao;

	/**
	 * 1. 진료대기 환자 리스트 조회용 서비스
	 */
	@Override
	public ArrayList<Js> selectStateList(Js j) {
		return jDao.selectStateList(j, sqlSession);
	}

	/**
	 * 2. 진료보류 환자 리스트 조회용 서비스
	 */
	@Override
	public ArrayList<Js> selectHoldList(Js j) {
		return jDao.selectHoldList(j, sqlSession);
	}

	/**
	 * 3. 작업일자 환자 정보 조회용 서비스
	 */
	@Override
	public ArrayList<Js> selectDateBar(Js j) {
		return jDao.selectDateBar(j, sqlSession);
	}

	/**
	 * 4. 진료보류하는 환자 상태값 업데이트용 서비스
	 */
	@Override
	public int updateClinicState(int cNo) {
		return jDao.updateClinicState(cNo, sqlSession);
	}
	/**
	 * 5. 진료저장 하는 환자 상태값 업데이트용 서비스
	 */
	@Override
	public int completePatients(int cNo) {
		return jDao.completePatients(cNo, sqlSession);
	}

	/**
	 * 6. 외래내역 조회용 서비스
	 */
	@Override
	public ArrayList<Js> modalPaientsList(Js j) {
		return jDao.modalPaientsList(j, sqlSession);
	}

	/**
	 * 7. 선택 기간  환자 조회용 서비스
	 */
	@Override
	public ArrayList<Js> betweenDayList(Js j) {
		return jDao.betweenDayList(j, sqlSession);
	}

}
