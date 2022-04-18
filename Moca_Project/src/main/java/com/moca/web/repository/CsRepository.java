package com.moca.web.repository;

import com.moca.web.domain.model.Cs;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/*Dao역할*/
@Repository
public interface CsRepository {

    //게시글 목골보기
    @Transactional
    public List<Cs> select_boardAll(RowBounds rowBounds);

    //게시글 목록수
    @Transactional
    public int select_boardCount();

    //게시글 쓰기
    @Transactional
    public void insertContent(Cs faq);

    //게시글보기
    @Transactional
    public Cs readFaq(int boardId);

    //게시글 수정
    @Transactional
    public void updateFaq(Cs modifyCs);

    //게시글 삭제
    @Transactional
    public void deleteFaq(int boardId);
}
