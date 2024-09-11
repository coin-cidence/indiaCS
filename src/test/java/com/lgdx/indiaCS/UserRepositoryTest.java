package com.lgdx.indiaCS;

import com.lgdx.indiaCS.domain.User;
import com.lgdx.indiaCS.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

@SpringBootTest
public class UserRepositoryTest {

    UserRepository userRepository;

    @Autowired
    public UserRepositoryTest ( UserRepository userRepository ) { this.userRepository = userRepository; }

    @Test
    public void 로그인조회_테스트() {
        String userId = "user001";
        String password = "pass001";
        User user = userRepository.login(userId, password);
        System.out.println(user);
    }
}
