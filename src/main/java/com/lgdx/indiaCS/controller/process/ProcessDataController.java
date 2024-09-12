package com.lgdx.indiaCS.controller.process;

import com.lgdx.indiaCS.domain.Review;
import com.lgdx.indiaCS.service.ReviewService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class ProcessDataController {

    @Autowired
    private ReviewService reviewService;

    @PostMapping("/updateRating")
    public ResponseEntity<String> updateReviewRating(@RequestBody Map<String, String> payload, HttpSession session) {
        String asRequestId = (String) session.getAttribute("asRequestId"); // 세션에서 asRequestId 가져오기
        int reviewRating = Integer.parseUnsignedInt(payload.get("reviewRating")); // 요청에서 reviewRating 가져오기
        reviewService.updateReview(asRequestId, reviewRating);
        return ResponseEntity.ok("Rating saved successfully");
    }
}
