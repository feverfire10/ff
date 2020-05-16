package com.kh. ff.user.model.service;

import java.util.ArrayList;

import com.kh.ff.common.model.vo.PageInfo;
import com.kh.ff.user.model.vo.Power;
import com.kh.ff.user.model.vo.User;

public interface UserService {

	// 로그인용 서비스
	User userLogin(User u);	
	
	// 신규유저가입 서비스
	int insertUser(User u);
	int insertPower(Power p);
	
	// 유저 업데이트 서비스
	int updateUser(User u);
	
	// 권한 업데이트 서비스
	int updatePower(Power p);
	
	// 유저 삭제 서비스
	int deleteUser(String userCode);
	
	// 유저코드 중복체크용 서비스
	int idCheck(String userCode);
	
	// 유저 리스트 조회용 서비스
	// 유저 총 수 조회용 서비스
	int userListCount();
	// 현재요청한 페이지에 보여져야할 리스트 조회용 서비스
	ArrayList<User> selectUserList(PageInfo pi);

	User selectUser(String userCode);

	Power selectPower(String userCode);

}
