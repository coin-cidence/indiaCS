package com.lgdx.indiaCS;

import com.lgdx.indiaCS.domain.AsRequest;
import com.lgdx.indiaCS.domain.ReviewMore;
import com.lgdx.indiaCS.repository.AsRequestRepository;
import com.lgdx.indiaCS.repository.ReviewMoreRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@SpringBootTest
public class ReviewMoreRepositoryTest {

    ReviewMoreRepository reviewMoreRepository;
//    AsRequestRepository asRequestRepository;

    @Autowired
    public ReviewMoreRepositoryTest( ReviewMoreRepository reviewMoreRepository ) { this.reviewMoreRepository = reviewMoreRepository; }

    @Autowired
    private AsRequestRepository asRequestRepository;

    @Test
    public void 접수번호적재_테스트() {

        AsRequest asRequest = new AsRequest();
        asRequest.setAsRequestId("asr041");
        asRequest.setProductId("prod041");

        // Date로 날짜를 설정
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date asRequestDate = formatter.parse("2024-10-10");
            asRequest.setAsRequestDate(asRequestDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        asRequest.setAsRequestCenter("D");

        asRequestRepository.save(asRequest);

    }

    @Test
    public void 리뷰적재_테스트() {

        ReviewMore reviewMore = new ReviewMore();
        reviewMore.setAsRequestId("asr041");
        reviewMore.setQuestion1(3);
        reviewMore.setQuestion2(4);
        reviewMore.setQuestion3(5);
        reviewMore.setReviewComment("기사님이 설치는 잘 해주셨는데, 기기 사용법 설명이 미숙했습니다.");

        // Date로 날짜를 설정
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date reviewDate = formatter.parse("2024-10-21");
            reviewMore.setReviewDate(reviewDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        reviewMoreRepository.save(reviewMore);
    }
}
