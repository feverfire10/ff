package com.kh.ff.support.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ff.common.model.vo.PageInfo;
import com.kh.ff.support.model.dao.SupportDao;
import com.kh.ff.support.model.vo.Support;

@Service("supService")
public class SupportServiceImpl implements SupportService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SupportDao supDao;
	

	@Override
	public ArrayList<Support> supportSelectList(String receiptDate,String prescripType, String clinicState) {
		return supDao.supportSelectList(sqlSession,receiptDate, prescripType, clinicState);
	}


	@Override
	public int supWaitList() {
		return supDao.supWaitList(sqlSession);
	}


	@Override
	public ArrayList<Support> selectWaitOne(PageInfo pi) {
		return supDao.selectWaitOne(sqlSession, pi);
	}


	@Override
	public ArrayList<Support> selectWaitTwo(PageInfo pi) {
		return supDao.selectWaitTwo(sqlSession, pi);
	}


	@Override
	public int supCompleteList() {
		return supDao.supCompleteList(sqlSession);
	}


	@Override
	public ArrayList<Support> selectCompleteOne(PageInfo pi) {
		return supDao.selectCompleteOne(sqlSession, pi);
	}


	@Override
	public ArrayList<Support> selectCompleteTwo(PageInfo pi) {
		return supDao.selectCompleteTwo(sqlSession, pi);
	}


	@Override
	public int updateClinic(int chartNo) {
		return supDao.updateClinic(sqlSession, chartNo);
	}
	

}
