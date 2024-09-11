package com.lgdx.indiaCS.repository;

import com.lgdx.indiaCS.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, String> {

    @Query(value = "SELECT * FROM \"User\"" +
                   " WHERE USER_ID = :userId" +
                   " AND PASSWORD = :password" , nativeQuery = true)
    User login(@Param("userId") String userId , @Param("password") String password);

}
