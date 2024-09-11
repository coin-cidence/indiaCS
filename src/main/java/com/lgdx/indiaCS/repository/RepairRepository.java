package com.lgdx.indiaCS.repository;

import com.lgdx.indiaCS.domain.Diagnose;
import com.lgdx.indiaCS.domain.Repair;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RepairRepository extends JpaRepository<Repair , String> {
    @Query("SELECT r FROM Repair r WHERE r.repairId = :repairId")
    Optional<Repair> findByRepairId(@Param("repairId") String repairId);

    @Query("SELECT d FROM Repair d WHERE d.diagnoseId = :diagnoseId")
    Optional<Repair> findByAsDiagnoseId(@Param("diagnoseId") String diagnoseId);
}
