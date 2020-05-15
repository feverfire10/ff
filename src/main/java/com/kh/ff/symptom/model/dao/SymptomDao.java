package com.kh.ff.symptom.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ff.js.model.vo.Js;
import com.kh.ff.symptom.model.vo.Symptom;

@Repository("sDao")
public class SymptomDao {
	
	public ArrayList<Symptom> selectSymptomHistory(Js j, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("symptomMapper.selectSymptomHistory", j);
	}
	
	public ArrayList<Symptom> selectHistoryAll(Js j, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("symptomMapper.selectHistoryAll", j);
	}
	
	public int insertSymptom(Symptom s, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("symptomMapper.insertSymptom", s);
	}

}
