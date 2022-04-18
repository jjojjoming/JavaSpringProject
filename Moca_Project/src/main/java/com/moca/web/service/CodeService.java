package com.moca.web.service;

import com.moca.web.domain.model.MailDto;
import com.moca.web.domain.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Random;

@Transactional
@Service
public class CodeService {

    @Autowired
    MailService mailService;

    public int verificationMail(Users users) {
        MailDto mailDto = new MailDto();
        mailDto.setEmail(users.getEmail());
        System.out.println(users.getEmail());
        int randomCode = RandomCode();
        System.out.println(randomCode);
        mailDto.setSubject("MOCA 서비스 인증번호입니다.");
        mailDto.setContents("인증번호 : " + randomCode);
        try {
            System.out.println(mailDto.getEmail());
            System.out.println(mailDto.getSubject());
            mailService.sendMail(mailDto);
        }catch (Exception e) {
            e.printStackTrace();
        }

        return randomCode;
    }

    public int RandomCode() {
        int randomCode = (new Random().nextInt(1000000) + 111111);
        return randomCode;
    }
}
