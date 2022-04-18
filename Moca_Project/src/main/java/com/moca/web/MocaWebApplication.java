package com.moca.web;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan(basePackages = "com.moca.web.repository")
@SpringBootApplication
public class MocaWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(MocaWebApplication.class, args);
    }

}
