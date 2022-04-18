package com.moca.web.controller.page;


import com.moca.web.domain.model.*;
import com.moca.web.repository.NoticeRepository;
import com.moca.web.service.CsService;
import com.moca.web.service.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/cs")
@Controller
public class CsController {

    @Autowired
    private CsService csService;

    public static final int PAGE_SIZE = 5;

    private final NoticeService noticeService;
    private final NoticeRepository noticeRepository;



    /**
     * 공지 목록
     *
     * @param page
     * @param model
     * @return
     */
    @RequestMapping(path = "/notice")
    public String list(@RequestParam(defaultValue = "1") int page, Model model) {

        PagerInfo pagerInfo = new PagerInfo(page, PAGE_SIZE);
        pagerInfo.setItemCountTotal(noticeRepository.selectNoticeCount());
        List<Notice> selectNoticeList = noticeService.selectNoticeList(pagerInfo, 0);
        List<Notice> selectHeaderNoticeList = null;
        if (page == 1) {
            selectHeaderNoticeList = noticeRepository.selectNoticeList(pagerInfo, 1);
        }
        model.addAttribute("pagerInfo", pagerInfo);
        model.addAttribute("noticeList", selectNoticeList);
        model.addAttribute("headerNoticeList", selectHeaderNoticeList);

        return "notice/list";
    }

    //게시판 메인화면
    @RequestMapping(path = "/faq")
    public ModelAndView faq(@RequestParam(value = "page",defaultValue = "1") int page) {
        List<Cs> faqs = csService.getCsList(page);  //List에 해당 페이지의 구현부
        Page pageCount = csService.getCsCount(page);    //page모델에 해당
        return new ModelAndView("cs/faq/faq").addObject("faqs", faqs).addObject("page", pageCount);
    }

    //게시글 작성
    @RequestMapping(path = "/write")
    public ModelAndView write(HttpServletRequest request) {
        Users users = new Users();  //유저 불러옴
        users = (Users)request.getSession().getAttribute("user");   //유저 bean에 세션영역에 있는 유저 정보 담음
        return new ModelAndView("cs/faq/write").addObject("users",users);
    }

    //게시글 작성 완료 시
    @PostMapping("/writePro")
    public ModelAndView writePro( Cs writeContent,HttpServletRequest request,Model model) {


        /*공백 들어오는거 확인System.out.println("제목:"+writeContent.getSubject());*/
        //bean에있는 제목단이 빈칸일경우
        /*넘겨주는 경우는 null로 넘어가는 경우는 없다*/
        if(writeContent.getSubject().equals("")) {
            model.addAttribute("writeContent",writeContent);
            return new ModelAndView("cs/faq/write");
        }

        Users users = new Users();  //유저 불러옴
        users = (Users)request.getSession().getAttribute("user");   //유저 bean에 세션영역에 있는 유저 정보 담음
        writeContent.setUserId(users.getId());      //cs 모델에 유저 아이디 담음
        csService.insertContent(writeContent);      //쿼리문 insert문 cs모델에 담음
        return new ModelAndView("cs/faq/writeProSuccess");
    }


    @GetMapping(path = "/view")
    public ModelAndView view(@RequestParam("boardId") int boardId, @RequestParam("userId")int userId ,Model model,HttpServletRequest request) {
        Cs readFaqBean = csService.readFaq(boardId);
        model.addAttribute("boardId",boardId);
        model.addAttribute("readFaqBean",readFaqBean);
        model.addAttribute("userId",userId);
        return new ModelAndView("cs/faq/view");
    }

    //수정 컨트롤러
    @GetMapping(path = "/modify")
    public ModelAndView modify(@RequestParam("boardId") int boardId, @RequestParam("userId")int userId ,Model model,Cs modifyFaqBean) {

        modifyFaqBean  = csService.readFaq(boardId);
        model.addAttribute("boardId",boardId);
        model.addAttribute("modifyFaqBean",modifyFaqBean);
        model.addAttribute("userId",userId);

        return new ModelAndView("cs/faq/modify");

    }

    //게시판 업데이트
    @PostMapping(path = "/modifyPro")
    public ModelAndView modify(Cs writeContent) {

        if(writeContent.getSubject() == null) {
            return new ModelAndView("cs/faq/modify");
        }

        csService.updateFaq(writeContent);      //쿼리문 insert문 cs모델에 담음
        return new ModelAndView("cs/faq/modifySuccess");
    }

    //게시판 삭제
    @GetMapping(path = "/inquiryDelete")
    public ModelAndView inquiryDelete(int boardId) {
        csService.deleteFaq(boardId);
        return new ModelAndView("cs/faq/inquiryDeleteSuccess");
    }

   /* @RequestMapping(path = "/questions")
    public ModelAndView qa(@RequestParam(value = "page",defaultValue = "1") int page) {
        List<Cs> faqs = csService.getCsList(page);
        Page pageCount = csService.getCsCount(page);
        return new ModelAndView("cs/faq/questions").addObject("faqs", faqs).addObject("page", pageCount);
    }

    @GetMapping(path = "/questions-view")
    public ModelAndView questionsView( @RequestParam("boardId") int boardId, @RequestParam("userId")int userId ,Model model,HttpServletRequest request) {
        Cs readFaqBean=new Cs();
        readFaqBean  = csService.readFaq(boardId);
        model.addAttribute("boardId",boardId);
        model.addAttribute("readFaqBean",readFaqBean);
        model.addAttribute("userId",userId);
        Users users = new Users();  //유저 불러옴
        users = (Users)request.getSession().getAttribute("user");   //유저 bean에 세션영역에 있는 유저 정보 담음
        return new ModelAndView("cs/faq/questions-view");
        //어떤 게정을 로그인하던  모카꺼만 나옴
    }

    @RequestMapping(path = "/questions-write")
    public ModelAndView questionsWrite(HttpServletRequest request) {
        Users users = new Users();  //유저 불러옴
        users = (Users)request.getSession().getAttribute("user");   //유저 bean에 세션영역에 있는 유저 정보 담음
        return new ModelAndView("cs/faq/questions-write").addObject("users",users);
    }*/
}
