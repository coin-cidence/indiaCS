package com.lgdx.indiaCS.service;

import com.lgdx.indiaCS.domain.Review;
import com.lgdx.indiaCS.domain.ReviewMore;
import com.lgdx.indiaCS.repository.ReviewMoreRepository;
import com.lgdx.indiaCS.repository.ReviewRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Date;

@Service
public class ReviewService {

    @Autowired
    ReviewMoreRepository reviewMoreRepository;

    @Autowired
    ReviewRepository reviewRepository;

    public void saveReview(ReviewMore reviewMore) {
        reviewMoreRepository.save(reviewMore);
    }

    @Transactional  // 업데이트 작업을 트랜잭션으로 처리
    public void updateReview(String asRequestId, int reviewRating) {
        Review review = reviewRepository.findByAsRequestId(asRequestId)
                .orElseThrow(() -> new IllegalArgumentException("해당 ID로 리뷰를 찾을 수 없습니다."));

        review.setReviewRating(reviewRating);
        review.setReviewDate(new Date());  // 현재 서버 시간을 reviewDate로 설정

        reviewRepository.save(review);
    }

}
