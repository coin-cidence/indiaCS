package com.lgdx.indiaCS.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Technician")
public class Technician {

    @Id
    @Column(name = "technician_id")
    private String technicianId;
    private String technicianName;
    private double technicianAvgScore;
    private String technicianCenter;

    public Technician() {}

    public String getTechnicianId() {
        return technicianId;
    }

    public void setTechnicianId(String technicianId) {
        this.technicianId = technicianId;
    }

    public String getTechnicianName() {
        return technicianName;
    }

    public void setTechnicianName(String technicianName) {
        this.technicianName = technicianName;
    }

    public double getTechnicianAvgScore() {
        return technicianAvgScore;
    }

    public void setTechnicianAvgScore(double technicianAvgScore) {
        this.technicianAvgScore = technicianAvgScore;
    }

    public String getTechnicianCenter() {
        return technicianCenter;
    }

    public void setTechnicianCenter(String technicianCenter) {
        this.technicianCenter = technicianCenter;
    }

}
