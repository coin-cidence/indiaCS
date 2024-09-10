package com.lgdx.indiaCS.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.Date;

@Entity
@Table(name = "Product")
public class Product {

    @Id
    @Column(name = "product_id")
    private String productId;
    private String userId;
    private String productType;
    private String productSerialNumber;
    private Date productPurchaseDate;
    private Date productAssuranceDate;

    public Product() {}

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public String getProductSerialNumber() {
        return productSerialNumber;
    }

    public void setProductSerialNumber(String productSerialNumber) {
        this.productSerialNumber = productSerialNumber;
    }

    public Date getProductPurchaseDate() {
        return productPurchaseDate;
    }

    public void setProductPurchaseDate(Date productPurchaseDate) {
        this.productPurchaseDate = productPurchaseDate;
    }

    public Date getProductAssuranceDate() {
        return productAssuranceDate;
    }

    public void setProductAssuranceDate(Date productAssuranceDate) {
        this.productAssuranceDate = productAssuranceDate;
    }
}
