package com.mf.mofang;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.mf.mofang.dao")
public class App {

    public static void main(String[] args) {

        SpringApplication.run(App.class, args);
        System.out.println("启动成功");
        System.out.println("请访问");
        System.out.println("http://127.0.0.1:8080");
    }

}
