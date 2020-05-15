package com.kh.ff.disease.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ff.disease.model.vo.Disease;
import com.kh.ff.js.model.vo.Js;

@Repository("dDao")
public class DiseaseDao {
	
	public ArrayList<Disease> selectDiseaseHistory(Js j, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("diseaseMapper.selectDiseaseHistory", j);
	}
	
	public ArrayList<Disease> selectDiseaseAll(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("diseaseMapper.selectDiseaseAll");
	}
	
	public ArrayList<Disease> selectNowHistory(Disease d, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("diseaseMapper.selectNowHistory", d);
	}
	
	public int insertDisease(Disease d, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("diseaseMapper.insertDisease", d);
	}

	public int deleteDiseaseCode(Disease d, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("diseaseMapper.deleteDiseaseCode", d);
	}
	
	public ArrayList<Disease> divDiseaseArea(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("diseaseMapper.divDiseaseArea");
	}
}
