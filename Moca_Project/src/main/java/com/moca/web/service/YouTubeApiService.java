package com.moca.web.service;

import com.moca.web.domain.model.YouTube;
import org.springframework.stereotype.Service;

@Service
public class YouTubeApiService {

    public void YouTubeApiTitle(String brandName){


        YouTube youTube = new YouTube();
        youTube.setBrandName(brandName);
//        youTube.setDescription(description);
//        youTube.setMainKeyword(mainKeyword);
//        youTube.setSubKeyword1(subKeyword1);
//        youTube.setSubKeyword2(subKeyword2);

    }
}
