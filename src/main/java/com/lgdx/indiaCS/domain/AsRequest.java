package com.lgdx.indiaCS.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.Date;

@Entity
@Table(name = "AS_Request")
public class AsRequest {

    @Id
    @Column(name = "as_request_id")
    private String asRequestId;
    private String productId;
    private Date asRequestDate;
    private String asRequestCenter;

    public AsRequest() {}

    public String getAsRequestId() {
        return asRequestId;
    }

    public void setAsRequestId(String asRequestId) {
        this.asRequestId = asRequestId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public Date getAsRequestDate() {
        return asRequestDate;
    }

    public void setAsRequestDate(Date asRequestDate) {
        this.asRequestDate = asRequestDate;
    }

    public String getAsRequestCenter() {
        return asRequestCenter;
    }

    public void setAsRequestCenter(String asRequestCenter) {
        this.asRequestCenter = asRequestCenter;
    }

    @Override
    public String toString() {
        return "AsRequest{" +
                "asRequestId='" + asRequestId + '\'' +
                ", productId='" + productId + '\'' +
                ", asRequestDate=" + asRequestDate +
                ", asRequestCenter='" + asRequestCenter + '\'' +
                '}';
    }
}
