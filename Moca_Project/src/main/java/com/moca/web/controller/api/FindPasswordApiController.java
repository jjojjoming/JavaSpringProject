package com.moca.web.controller.api;

import com.moca.web.config.security.SpringUser;
import com.moca.web.domain.model.MailDto;
import com.moca.web.domain.model.Users;
import com.moca.web.repository.MypageRepository;
import com.moca.web.service.MailService;
import com.moca.web.service.SnsApiService;
import com.moca.web.service.UserService;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.swing.*;
import java.io.IOException;
import java.util.Random;

@RestController
public class FindPasswordApiController {

    @Autowired
    private MailService mailService;

    @Autowired
    private SnsApiService snsApiService;

    @Autowired
    private MypageRepository mypageRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping(value="/email/sendEmailProcess")
    @ResponseBody
    public void sendEmailProcess(MailDto mailDto) throws IOException, MessagingException {

        SpringUser checkEmail =(SpringUser)snsApiService.loadUserByKakaoUser(mailDto.getEmail());

        //초기화
        if(checkEmail != null){

            Users users = new Users();

            String generatedString = RandomStringUtils.randomAlphanumeric(10);
            users.setPassword(passwordEncoder.encode(generatedString));

            users.setName(checkEmail.getUser().getName());
            users.setAddress(checkEmail.getUser().getAddress());
            users.setPhone(checkEmail.getUser().getPhone());
            users.setId(checkEmail.getUser().getId());

            mypageRepository.updatePassword(users);
            mailDto.setSubject("[모카] 비밀번호 찾기 이메일 입니다.");
            mailDto.setContents("초기화 비밀번호는 : " + generatedString + " 입니다.");
            mailService.sendMail(mailDto);
        }

    }
}
