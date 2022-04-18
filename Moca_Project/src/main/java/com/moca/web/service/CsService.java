package com.moca.web.service;

import com.moca.web.domain.model.Cs;
import com.moca.web.domain.model.Page;
import com.moca.web.repository.CsRepository;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
//서비스
@Transactional
@Service
public class CsService {
    @Autowired
    private CsRepository csRepository;
    //properties에 등록된 페이지 리스트와 같음
    private int pagelistcnt = 10;  //글번호 10개씩
    private int paginationcnt = 10; //버튼 10개씩

    //faq 메인 화면 구현부
    public List<Cs> getCsList(int page) {
        //0,10,20
        int start = (page-1)*pagelistcnt; //(2-1)*10=10 / (3-1)*10=20
        RowBounds rowBounds=new RowBounds(start,pagelistcnt); //0부터 시작해서 10개씩
        List<Cs> boardAllList = csRepository.select_boardAll(rowBounds);
       /* System.out.println(rowBounds);
        System.out.println(boardAllList);*/

        return boardAllList;
    }

    //게시글 수
    public Page getCsCount(int currentPage) {
        //전체 글의 갯수

        int current_cnt = csRepository.select_boardCount();
        Page page = new Page(current_cnt, currentPage, pagelistcnt, paginationcnt);
        return page;
    }

    //게시글 작성
    public void insertContent(Cs faq) {
        //임시로 게시글 120개 추가로 입력
        /*for(int i=0;i<120;i++){
        csRepository.insertContent(faq);
        }*/
        csRepository.insertContent(faq);
    }

    //작성한 게시글 보기
    public Cs readFaq(int boardId) {
       /* System.out.println("서비스 진입 게시판 아이디 : "+boardId);*/
        return csRepository.readFaq(boardId);
    }

    //게시글 수정
    public void updateFaq(Cs modifyCs) {
       csRepository.updateFaq(modifyCs);
    }

    //게시글 삭제
    public void deleteFaq(int boardId) {
        csRepository.deleteFaq(boardId);
    }

}


