package com.moca.web.controller.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moca.web.domain.model.YouTube;
import com.moca.web.service.YouTubeApiService;
import freemarker.core.ParseException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequiredArgsConstructor
public class YouTubeApiController {

    @Autowired
    private YouTubeApiService youTubeApiService;

    @PostMapping(value="/copy/youTubeCopyProcess")
    @ResponseBody
    public List<String> search(String brandName, String description, String mainKeyword, String subKeyword1, String subKeyword2) throws IOException, ParseException {

        String search = brandName;
        String apiurl = "https://www.googleapis.com/youtube/v3/search";
        apiurl += "?key=AIzaSyD_qeHft7uG9m-c-TcSIWqyD-8wvhhLYsM";
        apiurl += "&part=snippet&type=video&maxResults=100&videoEmbeddable=true";
        apiurl += "&q=" + URLEncoder.encode(search, "UTF-8");

        URL url = new URL(apiurl);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");

        BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            response.append(inputLine);
        }
        br.close();
        return dataParser(response.toString());
    }

    public List<String> dataParser(String responseBody) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(responseBody, Map.class);
        List<Map<String, Object>> maps = (List<Map<String, Object>>) map.get("items");

        List<String> resultList = new ArrayList<>();
        for (Map<String, Object> result : maps) {
            Map<String, Object> data = (Map<String, Object>) result.get("snippet");
            log.info(data.get("title").toString());

            resultList.add(data.get("title").toString());
        }
        return resultList;
    }


    @PostMapping(path = "/service/youtube/titleCopy")
    @ResponseBody
    public String YouTubeDataTitle(@RequestParam List<String> youtube){
        return"service/copy/youtubeHeadCopyRsult";
    }

}