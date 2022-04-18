package com.moca.web.service;

import lombok.RequiredArgsConstructor;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service
@Transactional
public class CrawlingNaverService {

    public Elements naverCrawling(String query) {
        String url = "https://ad.search.naver.com/search.naver?where=ad&query=";


        try {
            url += query + "&x=0&y=0";
            Document doc = Jsoup.connect(url).post();
            Elements innerList = doc.select(".ad_dsc_inner");
            return innerList;
        } catch (Exception e) {
            return null;
        }

    }
}
