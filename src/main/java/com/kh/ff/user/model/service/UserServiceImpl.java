package com.kh.ff.user.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ff.common.model.vo.PageInfo;
import com.kh.ff.user.model.dao.UserDao;
import com.kh.ff.user.model.vo.Power;
import com.kh.ff.user.model.vo.User;

@Service("uService")
public class UserServiceImpl implements UserService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private UserDao uDao;
	
	/**
	 * 로그인용 서비스
	 */
	@Override
	public User userLogin(User u) {
		return uDao.loginUser(sqlSession, u);
	}
	
	/**
	 * 신규유저가입 서비스
	 */
	@Override
	public int insertUser(User u) {
		return uDao.insertUser(sqlSession, u);
	}
	
	@Override
	public int insertPower(Power p) {
		return uDao.insertPower(sqlSession, p);
	}

	/** 
	 * 유저 업데이트 서비스
	 */
	@Override
	public int updateUser(User u) {
		return uDao.updateUser(sqlSession, u);
	}

	/**
	 * 권한 업데이트 서비스
	 */
	@Override
	public int updatePower(Power p) {
		return uDao.updatePower(sqlSession, p);
	}

	/**
	 * 유저 삭제 서비스
	 */
	@Override
	public int deleteUser(String userCode) {
		return uDao.deleteUser(sqlSession, userCode);
	}

	/**
	 * 유저코드 중복체크용 서비스
	 */
	@Override
	public int idCheck(String userCode) {
		return uDao.idCheck(sqlSession, userCode);
	}

	
	/**
	 * 유저 리스트 조회용 서비스
	 * 유저 총 수 조회용 서비스
	 */
	@Override
	public int userListCount() {
		return uDao.userListCount(sqlSession);
	}

	/**
	 * 현재요청한 페이지에 보여져야할 리스트 조회용 서비스
	 */
	@Override
	public ArrayList<User> selectUserList(PageInfo pi) {
		return uDao.selectUserList(sqlSession, pi);
	}

	@Override
	public User selectUser(String userCode) {
		return uDao.selectUser(sqlSession, userCode);
	}

	@Override
	public Power selectPower(String userCode) {
		return uDao.selectPower(sqlSession, userCode);
	}

}
