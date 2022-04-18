package com.moca.web.controller.page;


import com.moca.web.domain.model.Users;
import com.moca.web.repository.UserRepository;
import com.moca.web.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/")
@Controller
public class indexController {

    private final UserService userService;
    private final UserRepository userRepository;

    @RequestMapping(path = {""})
    public ModelAndView index() {
        List<Map<String, Object>> reviews = userRepository.getReviews();
        return new ModelAndView("index").addObject("reviews", reviews);
    }

    @RequestMapping(path = {"login"})
    public ModelAndView login(Principal principal, @RequestParam(value = "error", defaultValue = "false") Boolean error,
                              @RequestParam(value = "withdrawal", defaultValue = "false") Boolean withdrawal) {

        if (withdrawal) {
            return new ModelAndView("login").
                    addObject("withdrawal", withdrawal);
        } else {
            if (error) {
                return new ModelAndView("login").
                        addObject("error", error);
            } else {
                if (!ObjectUtils.isEmpty(principal)) {
                    return new ModelAndView("index");
                }
                return new ModelAndView("login");
            }
        }
    }

    @RequestMapping(path = "signup")
    public ModelAndView signUp() {
        return new ModelAndView("user/sign-up");
    }

    @RequestMapping(path = "signup/email")
    public ModelAndView signUpEmail() { return new ModelAndView("user/signup-email"); }

    @RequestMapping(path = "signup/email/mocaagree")
    public ModelAndView signAgree() { return new ModelAndView("user/agreemoca"); }

    @RequestMapping(path = "signup/email/infoagree")
    public ModelAndView signAgreeInfo() { return new ModelAndView("user/agreeinfo"); }

    @RequestMapping(path = "signup/email/choiceagree")
    public ModelAndView signAgreeChoice() { return new ModelAndView("user/agreechoice"); }

    //이메일 중복확인 체크 요청
    @PostMapping("signup/emailCheck")
    @ResponseBody
    public Map<String, Object> emailCount(@RequestBody String userEmail) {
        //클라이언트에 비동기 통신으로 받아줘야하니까 @ReqeustBody를 사용한다.

        //값확인
        System.out.println("중복 확인 요청된 이메일 : " + userEmail);

        Map<String, Object> data = new HashMap<>();

        //서비스 측에 요청
        int result = userService.emailCount(userEmail);

        if (result == 0) {
            System.out.println("이메일 사용 가능!");
            data.put("confirm", "OK");
        } else {
            System.out.println("이메일 중복! 사용 불가!");
            data.put("confirm", "NO");
        }
        return data;
    }

    /**
     * 회원가입 진행
     *
     * @param users
     * @return
     */

    @PostMapping("signUp/complete")
    public ModelAndView signUp(Users users, RedirectAttributes redirectAttributes) {
        userService.joinUser(users);
        /*redirectAttributes.addFlashAttribute("message","회원가입이 완료되었습니다.");*/
        return new ModelAndView ("user/signup-success");
    }

    @RequestMapping(path = "team")
    public ModelAndView team() {
        return new ModelAndView("team");
    }
}
