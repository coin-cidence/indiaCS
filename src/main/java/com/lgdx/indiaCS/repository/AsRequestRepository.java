package com.lgdx.indiaCS.repository;

import com.lgdx.indiaCS.domain.AsRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AsRequestRepository extends JpaRepository<AsRequest, String> {

    Optional<AsRequest> findByAsRequestId(String asRequestId);

    @Query(value = "SELECT * FROM AS_REQUEST WHERE PRODUCT_ID IN ( SELECT PRODUCT_ID FROM PRODUCT WHERE USER_ID = :userId)" , nativeQuery = true)
    List<AsRequest> findByUserId(@Param("userId") String userId);
}
