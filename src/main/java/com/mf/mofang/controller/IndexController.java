package com.mf.mofang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * @author pt
 */
@Controller
@Slf4j
@RequestMapping("")
public class IndexController {


    @RequestMapping(value = {"/", "/index"})
    public String index() {

        return "index.html";
    }



}
