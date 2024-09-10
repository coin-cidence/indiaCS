package com.lgdx.indiaCS.repository;

import com.lgdx.indiaCS.domain.Diagnose;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DiagnoseRepository extends JpaRepository<Diagnose , String> {

}
