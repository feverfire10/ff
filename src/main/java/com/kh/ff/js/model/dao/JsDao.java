package com.kh.ff.js.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ff.js.model.vo.Js;
import com.kh.ff.patients.model.vo.Patients;

@Repository("jDao")
public class JsDao {
	
	public ArrayList<Js> selectStateList(Js j, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("jsMapper.selectStateList", j);
	}
	
	public ArrayList<Js> selectHoldList(Js j, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("jsMapper.selectHoldList", j);
	}
	
	public ArrayList<Js> selectDateBar(Js j, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("jsMapper.selectDateBar", j);
	}
	
	public int updateClinicState(int cNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("jsMapper.updateClinicState", cNo);
	}
	
	public int completePatients(int cNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("jsMapper.completePatients", cNo);
	}
	
	public ArrayList<Js> modalPaientsList(Js j, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("jsMapper.modalPaientsList", j);
	}
	
	public ArrayList<Js> betweenDayList(Js j, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("jsMapper.betweenDayList", j);
	}

}
