package com.lgdx.indiaCS.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.Date;

@Entity
@Table(name = "Diagnose")
public class Diagnose {

    @Id
    @Column(name = "diagnose_id")
    private String diagnoseId;
    private String asRequestId;
    private String diagnoseContent;
    private Date diagnoseDate;

    public Diagnose() {}

    public String getDiagnoseId() {
        return diagnoseId;
    }

    public void setDiagnoseId(String diagnoseId) {
        this.diagnoseId = diagnoseId;
    }

    public String getAsRequestId() {
        return asRequestId;
    }

    public void setAsRequestId(String asRequestId) {
        this.asRequestId = asRequestId;
    }

    public String getDiagnoseContent() {
        return diagnoseContent;
    }

    public void setDiagnoseContent(String diagnoseContent) {
        this.diagnoseContent = diagnoseContent;
    }

    public Date getDiagnoseDate() {
        return diagnoseDate;
    }

    public void setDiagnoseDate(Date diagnoseDate) {
        this.diagnoseDate = diagnoseDate;
    }
}
