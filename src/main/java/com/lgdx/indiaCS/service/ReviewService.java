package com.lgdx.indiaCS.service;

import com.lgdx.indiaCS.domain.ReviewMore;
import com.lgdx.indiaCS.repository.ReviewMoreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class ReviewService {

    @Autowired
    ReviewMoreRepository reviewMoreRepository;

    public void saveReview(ReviewMore reviewMore) {
        // Set review date if not set from the client (just in case)
        if (reviewMore.getReviewDate() == null) {
            reviewMore.setReviewDate(new Date());
        }

        // Save to the database using the repository
        reviewMoreRepository.save(reviewMore);
    }

}
