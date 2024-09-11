package com.lgdx.indiaCS.controller.process;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProcessViewController {

    @GetMapping("/process")
    public String reviewComplete(HttpSession session ) {

        System.out.println("[입력받은 asRequestId in ProcessViewController]" + session.getAttribute("asRequestId"));

        return "/process";
    }

}
