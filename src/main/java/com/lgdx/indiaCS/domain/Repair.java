package com.lgdx.indiaCS.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.Date;

@Entity
@Table(name = "Repair")
public class Repair {

    @Id
    @Column(name = "repair_id")
    private String repairId;
    @Column(name = "diagnose_id")
    private String diagnoseId;
    private int repairState;
    private Date repairDate;
    private String repairPartInventory;

    public Repair() {}

    public String getRepairId() {
        return repairId;
    }

    public void setRepairId(String repairId) {
        this.repairId = repairId;
    }

    public String getDiagnoseId() {
        return diagnoseId;
    }

    public void setDiagnoseId(String diagnoseId) {
        this.diagnoseId = diagnoseId;
    }

    public int getRepairState() {
        return repairState;
    }

    public void setRepairState(int repairState) {
        this.repairState = repairState;
    }

    public Date getRepairDate() {
        return repairDate;
    }

    public void setRepairDate(Date repairDate) {
        this.repairDate = repairDate;
    }

    public String getRepairPartInventory() {
        return repairPartInventory;
    }

    public void setRepairPartInventory(String repairPartInventory) {
        this.repairPartInventory = repairPartInventory;
    }
}
