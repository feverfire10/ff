package com.kh.ff.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PageInfo {
	
	private int listCount;		// 총 인원수
	private int currentPage;	// 현재페이지 (요청한 페이지)
	private int startPage;		// 현재페이지에 보여질 페이징바의 시작수
	private int endPage;		// 현재페이지에 보여질 페이징바의 끝수
	private int maxPage;		// 마지막 페이지수
	private int pageLimit;		// 페이징바의 최대수
	private int userLimit;		// 한페이지에 보여질 최대 인원수

}




