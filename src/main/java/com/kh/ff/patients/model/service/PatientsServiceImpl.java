package com.kh.ff.patients.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ff.patients.model.dao.PatientsDao;
import com.kh.ff.patients.model.vo.JS;
import com.kh.ff.patients.model.vo.Patients;
import com.kh.ff.patients.model.vo.SearchCondition;

@Service("paService")
public class PatientsServiceImpl implements PatientsService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private PatientsDao paDao;
	
	@Override
	public Patients selectPatient(Patients p) {
		return paDao.selectPatient(sqlSession, p);
	}
	
	@Override
	public int insertPatients(Patients p) {
		return paDao.insertPatients(sqlSession, p);
	}

	@Override
	public int insertJS(int pno) {
		return paDao.insertJS(sqlSession, pno);
	}

	@Override
	public int updatePatient(Patients p) {
		return paDao.updatePatient(sqlSession, p);
	}
	
	@Override
	public Patients selectPatientsChart(Patients p) {
		return paDao.selectPatientsChart(sqlSession, p);
	}

	@Override
	public ArrayList<Patients> selectPatients(SearchCondition sc) {
		return paDao.selectPatients(sqlSession, sc);
	}

	@Override
	public ArrayList<Patients> selectTreatment(int num) {
		return paDao.selectTreatment(sqlSession, num);
	}
	
	@Override
	public int updatePatients(JS jsChart) {
		return paDao.updatePatients(sqlSession, jsChart);
	}
	

}
