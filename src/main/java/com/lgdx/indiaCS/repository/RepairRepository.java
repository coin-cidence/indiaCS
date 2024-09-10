package com.lgdx.indiaCS.repository;

import com.lgdx.indiaCS.domain.Repair;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RepairRepository extends JpaRepository<Repair , String> {

}
