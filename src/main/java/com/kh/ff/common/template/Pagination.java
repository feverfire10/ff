package com.kh.ff.common.template;

import com.kh.ff.common.model.vo.PageInfo;

public class Pagination {
	
	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int userLimit) {
		
		// * maxPage : 마지막 페이지 수 (listCount, userLimit에 영향을 받는)
		int maxPage = (int)Math.ceil((double)listCount / userLimit);
		
		// * startPage : 현재 요청한 페이지 하단에 보여질 페이징바의 시작수  (currentPage, pageLimit에 영향을 받는)
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage : 현재 요청한 페이지 하단에 보여질 페이징바의 끝수 (startPage, pageLimit, maxPage에 영향을 받는)
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		return new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, userLimit);
		
	}

}





