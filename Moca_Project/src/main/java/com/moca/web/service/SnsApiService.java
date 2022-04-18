package com.moca.web.service;

import com.moca.web.config.security.SpringUser;
import com.moca.web.domain.model.UserAuthority;
import com.moca.web.domain.model.Users;
import com.moca.web.repository.MypageRepository;
import com.moca.web.repository.SnsApiRepository;
import com.moca.web.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Slf4j
@Transactional
@Service
public class SnsApiService {

    @Autowired
    private SnsApiRepository snsApiRepository;

    @Autowired
    private HttpServletRequest httpServletRequest;

    @Autowired
    private UserRepository userRepository;


    public void kakaoLoginProcess(String id, String email) throws ServletException {

        Users users = snsApiRepository.checkDuplicationUser(email);

        if(users == null){
            // 1.증복 아님 : 이메일과 카카오아이디가 없다
            // 2. 회원 가입 시킴
            Users kakaoUser = new Users();
            kakaoUser.setEmail(email);
            kakaoUser.setKakaoId(id);
            snsApiRepository.signUpKakao(kakaoUser);
            snsApiRepository.insertAuth(kakaoUser.getId());

            // 3. 로그인 시킴
            kakaoLogin(kakaoUser.getEmail());
        }else{

            // 1. 중복 이고 : 이메일이 있다
            // 2. 카카오 아이디가 없는 경우
            if (users.getKakaoId() == null){
                // 3. Users 객체에 kakaoId 를 담아서 회원 업데이트
                Users kakao = new Users();
                kakao.setKakaoId(id);
                kakao.setEmail(email);
                snsApiRepository.updateKakao(kakao);

                kakaoLogin(kakao.getEmail());
            }else {

            // 1. 중복 이고
            // 2. 카카오 아이디가 있는 경우
            // 3. 로그인
                kakaoLogin(users.getEmail());
            }
        }
    }

    public void kakaoLogin(String email) throws ServletException{
        httpServletRequest.login(email,"moca-web-kakao-login"); //카카오아이디화원가입 초기화 비번
    }

    //비밀번호 없이도 로그인 가능한 로직
    //1.카카오 로그인을 통해 유저정보를 얻는 메소드

    public UserDetails loadUserByKakaoUser(String username) throws UsernameNotFoundException {
        Optional<Users> optionalUser = userRepository.findByEmail(username);
        return optionalUser.map(user -> {
            List<UserAuthority> authority = userRepository.findAuthorityById(user.getId());

            List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
            for (UserAuthority userAuthority : authority) {
                grantedAuthorities.add(new SimpleGrantedAuthority(userAuthority.getAuthority()));
            }

            SpringUser springUser = new SpringUser(user.getEmail(), "moca-web-kakao-login", grantedAuthorities, user);

            return springUser;

        }).orElseThrow(() -> new IllegalArgumentException(username + " 사용자가 존재하지 않습니다"));
    }

    //2. 로그인 폼과 카카오아이디로그인 분리 메소드 -> CustomAuthenticationProvider



}
