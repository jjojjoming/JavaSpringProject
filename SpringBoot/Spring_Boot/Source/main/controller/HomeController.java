package spring.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    //"/"요청은 index.html(정적요청)보다 우선순위가 높다
    @GetMapping("/")
    public String home(){
        return "home";
    }

}
