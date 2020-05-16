package com.kh.ff.user.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ff.common.model.vo.PageInfo;
import com.kh.ff.user.model.vo.Power;
import com.kh.ff.user.model.vo.User;

@Repository("uDao")
public class UserDao {

	public User loginUser(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.selectOne("userMapper.loginUser", u);
	}
	
	public int insertUser(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.insert("userMapper.insertUser", u);
	}
	
	public int insertPower(SqlSessionTemplate sqlSession, Power p) {
		return sqlSession.insert("userMapper.insertPower", p);
	}
	
	public int updateUser(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.update("userMapper.updateUser", u);
	}
	
	public int updatePower(SqlSessionTemplate sqlSession, Power p) {
		return sqlSession.update("userMapper.updatePower", p);
	}
	
	public int deleteUser(SqlSessionTemplate sqlSession, String userCode) {
		return sqlSession.update("userMapper.deleteUser", userCode);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String userCode) {
		return sqlSession.selectOne("userMapper.idCheck", userCode);
	}
	
	public int userListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("userMapper.userListCount");
	}
	
	public ArrayList<User> selectUserList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getUserLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getUserLimit());
		
		return (ArrayList)sqlSession.selectList("userMapper.selectUserList", null, rowBounds);
	}
	
	public User selectUser(SqlSessionTemplate sqlSession, String userCode) {
		return sqlSession.selectOne("userMapper.selectUser", userCode);
	}
	
	public Power selectPower(SqlSessionTemplate sqlSession, String userCode) {
		return sqlSession.selectOne("userMapper.selectPower", userCode);
	}
}