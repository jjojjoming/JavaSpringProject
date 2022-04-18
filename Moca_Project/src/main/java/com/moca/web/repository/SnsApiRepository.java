package com.moca.web.repository;

import com.moca.web.domain.model.Users;
import org.apache.ibatis.annotations.SelectKey;
import org.springframework.stereotype.Repository;

@Repository
public interface SnsApiRepository {

    //id,email 중복 확인
    Users checkDuplicationUser(String email);

    //회원 가입 시킴
    void signUpKakao(Users users);

    //회원가입 권한을 줌
    void insertAuth(Long id);

    //----------------------------------------------
    //Users 객체에 kakaoId 를 담아서 회원 업데이트
    void updateKakao(Users users);


}
