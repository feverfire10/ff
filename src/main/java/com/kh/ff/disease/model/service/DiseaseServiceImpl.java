package com.kh.ff.disease.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ff.disease.model.dao.DiseaseDao;
import com.kh.ff.disease.model.vo.Disease;
import com.kh.ff.js.model.vo.Js;

@Service("dService")
public class DiseaseServiceImpl implements DiseaseService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DiseaseDao dDao;
	
	/**
	 * 1. 환자에게 저장된 상병 조회용
	 */
	@Override
	public ArrayList<Disease> selectDiseaseHittory(Js j) {
		return dDao.selectDiseaseHistory(j, sqlSession);
	}

	/**
	 * 2. 상병 전체 리스트 조회용
	 */
	@Override
	public ArrayList<Disease> selectDiseaseAll() {
		return dDao.selectDiseaseAll(sqlSession);
	}

	/**
	 * 3. 현재 입력되어있는 상병리스트 조회용 서비스
	 */
	@Override
	public ArrayList<Disease> selectNowHistory(Disease d) {
		return dDao.selectNowHistory(d, sqlSession);
	}

	/**
	 * 4. 환자에게 입력된 상병리스트 저장용 서비스
	 */
	@Override
	public int insertDisease(int codeNo, int chartNo) {
		Disease d = new Disease();
		d.setChartNo(chartNo);
		d.setDiseaseNo(codeNo);
		return dDao.insertDisease(d, sqlSession);
	}

	/**
	 * 5. 선택 상병 삭제용 서비스
	 */
	@Override
	public int deleteDiseaseCode(Disease d) {
		return dDao.deleteDiseaseCode(d, sqlSession);
	}

	/**
	 * 6. 상병 div 영역 리스트 조회용 서비스
	 */
	@Override
	public ArrayList<Disease> divDiseaseArea() {
		return dDao.divDiseaseArea(sqlSession);
	}



}
