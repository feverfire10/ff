package com.kh.ff.user.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ff.common.model.vo.PageInfo;
import com.kh.ff.common.template.Pagination;
import com.kh.ff.user.model.service.UserService;
import com.kh.ff.user.model.vo.Power;
import com.kh.ff.user.model.vo.User;

@Controller
public class UserController {

	
	@Autowired
	private UserService uService;
	
	@RequestMapping("userMain.me")
	public String userMain() {
		return "user/userMain";
	}
	
	@RequestMapping("userLogin.me")
	public ModelAndView loginUser(User u, HttpSession session, ModelAndView mv) {
		
		User userLogin = uService.userLogin(u);
		if(userLogin != null) {
			session.setAttribute("userLogin", userLogin);
			mv.setViewName("common/selectOption");
		}else {
			mv.addObject("msg", "실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("userInsert.me")
	public String insertUser(User u,Power p, Model model, HttpSession session) {
		int result1 = uService.insertUser(u);
		int result2 = uService.insertPower(p);
		
		if(result1 > 0 && result2 > 0) {
			session.setAttribute("msg", "사용자 등록에 성공하였습니다.");
			return "redirect:userList.me";
		}else {
			model.addAttribute("msg", "사용자 등록에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("userUpdate.me")
	public String updateUser(User u,Power p, Model model, HttpSession session) {
		int result1 = uService.updateUser(u);
		int result2 = uService.updatePower(p);
		
		if(result1 > 0 && result2 > 0) {
			session.setAttribute("userLogin", uService.userLogin(u));
			session.setAttribute("msg", "사용자정보를 수정했습니다.");
			return "redirect:userList.me";
		}else {
			model.addAttribute("msg", "사용자정보 수정 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("powerUpdate.me")
	public String updatePower(User u, Power p, Model model, HttpSession session) {
		int result = uService.updatePower(p);
		
		if(result > 0) {
			session.setAttribute("userLogin", uService.userLogin(u));
			session.setAttribute("msg", "사용자권한을 수정했습니다.");
			return "redirect:userMain.me";
		}else {
			model.addAttribute("msg", "사용자권한 수정 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("userDelete.me")
	public String deleteUser(String aaaa, HttpSession session, Model model) {
		String userCode = aaaa;
		System.out.println(aaaa);
		int result = uService.deleteUser(userCode);
		
		if(result > 0) {
			return "redirect:userList.me";
		}else {
			model.addAttribute("msg", "사용자 탈퇴 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String userCode) {
		int count = uService.idCheck(userCode);
		
		return String.valueOf(count);
	}
	
	@RequestMapping("userList.me")
	public String selectUserList(Model model, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		int listCount = uService.userListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<User> list = uService.selectUserList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "user/userMain";
	}
	
	@ResponseBody
	@RequestMapping(value="userDetail.me", produces="application/json; charset=utf-8")
	public String selectUserDetail(String userCode) {
		User u = uService.selectUser(userCode);
		
		return new Gson().toJson(u);
	}
}
