package com.moca.web.controller.page;


import com.moca.web.domain.model.inputHeadcopy;
import com.moca.web.domain.model.inputSalescopy;
import com.moca.web.domain.model.likeHeadcopy;
import com.moca.web.domain.model.outputHeadcopy;
import com.moca.web.repository.HeadcopyMapper;
import com.moca.web.service.CopyService;
import com.moca.web.service.CrawlingNaverService;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Slf4j
@RequestMapping(path = "/service") // http://localhost:port/service
@Controller
public class CopyController {

    /**
     * 기본 port는 8080
     * 따로 변경했다면 변경한 port로 접속
     */

    @Autowired
    private HeadcopyMapper headcopyMapper;

    @Autowired
    private CrawlingNaverService crawlingNaverService;

    @Autowired
    private CopyService copyService;

    // http://localhost:port/service
    @RequestMapping(path = "")
    public ModelAndView service() {
        return new ModelAndView("service/service");

    }
    // http://localhost:port/service/copy/sorry
    @RequestMapping(path = "/copy/sorry")
    public ModelAndView contactUs() {
        return new ModelAndView("service/copy/sorry");
    }

    @RequestMapping(path = "/copy/sorry-face")
    public ModelAndView contactUsFace() {
        return new ModelAndView("service/copy/sorry-face");
    }

    // http://localhost:port/service/copy/sales
    @RequestMapping(path = "/copy/sales")
    public ModelAndView salescopy() {
        return new ModelAndView("service/copy/sales");
    }

    // http://localhost:port/service/copy/head
    @RequestMapping(path = "/copy/head")
    public ModelAndView headcopy() {return new ModelAndView("service/copy/head");}

    // http://localhost:port/service/copy/naver
    @RequestMapping(path = "/copy/naver")
    public ModelAndView navercopy() {
        return new ModelAndView("service/copy/naverCrawling");
    }

    @RequestMapping(path = "/copy/naver/result")
    public ModelAndView navercopyResult(HttpServletRequest request) {
        Elements naverList = crawlingNaverService.naverCrawling(request.getParameter("query"));
        if(naverList.size() == 0) {
            return new ModelAndView("service/copy/naverNull");
        }
        else {
            return new ModelAndView("service/copy/naverCrawlingResult").addObject("naverList", naverList);

        }
    }

    @PostMapping("/copy/naver/like")
    public ResponseEntity likeNavercopy(likeHeadcopy likeHeadcopy, HttpServletRequest request){
        headcopyMapper.likeHeadcopy(likeHeadcopy);
        return new ResponseEntity(likeHeadcopy.getSentence()+"\n저장 완료! 마이페이지에서 확인하세요.", HttpStatus.OK);
    }

    // http://localhost:port/service/copy/head
    @RequestMapping(path = "/copy/head/result_test")
    public ModelAndView headcopyResulttest() {
        List<outputHeadcopy> outputHeadcopyMapperList =headcopyMapper.selectHeadcopyListKeytest();
        return new ModelAndView("service/copy/headResult").addObject("headcopyList", outputHeadcopyMapperList);
    }


    @RequestMapping(path = "/copy/head/input")
    public ModelAndView headcopyResult(inputHeadcopy inputHeadcopy) {
        List<outputHeadcopy> outputHeadcopyMapperListKey1 = headcopyMapper.selectHeadcopyListKey1(inputHeadcopy);
        List<outputHeadcopy> outputHeadcopyMapperListKey2 = headcopyMapper.selectHeadcopyListKey2(inputHeadcopy);
        List<outputHeadcopy> outputHeadcopyMapperListKey3 = headcopyMapper.selectHeadcopyListKey3(inputHeadcopy);
        List<outputHeadcopy> outputHeadcopyMapperListCategory = headcopyMapper.selectHeadcopyListCategory(inputHeadcopy);
        List<outputHeadcopy> outputHeadcopy3 = new ArrayList<outputHeadcopy>();
        int num1,num2,num3;
        if (outputHeadcopyMapperListKey1.size()>3) {
            log.info(outputHeadcopyMapperListKey1.toString());
            while(true){
                num1=getRandomNumber(outputHeadcopyMapperListKey1.size());
                num2=getRandomNumber(outputHeadcopyMapperListKey1.size());
                num3=getRandomNumber(outputHeadcopyMapperListKey1.size());
                if((num1!=num2)&&(num2!=num3)&&(num1!=num3))
                    break;
            }
            outputHeadcopy3.add(outputHeadcopyMapperListKey1.get(num1));
            outputHeadcopy3.add(outputHeadcopyMapperListKey1.get(num2));
            outputHeadcopy3.add(outputHeadcopyMapperListKey1.get(num3));
            return new ModelAndView("service/copy/headResult3").addObject("headcopyList", outputHeadcopy3);
        } else {
            if (outputHeadcopyMapperListKey2.size()>3) {
                log.info(outputHeadcopyMapperListKey2.toString());
                while(true){
                    num1=getRandomNumber(outputHeadcopyMapperListKey2.size());
                    num2=getRandomNumber(outputHeadcopyMapperListKey2.size());
                    num3=getRandomNumber(outputHeadcopyMapperListKey2.size());
                    if((num1!=num2)&&(num2!=num3)&&(num1!=num3))
                        break;
                }
                outputHeadcopy3.add(outputHeadcopyMapperListKey2.get(num1));
                outputHeadcopy3.add(outputHeadcopyMapperListKey2.get(num2));
                outputHeadcopy3.add(outputHeadcopyMapperListKey2.get(num3));
                return new ModelAndView("service/copy/headResult3").addObject("headcopyList", outputHeadcopy3);
            } else {
                if (outputHeadcopyMapperListKey3.size()>0) {
                    log.info(outputHeadcopyMapperListKey3.toString());
                    while(true){
                        num1=getRandomNumber(outputHeadcopyMapperListKey3.size());
                        num2=getRandomNumber(outputHeadcopyMapperListKey3.size());
                        num3=getRandomNumber(outputHeadcopyMapperListKey3.size());
                        if((num1!=num2)&&(num2!=num3)&&(num1!=num3))
                            break;
                    }
                    outputHeadcopy3.add(outputHeadcopyMapperListKey3.get(num1));
                    outputHeadcopy3.add(outputHeadcopyMapperListKey3.get(num2));
                    outputHeadcopy3.add(outputHeadcopyMapperListKey3.get(num3));
                    return new ModelAndView("service/copy/headResult3").addObject("headcopyList", outputHeadcopy3);
                } else {
                    log.info(outputHeadcopyMapperListCategory.toString());
                    return new ModelAndView("service/copy/headResult3").addObject("headcopyList", outputHeadcopyMapperListCategory);
                }
            }
        }

    }


    @GetMapping(path = "copy/head/input/loading")
    public ModelAndView headcopyLoading(inputHeadcopy inputHeadcopy, Model model){

        model.addAttribute("inputHeadcopy",inputHeadcopy);

        return new ModelAndView("service/copy/loading");
    }


    @GetMapping(path = "copy/sales/input/loading")
    public ModelAndView salescopyLoading(inputSalescopy inputSalescopy, Model model){

        model.addAttribute("inputSalescopy",inputSalescopy);

        return new ModelAndView("service/copy/salesloading");
    }

    @GetMapping(path = "/copy/sales/input")
    public ModelAndView salescopyResult(inputSalescopy inputsalescopy) {
        //List<outputSalescopy> outputSalescopyMapperListKey1 = salescopyMapper.selectSalesCopyListKey1(inputSalescopy);
        log.info(inputsalescopy.toString());
        List<String> combined_copies=copyService.selectSalesCopyListKey1(inputsalescopy);


        log.info(combined_copies.toString());
        return new ModelAndView("service/copy/salesResult").addObject("combined_copies", combined_copies);

    }



    //유튜브 카피
    @RequestMapping(path = "/copy/youtubeHeadCopy")
    public ModelAndView youtubeHeadCopy() {
        return new ModelAndView("service/copy/youtubeHeadCopy");
    }

    @PostMapping(value="/copy/youTubeCopyProcess")
    public ModelAndView youTubeCopyProcess(String brandName) throws IOException {

        return new ModelAndView("service/copy/youtubeHeadCopyRsult").
                addObject("youtube",  copyService.search(brandName));
    }

    // http://localhost:port/service/copy/loading
    @RequestMapping(path = "/copy/loading")
    public ModelAndView loading() {
        return new ModelAndView("service/copy/loading");
    }

    // http://localhost:port/service/copy/payment
    @RequestMapping(path = "/copy/payment")
    public ModelAndView payment() {
        return new ModelAndView("service/copy/payment");
    }

    @PostMapping("/copy/like")
    public ResponseEntity likeHeadcopy(likeHeadcopy likeHeadcopy){
        headcopyMapper.likeHeadcopy(likeHeadcopy);
        return new ResponseEntity(likeHeadcopy.getSentence()+"\n저장 완료! 마이페이지에서 확인하세요.", HttpStatus.OK);
    }

    public static int getRandomNumber(int size) {
        return new Random().nextInt(size);
    }


}
