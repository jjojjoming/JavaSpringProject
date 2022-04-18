package com.moca.web.service;

import com.moca.web.config.security.SpringUser;
import com.moca.web.domain.model.Users;
import com.moca.web.domain.model.UserAuthority;
import com.moca.web.repository.MypageRepository;
import com.moca.web.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Transactional
@Service
@RequiredArgsConstructor
public class UserService implements UserDetailsService {

    private final UserRepository userRepository;
    private final MypageRepository mypageRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;


    public void joinUser(Users users) {

        //비밀번호 암호화
        users.setPassword(passwordEncoder.encode(users.getPassword()));
        //회원가입
        userRepository.signupUser(users);
        //이메일로 유저정보 조회
        Optional<Users> user = userRepository.findByEmail(users.getEmail());
        //찾아온 유저정보가 있다면?
        if (user.isPresent()) {
            UserAuthority userAuthority = new UserAuthority();
            userAuthority.setUserId(user.get().getId());
            userAuthority.setAuthority("ROLE_USER");
            //유저권한 데이터 삽입
            userRepository.insert_authority(userAuthority);
        }
        //없으면
    }

    public int emailCount(String email) {
        return userRepository.emailCount(email);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<Users> optionalUser = userRepository.findByEmail(username);
        return optionalUser.map(user -> {
            List<UserAuthority> authority = userRepository.findAuthorityById(user.getId());

            List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
            for (UserAuthority userAuthority : authority) {
                grantedAuthorities.add(new SimpleGrantedAuthority(userAuthority.getAuthority()));
            }

            SpringUser springUser = new SpringUser(user.getEmail(), user.getPassword(), grantedAuthorities, user);

            return springUser;

        }).orElseThrow(() -> new BadCredentialsException("일치하지 않습니다."));
    }

    public void logout() {
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = requestAttributes.getRequest();
        HttpServletResponse response = requestAttributes.getResponse();
        new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
    }

    public void withdrawal(Users users) {
        users.setPassword(passwordEncoder.encode("hellomoca"));
        mypageRepository.deleteAuthority(users);
        mypageRepository.deleteUser(users);
    }

}


