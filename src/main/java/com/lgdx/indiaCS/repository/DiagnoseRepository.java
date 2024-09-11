package com.lgdx.indiaCS.repository;

import com.lgdx.indiaCS.domain.Diagnose;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface DiagnoseRepository extends JpaRepository<Diagnose , String> {

    @Query("SELECT d FROM Diagnose d WHERE d.diagnoseId = :diagnoseId")
    Optional<Diagnose> findByAsDiagnoseId(@Param("diagnoseId") String diagnoseId);

}
