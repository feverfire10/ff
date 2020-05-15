package com.kh.ff.symptom.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ff.js.model.vo.Js;
import com.kh.ff.symptom.model.dao.SymptomDao;
import com.kh.ff.symptom.model.vo.Symptom;

@Service("sService")
public class SymptomServiceImpl implements SymptomService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SymptomDao sDao;

	/**
	 * 1. 환자 호출시 증상 조회용 서비스
	 */
	@Override
	public ArrayList<Symptom> selectSymptomHistory(Js j) {
		return sDao.selectSymptomHistory(j, sqlSession);
	}

	/**
	 * 2. 환자 과거증상 조회용 서비스
	 */
	@Override
	public ArrayList<Symptom> selectHistoryAll(Js j) {
		return sDao.selectHistoryAll(j, sqlSession);
	}

	/**
	 * 3. 환자 증상 저장용 서비스
	 */
	@Override
	public int insertSymptom(Symptom s) {
		return sDao.insertSymptom(s, sqlSession);
	}

}
