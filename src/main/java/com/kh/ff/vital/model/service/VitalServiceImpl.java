package com.kh.ff.vital.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ff.js.model.vo.Js;
import com.kh.ff.vital.model.dao.VitalDao;
import com.kh.ff.vital.model.vo.Vital;

@Service("vService")
public class VitalServiceImpl implements VitalService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private VitalDao vDao;

	/**
	 * 1. 환자 호출시 바이탈 조회용 서비스
	 */
	@Override
	public ArrayList<Vital> selectVitalList(Js j) {
		return vDao.selectVitalList(j, sqlSession);
	}

	/**
	 * 2. 환자 바이탈 정보 저장용 서비스
	 */
	@Override
	public int insertVital(Vital v) {
		return vDao.insertVital(v, sqlSession);
	}

}
