package com.kh.ff.support.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
