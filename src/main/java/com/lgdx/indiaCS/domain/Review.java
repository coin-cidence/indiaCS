package com.lgdx.indiaCS.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.Date;

@Entity
@Table(name="Review")
public class Review {

    @Id
    @Column(name="as_request_id")
    private String asRequestId;
    private String technicianId;
    private int reviewRating;
    private Date reviewDate;

    public Review() {}

    public String getAsRequestId() {
        return asRequestId;
    }

    public void setAsRequestId(String asRequestId) {
        this.asRequestId = asRequestId;
    }

    public String getTechnicianId() {
        return technicianId;
    }

    public void setTechnicianId(String technicianId) {
        this.technicianId = technicianId;
    }

    public int getReviewRating() {
        return reviewRating;
    }

    public void setReviewRating(int reviewRating) {
        this.reviewRating = reviewRating;
    }

    public Date getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Date reviewDate) {
        this.reviewDate = reviewDate;
    }

    @Override
    public String toString() {
        return "Review{" +
                "asRequestId='" + asRequestId + '\'' +
                ", technicianId='" + technicianId + '\'' +
                ", reviewRating='" + reviewRating + '\'' +
                ", reviewDate='" + reviewDate + '\'' +
                '}';
    }

}
