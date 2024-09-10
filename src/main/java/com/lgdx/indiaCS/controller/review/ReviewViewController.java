package com.lgdx.indiaCS.controller.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewViewController {

    @GetMapping("/reviewSurvey")
    public String reviewSurvey() { return  "/reviewSurvey"; }

    @GetMapping("/reviewComplete")
    public String reviewComplete() {
        return "/reviewComplete";
    }

    @GetMapping("/reservationCheck")
    public String reservationCheck() {
        return "/reservationCheck";
    }

}
