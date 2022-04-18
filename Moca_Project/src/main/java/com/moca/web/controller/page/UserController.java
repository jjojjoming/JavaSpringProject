package com.moca.web.controller.page;


import com.moca.web.domain.model.Cs;
import com.moca.web.domain.model.History;
import com.moca.web.domain.model.Review;
import com.moca.web.domain.model.Users;
import com.moca.web.repository.MypageRepository;
import com.moca.web.service.CodeService;
import com.moca.web.service.ProfileService;
import com.moca.web.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@RequestMapping(value = "/user/")
@Controller
public class UserController {

    @Autowired
    MypageRepository mypageRepository;
    @Autowired
    UserService userService;
    @Autowired
    ProfileService profileService;
    @Autowired
    CodeService codeService;
    @Autowired
    private PasswordEncoder passwordEncoder;


    @RequestMapping(path = "info")
    public ModelAndView userInfo(HttpServletRequest request) {
        Users users = (Users)request.getSession().getAttribute("user");
        if(users == null) {
            return new ModelAndView("user/mypage/loginPlase");
        }
        else {
            return new ModelAndView("user/mypage/user-info").addObject("User", users);
        }
    }

    @PostMapping("info/change")
    public ModelAndView userInfoChange(HttpServletRequest request) {

        Users users = new Users();
        users = (Users)request.getSession().getAttribute("user");

        if(request.getParameter("passwordIn").equals("Change")) {
            users.setName(request.getParameter("name"));
            users.setAddress(request.getParameter("address"));
            users.setPhone((request.getParameter("phone")));
            mypageRepository.updateInfo(users);
            return new ModelAndView("user/mypage/uqdate-success");

        }else if (passwordEncoder.matches(request.getParameter("passwordIn"), users.getPassword())){
            users.setPassword(passwordEncoder.encode(request.getParameter("newPassword")));
            mypageRepository.updatePassword(users);
            return new ModelAndView("user/mypage/uqdate-success");

        }else {
            return new ModelAndView("user/mypage/uqdate-fail");
        }


    }
    @PostMapping("info/profile")
    public ModelAndView profileChange(@Valid @ModelAttribute("Users") Users users, HttpServletRequest request) {
        MultipartFile upload_file = users.getProfileImg();
        users = (Users)request.getSession().getAttribute("user");
        users.setProfileImgName(profileService.saveUploadFile(upload_file));
        mypageRepository.updateProfileImg(users);
        System.out.println(users.getProfileImgName());
        return new ModelAndView("user/mypage/uqdate-success");
    }


    @RequestMapping(path = "mycopy")
    public ModelAndView mycopy(HttpServletRequest request) {
        Users users = new Users();
        users = (Users)request.getSession().getAttribute("user");
        List<History> headHistory = mypageRepository.selectHeadHistory(users);
        List<History> salesHistory = mypageRepository.selectSalesHistory(users);
        List<History> naverHistory = mypageRepository.selectNaverHistory(users);
        List<History> youtubeHistory = mypageRepository.selectYoutubeHistory(users);
        return new ModelAndView("user/mypage/user-mycopy").addObject("headHistory", headHistory).addObject("salesHistory", salesHistory)
                .addObject("naverHistory", naverHistory).addObject("youtubeHistory", youtubeHistory);

    }
    @RequestMapping(path = "mycopy/trans")
    @ResponseBody
    public String mycopyTrans(History history) {
        if(history.getSentence() == null) {
            mypageRepository.deleteHistory(history);
            return "redirect:/user/mycopy";
        }
        else {
            mypageRepository.updateHistory(history);
            return "redirect:/user/mycopy";
        }

//        return "redirect:/user/mycopy";
    }

    @RequestMapping(path = "withdrawal")
    public ModelAndView withdrawal(HttpServletRequest request) {
        Users users = new Users();
        users = (Users)request.getSession().getAttribute("user");
        return new ModelAndView("user/mypage/user-withdrawal").addObject("User", users);
    }

    @RequestMapping(path = "withdrawal/check")
    public ModelAndView withdrawalCheck() { return new ModelAndView("user/mypage/user-withdrawalCheck"); }

    @RequestMapping(path = "withdrawal/Code")
    public ModelAndView withdrawalCode(HttpServletRequest request) {
        Users users = new Users();
        users = (Users)request.getSession().getAttribute("user");

        if (passwordEncoder.matches(request.getParameter("passwordIn"), users.getPassword())){
            System.out.println(users.getEmail());
            users.setVerificationCode(String.valueOf(codeService.verificationMail(users)));
            mypageRepository.verificationCodeMail(users);
            return new ModelAndView("user/mypage/user-withdrawalCodeCheck").addObject("User", users);

        }else {
            return new ModelAndView("user/mypage/withdrawal-fail");
        }
    }

    @RequestMapping(path = "withdrawal/success")
    public ModelAndView withdrawalSuccess(HttpServletRequest request) {
        Users users = new Users();
        users = (Users)request.getSession().getAttribute("user");

        if (users.getVerificationCode().equals(request.getParameter("verificationCode"))){
            userService.withdrawal(users);
            return new ModelAndView("user/mypage/withdrawal-success");

        }else {
            return new ModelAndView("user/mypage/withdrawal-fail");
        }
    }

    @RequestMapping(path = "review")
    public ModelAndView review(HttpServletRequest request) {
        Users users = new Users();
        List<Review> reviewList = new ArrayList<Review>();
        List<Cs> csList = new ArrayList<Cs>();
        users = (Users)request.getSession().getAttribute("user");
        reviewList = mypageRepository.selectReview(users);
        csList = mypageRepository.selectBoard(users);

        return new ModelAndView("user/mypage/user-review").addObject("reviewList", reviewList).addObject("csList", csList);

    }
    @RequestMapping(path = "review/newpage")
    public ModelAndView reviewnewpage(HttpServletRequest request) {
        Users users = new Users();
        users = (Users)request.getSession().getAttribute("user");

        return new ModelAndView("user/mypage/user-review-newpage").addObject("users", users);

    }
    @RequestMapping(path = "review/write")
    public String reviewWrite(HttpServletRequest request, Review review) {
        Users users = new Users();
        users = (Users)request.getSession().getAttribute("user");
        review.setUserId(users.getId());
//        review.setContent(request.getParameter("content"));
        review.setOpenView(false);
        mypageRepository.insertReview(review);

        return new String("redirect:/user/review");

    }

    @RequestMapping(path = "review/trans")
    @ResponseBody
    public String reviewTrans(Review review) {
        if(review.getContent() == null) {
            mypageRepository.deleteReview(review);
            return "redirect:/user/review";
        }
        else {
            mypageRepository.updateReview(review);
            return "redirect:/user/review";
        }

    }



}
