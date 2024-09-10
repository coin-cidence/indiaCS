package com.lgdx.indiaCS.repository;

import com.lgdx.indiaCS.domain.Technician;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TechnicianRepository extends JpaRepository<Technician , String> {

}
