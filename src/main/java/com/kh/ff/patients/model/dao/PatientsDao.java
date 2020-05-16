package com.kh.ff.patients.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ff.patients.model.vo.JS;
import com.kh.ff.patients.model.vo.Patients;
import com.kh.ff.patients.model.vo.SearchCondition;

@Repository("paDao")
public class PatientsDao {
	
	public Patients selectPatient(SqlSessionTemplate sqlSession, Patients p) {
		return sqlSession.selectOne("patientsMapper.selectPatient", p);
	}
	
	public int insertPatients(SqlSessionTemplate sqlSession, Patients p) {
		return sqlSession.insert("patientsMapper.insertPatients", p);
	}
	
	public int insertJS(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.insert("patientsMapper.insertJS", pno);
	}
	
	public int updatePatient(SqlSessionTemplate sqlSession, Patients p) {
		return sqlSession.update("patientsMapper.updatePatient", p);
	}
	
	//public Patients selectPatientsChart(SqlSessionTemplate sqlSession, Patients p) {
	//	return sqlSession.selectOne("patientsMapper.selectPatientsChart", p);
	//}
	
	public ArrayList<Patients> selectPatients(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return (ArrayList)sqlSession.selectList("patientsMapper.selectPatients", sc);
	}
	
	public ArrayList<Patients> selectTreatment(SqlSessionTemplate sqlSession, int num) {
		return (ArrayList)sqlSession.selectList("patientsMapper.selectTreatment", num);
	}
	
	public int updatePatients(SqlSessionTemplate sqlSession, JS jsChart) {
		return sqlSession.update("patientsMapper.updatePatients", jsChart);
	}
	
	public JS checkJs(SqlSessionTemplate sqlSession, JS js) {
		return sqlSession.selectOne("patientsMapper.checkJs", js);
	}
	
	
}
