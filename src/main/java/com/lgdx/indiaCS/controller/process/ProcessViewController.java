package com.lgdx.indiaCS.controller.process;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProcessViewController {

    @GetMapping("/process")
    public String reviewComplete() {
        return "/process";
    }

}
