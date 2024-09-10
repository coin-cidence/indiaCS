package com.lgdx.indiaCS.controller.review;

import com.lgdx.indiaCS.domain.ReviewMore;
import com.lgdx.indiaCS.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReviewDataController {

    @Autowired
    private ReviewService reviewService;

    @PostMapping("/submitSurvey")
    public ResponseEntity<String> submitSurvey(@RequestBody ReviewMore reviewMore) {
        try {
            // Save the review data to the database
            reviewService.saveReview(reviewMore);
            // Return a success response
            return ResponseEntity.ok("Survey submitted successfully");
        } catch (Exception e) {
            // Handle exceptions and return an error response
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error submitting survey");
        }
    }
}
