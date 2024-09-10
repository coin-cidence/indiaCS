package com.lgdx.indiaCS.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.Date;

@Entity
@Table(name = "Review_more")
public class ReviewMore {

    @Id
    @Column(name = "as_request_id")
    private String asRequestId;
    private int question1;
    private int question2;
    private int question3;
    private String reviewComment;
    private Date reviewDate;

    public ReviewMore() {}

    public String getAsRequestId() {
        return asRequestId;
    }

    public void setAsRequestId(String asRequestId) {
        this.asRequestId = asRequestId;
    }

    public int getQuestion1() {
        return question1;
    }

    public void setQuestion1(int question1) {
        this.question1 = question1;
    }

    public int getQuestion2() {
        return question2;
    }

    public void setQuestion2(int question2) {
        this.question2 = question2;
    }

    public int getQuestion3() {
        return question3;
    }

    public void setQuestion3(int question3) {
        this.question3 = question3;
    }

    public String getReviewComment() {
        return reviewComment;
    }

    public void setReviewComment(String reviewComment) {
        this.reviewComment = reviewComment;
    }

    public Date getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Date reviewDate) {
        this.reviewDate = reviewDate;
    }

    @Override
    public String toString() {
        return "ReviewMore{" +
                "asRequestId='" + asRequestId + '\'' +
                ", question1='" + question1 + '\'' +
                ", question2='" + question2 + '\'' +
                ", question3='" + question3 + '\'' +
                ", reviewComment='" + reviewComment + '\'' +
                ", reviewDate='" + reviewDate + '\'' +
                '}';
    }

}
