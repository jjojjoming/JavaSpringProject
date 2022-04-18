//package com.moca.web.service;
//
//import org.apache.log4j.Logger;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import java.util.HashMap;
//import java.util.Map;
//
//@Controller
//public class WordController {
//
//    private Logger log = Logger.getLogger(this.getClass());
//
//    @Autowired
//    private IWordAnalysisService wordAnalysisService;
//
//    @RequestMapping(value = "word/analysis")
//    @ResponseBody
//    public Map<String, Integer> analysis() throws Exception {
//
//        log.info(this.getClass().getName() + ".inputForm !");
//
//        //분석할 문장
//        String text = "청하는아이오아이출신입니다";
//
//        //신조어 및 새롭게 생겨난 가수 및 그룹명은 제대로 된 분석이 불가능합니다.
//        // 새로운 명사 단어들은 어떻게 데이터를 처리해야 할까?? => 데이터사전의 주기적인 업데이트
//
////        Map<String, Integer> rMap = wordAnalysisService.doWordAnalysis(text);
//        Map<String, Integer> rMap = wordAnalysisService.doWordAnalysis(text);
//
//        if(rMap == null) {
//            rMap = new HashMap<String, Integer>();
//        }
//
//
//        return rMap;
//    }
//}
