package com.lgdx.indiaCS.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MainViewController {

    @GetMapping("")
    public String helloHome() {
        return "/Hello";
    }

    @GetMapping("/Installation_AS(login)")
    public String installationASLogin() {
        return "/Installation_AS(login)";
    }

    @GetMapping("/Installation_AS(mypage)")
    public String installationASMypage() {
        return "/Installation_AS(mypage)";
    }

    @GetMapping("/login")
    public String login() {
        return "/login";
    }

    @GetMapping("/deviceSelection")
    public String deviceSelection() {
        return "/deviceSelection";
    }
}
