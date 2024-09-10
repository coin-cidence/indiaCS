package com.lgdx.indiaCS;

import com.lgdx.indiaCS.domain.ReviewMore;
import com.lgdx.indiaCS.repository.ReviewMoreRepository;
import com.lgdx.indiaCS.repository.ReviewRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@SpringBootTest
public class ReviewRepositoryTest {

    ReviewMoreRepository reviewMoreRepository;

    @Autowired
    public ReviewRepositoryTest( ReviewMoreRepository reviewMoreRepository ) { this.reviewMoreRepository = reviewMoreRepository; }

    @Test
    public void 리뷰적재_테스트() {

        ReviewMore reviewMore = new ReviewMore();
        reviewMore.setAsRequestId("asr041");
        reviewMore.setQuestion1(3);
        reviewMore.setQuestion2(4);
        reviewMore.setQuestion3(5);
        reviewMore.setReviewComment("기사님이 설치는 잘 해주셨는데, 기기 사용법 설명이 미숙했습니다.");

        reviewMoreRepository.save(reviewMore);
    }
}
