package spring.boot.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import spring.boot.domain.Member;
import spring.boot.service.MemberService;

import java.util.List;

@Controller
public class MemberController {

    private final MemberService memberService;

    @Autowired
    public MemberController(MemberService memberService) { //DI
        this.memberService = memberService;
    }

    @GetMapping("/members/new")
    public String creatForm(){
        return "members/creatMemberForm";
    }

    @PostMapping("/members/new")
    public String creat(MemberForm form){

        Member member=new Member();
        member.setName(form.getName());

        memberService.join(member);

        return "redirect:/";

    }

    @GetMapping("/members")
    public String list(Model model){

        List<Member> members = memberService.findMembers();
        model.addAttribute("members", members);

        return "members/memberList";
    }





}
