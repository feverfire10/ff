package com.kh.ff.support.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ff.support.model.vo.Support;

@Repository("supDao")
public class SupportDao {

	public ArrayList<Support> supportSelectList(SqlSessionTemplate sqlSession,String receiptDate, String prescripType, String clinicState){
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("receiptDate", receiptDate);
		params.put("prescripType", prescripType);
		params.put("clinicState", clinicState);
		
		return (ArrayList)sqlSession.selectList("supportMapper.supportSelectList", params);
	}
	
}
