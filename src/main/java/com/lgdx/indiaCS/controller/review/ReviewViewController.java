package com.lgdx.indiaCS.controller.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReviewViewController {

    @GetMapping("/review-survey")
    public String reviewSurvey() { return  "/reviewSurvey"; }

    @GetMapping("/review-complete")
    public String reviewComplete() {
        return "/reviewComplete";
    }

}
