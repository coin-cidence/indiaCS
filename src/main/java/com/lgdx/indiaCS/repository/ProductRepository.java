package com.lgdx.indiaCS.repository;

import com.lgdx.indiaCS.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product , String> {
}
