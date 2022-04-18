package com.moca.web.service;

import com.moca.web.domain.model.MailDto;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import java.util.HashMap;


@Slf4j
@Service
public class SmsService {


    @Value("${sms.apikey}")
    private String apiKey;

    @Value("${sms.apisecret}")
    private String apiSecret;

    @Value("${sms.fromnumber}")
    private String fromNumber;

    public void sendMessage(String toNumber, String randomNumber) {

        Message coolsms = new Message(apiKey, apiSecret);

        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", toNumber);
        params.put("from", fromNumber);
        params.put("type", "SMS");
        params.put("text", "[모카] 인증번호 " + randomNumber + " 를 입력하세요.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            log.debug("SMS 전송 결과 : {}", obj.toString());
        } catch (CoolsmsException e) {
            log.error("SMS ERROR MESSAGE: {}", e.getMessage());
            log.error("SMS ERROR CODE: {}", e.getCode());
        }
    }
}
