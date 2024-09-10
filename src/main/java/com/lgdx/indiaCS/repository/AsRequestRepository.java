package com.lgdx.indiaCS.repository;

import com.lgdx.indiaCS.domain.AsRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AsRequestRepository extends JpaRepository<AsRequest, String> {

}
