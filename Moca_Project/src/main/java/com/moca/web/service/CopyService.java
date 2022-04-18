package com.moca.web.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.moca.web.domain.CopyDao;
import com.moca.web.domain.model.inputSalescopy;
import com.moca.web.domain.model.outputSalescopy;
import freemarker.core.ParseException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Slf4j
@Service
public class CopyService {

    @Autowired
    CopyDao copyDao;

    static String type_id1="문제";
    static String type_id2="공감";
    static String type_id3="해결책";
    static String type_id4="조건";
    static String type_id5="타겟";
    static String type_id6="행동";



    public List<String> selectSalesCopyListKey1(inputSalescopy inputSalesCopy){

        List<outputSalescopy> outputSalescopies=copyDao.selectSalesCopyListKey1(inputSalesCopy);
        List<outputSalescopy> outputSalescopies2=copyDao.selectSalesCopyListKey2(inputSalesCopy);
        List<outputSalescopy> outputSalescopies3=copyDao.selectSalesCopyListKey3(inputSalesCopy);
        List<outputSalescopy> outputSalescopies_cate=copyDao.selectSalesCopyListCategory(inputSalesCopy);

        if(outputSalescopies.size()>=3){
            return get_salesList(outputSalescopies);
        }
        else if(outputSalescopies2.size()>=3){
            return get_salesList(outputSalescopies2);
        }
        else if(outputSalescopies3.size()>=3){
            return get_salesList(outputSalescopies3);
        }
        else{
            return get_salesList(outputSalescopies_cate);
        }
    }

    public static int getRandomNumber(int size) {
        return new Random().nextInt(size);
    }

    public static List<String> get_salesList(List<outputSalescopy> outputSalescopies){

        List<outputSalescopy> salesCategory1=new ArrayList<outputSalescopy>();
        List<outputSalescopy> salesCategory2=new ArrayList<outputSalescopy>();
        List<outputSalescopy> salesCategory3=new ArrayList<outputSalescopy>();
        List<outputSalescopy> salesCategory4=new ArrayList<outputSalescopy>();
        List<outputSalescopy> salesCategory5=new ArrayList<outputSalescopy>();
        List<outputSalescopy> salesCategory6=new ArrayList<outputSalescopy>();
        List<String> combined_copies=new ArrayList<String>();

        for (outputSalescopy outputSalescopy:outputSalescopies){
            String category_id=outputSalescopy.getSalesCategory();
            System.out.println("category_id : "+category_id);
            try {
                if (type_id1.equals(category_id)){
                    salesCategory1.add(outputSalescopy);
                    log.info(salesCategory1.toString());
                }
                else if (type_id2.equals(category_id)){
                    salesCategory2.add(outputSalescopy);
                    log.info(salesCategory2.toString());
                }
                else if (type_id3.equals(category_id)){
                    salesCategory3.add(outputSalescopy);
                    log.info(salesCategory3.toString());
                }
                else if (type_id4.equals(category_id)){
                    salesCategory4.add(outputSalescopy);
                    log.info(salesCategory4.toString());
                }
                else if (type_id5.equals(category_id)){
                    salesCategory5.add(outputSalescopy);
                    log.info(salesCategory5.toString());
                }
                else if (type_id6.equals(category_id)){
                    salesCategory6.add(outputSalescopy);
                    log.info(salesCategory6.toString());
                }
                else
                    System.out.println("해당되는게 없음");
            }catch (NullPointerException e){
                System.out.print("Caught NullPointerException");
            }

        }

        for(int i=0;i<3;i++){

            String cate1_randomSelect="";
            String cate2_randomSelect="";
            String cate3_randomSelect="";
            String cate4_randomSelect="";
            String cate5_randomSelect="";
            String cate6_randomSelect="";

            if (salesCategory1.size()!=0){
                int cate1_s=getRandomNumber(salesCategory1.size());
                cate1_randomSelect=salesCategory1.get(cate1_s).getSentence()+". \r\n";
            }
            if (salesCategory2.size()!=0){
                int cate2_s=getRandomNumber(salesCategory2.size());
                cate2_randomSelect=salesCategory2.get(cate2_s).getSentence()+". \r\n";
            }
            if (salesCategory3.size()!=0){
                int cate3_s=getRandomNumber(salesCategory3.size());
                cate3_randomSelect=salesCategory3.get(cate3_s).getSentence()+". \r\n";
            }
            if (salesCategory4.size()!=0){
                int cate4_s=getRandomNumber(salesCategory4.size());
                cate4_randomSelect=salesCategory4.get(cate4_s).getSentence()+". \r\n";
            }
            if (salesCategory5.size()!=0){
                int cate5_s=getRandomNumber(salesCategory5.size());
                cate5_randomSelect=salesCategory5.get(cate5_s).getSentence()+". \r\n";
            }
            if (salesCategory6.size()!=0){
                int cate6_s=getRandomNumber(salesCategory6.size());
                cate6_randomSelect=salesCategory6.get(cate6_s).getSentence()+". \r\n";
            }
            String combined_copy=cate1_randomSelect+cate2_randomSelect+cate3_randomSelect+cate4_randomSelect+cate5_randomSelect+cate6_randomSelect;
            combined_copies.add(combined_copy);
        }

        return combined_copies;

    }


    public List<String> search(String brandName) throws IOException, ParseException {

        String search = brandName;
        String apiurl = "https://www.googleapis.com/youtube/v3/search";
        apiurl += "?key=AIzaSyD_qeHft7uG9m-c-TcSIWqyD-8wvhhLYsM";
        apiurl += "&part=snippet&type=video&maxResults=20&videoEmbeddable=true";
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
}
