package com.moca.web.repository;

import com.moca.web.domain.model.Cs;
import com.moca.web.domain.model.History;
import com.moca.web.domain.model.Review;
import com.moca.web.domain.model.Users;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface MypageRepository {

    @Transactional
    public void updatePassword(Users users);

    @Transactional
    public void updateInfo(Users users);

    @Transactional
    public Users selectUserInfo(String email);

    @Transactional
    public void updateProfileImg(Users users);

    @Transactional
    public void deleteAuthority(Users users);

    @Transactional
    public void deleteUser(Users users);

    @Transactional
    public void verificationCodeMail(Users users);

    @Transactional
    public List<History> selectHeadHistory(Users users);

    @Transactional
    public List<History> selectSalesHistory(Users users);

    @Transactional
    public List<History> selectNaverHistory(Users users);

    @Transactional
    public List<History> selectYoutubeHistory(Users users);

    @Transactional
    public void deleteHistory(History history);

    @Transactional
    public void updateHistory(History history);

    @Transactional
    public void insertReview(Review review);

    @Transactional
    public List<Review> selectReview(Users users);

    @Transactional
    public void deleteReview(Review review);

    @Transactional
    public void updateReview(Review review);

    @Transactional
    public List<Cs> selectBoard(Users users);



}
