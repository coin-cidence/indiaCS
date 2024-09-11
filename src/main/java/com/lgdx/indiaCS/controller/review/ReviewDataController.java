package com.lgdx.indiaCS.controller.review;

import com.lgdx.indiaCS.domain.ReviewMore;
import com.lgdx.indiaCS.service.ReviewService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
public class ReviewDataController {

    @Autowired
    private ReviewService reviewService;

    @PostMapping("/submit-survey")
    public ResponseEntity<String> submitSurvey(@RequestBody ReviewMore reviewMore , HttpSession session) {
        try {
            reviewMore.setAsRequestId((String)session.getAttribute("asRequestId"));
            System.out.println("[asRequestId] ==>" + reviewMore.getAsRequestId());
            reviewMore.setReviewDate(new Date());
            reviewService.saveReview(reviewMore);
            return ResponseEntity.ok("Survey submitted successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error submitting survey");
        }
    }

}
