package kr.co.soft.beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageBean {
	
	//최소 페이지 번호
	private int min;
	//최대 페이지 번호
	private int max;
	
	//이전 버튼의 페이지 번호
	private int prevPage;
	//다음 버튼의 페이지 번호
	private int nextPage;
	//전체 페이지 갯수
	private int pageCnt;
	//현재 페이지 번호
	private int currentPage;
	
	
	
	//contentCnt:전체 글 갯수(mapper이용해서  table에서 가져옴)
	//currentPage : 현재 페이지 번호(param)
	//contentPageCnt : 페이지당 글번호(property)
	//paginationCnt : 페이지 버튼 개수 (property)
	public PageBean(int contentCnt, int currentPage, int contentPageCnt, int paginationCnt) {
		
		this.currentPage=currentPage;
		
		//전체 페이지 갯수
		pageCnt=contentCnt/contentPageCnt;
		//533/10=53페이지 &3개이므로 1페이지가 더필요함
		if(contentCnt %contentPageCnt >0) {
			pageCnt++;
		}
		/*
		1.
		1~10: 1(최소),10(최대)
		11~20: 11(최소),20(최대)
		21~30: 21(최소),30(최대)
		
		2.
		최대번호 는 최소에 9를 더해야하므로 -1을 계산해줌
		0~9 : 
		
		3.페이지당 글의 갯수로 나눔

		4.페이지당 글의 갯수로 다시 곱함
		5.첫번째페이 오류로 +1을 해줌
		*/
		
		min=((currentPage-1)/contentPageCnt)*contentPageCnt+1;		
		max=min+paginationCnt-1;
		
		//10개의 버튼이 다 표시할 필요가 없을때 예 : 63개의 글이면 7페이지 까지만표시
		
		//max를 pageCnt 로 변경
		if (max> pageCnt) {
			max=pageCnt;
		}
		prevPage=min-1;	//0이 나오면 비활용
		nextPage=max+1;
		
		//마지막 페이지는 오버해서 넘어가면 안됨
		if (nextPage > pageCnt) {
			nextPage=pageCnt;
		}
	}

}
