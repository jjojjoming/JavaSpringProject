package com.moca.web.domain.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Page {

    //최소 페이지 번호
    private int min;
    //최대 페이지 번호
    private int max;

    //이전 버튼의 페이지 번호
    private int prevPage;
    //다음 버튼의 페이지 번호
    private int nextPage;
    //전체 페이지 개수
    private int pageCnt;
    //현재 페이지 번호
    private int currentPage;



    //contentCnt:전체 글 갯수(mapper이용해서  table에서 가져옴)
    //currentPage : 현재 페이지 번호(param) 디폴트1
    //contentPageCnt : 페이지당 글번호(property) 10개씩 현제는 CsService에 등록되어있음
    //paginationCnt : 페이지 버튼 개수 (property) 현제는 CsService에 등록되어있음
    public Page(int contentCnt, int currentPage, int contentPageCnt, int paginationCnt) {
        this.currentPage = currentPage;
        //전체 페이지 개수
        pageCnt = contentCnt / contentPageCnt;
        // 533 / 10 = 53 & 3개이므로 1page가 더 필요
        if(contentCnt % contentPageCnt > 0) { //전체 글의 개수 나누기 페이지당 글번호의 나머지가0보다크면(하나라도 남으면)
            pageCnt++;  //페이지 한개를 증가시킴
        }
		/*
		1.
		1 ~ 10 : 1(최소), 10(최대)
		11 ~ 20 : 11, 20
		21 ~ 30 : 21, 30
		2. (currentPage-1) : 최대번호는 최소에 9를 더하므로 (10)-1을계산해줌
		3. 페이지당 글의 개수로 나눔
		4. 페이지당글의 개수로 다시 곱함
		*/
        //+1은
        min = ((currentPage-1) / contentPageCnt) * contentPageCnt + 1;
        max = min + paginationCnt -1;

        //10개의 버튼을 다 표시할 필요가 없을 때
        //63개의 글은 6페이지 버튼에 1개 추가최므로 나머지 8 ~ 10은 불필요
        if(max > pageCnt) {
            //10개면 7개로만들어줌
            max = pageCnt;
        }

        //이전, 다음버튼 누를때 기능
        prevPage = min - 1; //0이 나오면 비활성화
        nextPage = max + 1;

        //마지막 페이지를 넘어가지 않게 설정
        if(nextPage > pageCnt) {
            nextPage = pageCnt;
        }
    }

}
