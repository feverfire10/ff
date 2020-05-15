package com.kh.ff.vital.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ff.js.model.vo.Js;
import com.kh.ff.vital.model.vo.Vital;

@Repository("vDao")
public class VitalDao {
	
	public ArrayList<Vital> selectVitalList(Js j, SqlSessionTemplate sqlSession){	
		return (ArrayList)sqlSession.selectList("vitalMapper.selectVitalList", j);
	}
	
	public int insertVital(Vital v, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("vitalMapper.insertVital", v);
	}

}
