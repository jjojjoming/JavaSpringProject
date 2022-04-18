package com.moca.web.service;

import com.moca.web.config.MailConfig;
import com.moca.web.domain.model.MailDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Service
public class MailService {

    final private JavaMailSender javaMailSender;

    /**
     * 기본적으로 1명에게 보냄
     * @param mailDto
     * @return
     */
    public void sendMail(MailDto mailDto) throws MessagingException, IOException  {
        MailConfig MailConfig = new MailConfig(javaMailSender);

        MailConfig.setTo(mailDto.getEmail());
        MailConfig.setSubject(mailDto.getSubject());

//        String htmlContent = "<p>" + "메세지" + "<p> <img src='cid:google-logo'>";
        String htmlContent = mailDto.getContents();
        MailConfig.setText(htmlContent, true);
        MailConfig.send();
    }

    /**
     * 여러명 보내기
     */
    public void sendMailToPeople(){
        List<String> toUserList = new ArrayList<>();
        toUserList.add("m_veloper@naver.com");
        toUserList.add("수신대상@naver.com");
        toUserList.add("수신대상@naver.com");
        toUserList.add("수신대상@naver.com");
        toUserList.add("수신대상@naver.com");

        int toUserSize = toUserList.size();

        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setTo((String[]) toUserList.toArray(new String[toUserSize]));
        simpleMailMessage.setSubject("제목 샘플");
        simpleMailMessage.setText("내용");
        javaMailSender.send(simpleMailMessage);
    }

//    public void sendMailWithFiles(String email) throws MessagingException, IOException {
//        MailConfig MailConfig = new MailConfig(javaMailSender);
//
//        MailConfig.setTo(email);
//        MailConfig.setSubject("제목");
//
//        String htmlContent = "<p>" + "메세지" + "<p> <img src='cid:google-logo'>";
//        MailConfig.setText(htmlContent, true);
//
//        // 파일이 있다면
//        MailConfig.setAttach("test.txt", "static/test.txt");
//        MailConfig.setInline("google-logo", "static/google-logo.png");
//        MailConfig.send();
//    }
}
