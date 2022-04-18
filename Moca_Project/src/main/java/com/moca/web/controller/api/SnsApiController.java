package com.moca.web.controller.api;

import com.moca.web.service.SnsApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;

@RestController
public class SnsApiController {

    @Autowired
    private SnsApiService snsApiService;

    @PostMapping(value="/sns/kakaoLoginProcess")
    @ResponseBody
    public void kakaoLoginProcess(String id, String email) throws ServletException {
        snsApiService.kakaoLoginProcess(id, email);
    }
}


