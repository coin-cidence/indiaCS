package com.lgdx.indiaCS.repository;

import com.lgdx.indiaCS.domain.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ReviewRepository extends JpaRepository<Review , String> {

    Optional<Review> findByAsRequestId(String asRequestId);

}
