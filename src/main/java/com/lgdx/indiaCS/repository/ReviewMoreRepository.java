package com.lgdx.indiaCS.repository;

import com.lgdx.indiaCS.domain.ReviewMore;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ReviewMoreRepository extends JpaRepository<ReviewMore, String> {

    @Query("SELECT r FROM ReviewMore r WHERE r.asRequestId = :asRequestId")

    Optional<ReviewMore> findByAsRequestId(@Param("asRequestId") String asRequestId);

}
