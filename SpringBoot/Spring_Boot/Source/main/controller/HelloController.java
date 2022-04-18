package spring.boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {

    //MVC
    @GetMapping("hello-mvc")
    public String helloMvc(@RequestParam("name") String name, Model model){

        model.addAttribute("name",name);
        return "hello-template";
    }

    //API 문자내용 직접 반환
    @GetMapping("hello-spring")
    @ResponseBody //Body:HTTP 통신 프로토콜의 Body
    public String helloString(@RequestParam("name") String name){
         return "hello " +name ;
    }

    //API (객체 -> Json)
    @GetMapping("hello-api")
    @ResponseBody //Body
    public Hello helloApi(@RequestParam("name") String name){

        Hello hello=new Hello();
        hello.setName(name);

        return hello;
    }

    static class Hello{
        private String name;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
    }

}
