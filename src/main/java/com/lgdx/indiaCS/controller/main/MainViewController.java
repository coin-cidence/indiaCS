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

    @PostMapping("/login-process")
    public String loginProcess(){
        return "/Installation_AS(mypage)";
    }

    @GetMapping("/deviceSelection")
    public String deviceSelection() {
        return "/deviceSelection";
    }

    @GetMapping("/deviceSelectionInstall")
    public String deviceSelectionInstall() {
        return "/deviceSelectionInstall";
    }

    @GetMapping("/diagnose1")
    public String diag1() { return  "/diagnosis_1"; }

    @GetMapping("/diagnose2")
    public String diag2() {
        return "/diagnosis_2";
    }

    @GetMapping("/diagnose3")
    public String diag3() {
        return "/diagnosis_3";
    }

    @GetMapping("/reservation")
    public String res() {
        return "/reservationAS";
    }
}
