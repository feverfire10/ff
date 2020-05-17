package com.kh.ff.support.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ff.common.model.vo.PageInfo;
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

	public int supWaitList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("supportMapper.supWaitList");
	}

	public ArrayList<Support> selectWaitOne(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getUserLimit());
		
		return (ArrayList)sqlSession.selectList("supportMapper.selectWaitOne", null, rowBounds);
	}

	public ArrayList<Support> selectWaitTwo(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getUserLimit());
		
		return (ArrayList)sqlSession.selectList("supportMapper.selectWaitTwo", null, rowBounds);
	}
	
	public int supCompleteList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("supportMapper.supCompleteList");
	}

	public ArrayList<Support> selectCompleteOne(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getUserLimit());
		
		return (ArrayList)sqlSession.selectList("supportMapper.selectCompleteOne", null, rowBounds);
	}

	public ArrayList<Support> selectCompleteTwo(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getUserLimit());
		
		return (ArrayList)sqlSession.selectList("supportMapper.selectCompleteTwo", null, rowBounds);
	}
	
	public int updateClinic(SqlSessionTemplate sqlSession, int chartNo) {
		return sqlSession.update("supportMapper.updateClinic", chartNo);
	}
}
