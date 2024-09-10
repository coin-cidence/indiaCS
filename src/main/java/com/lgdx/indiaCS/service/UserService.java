package com.lgdx.indiaCS.service;

import com.lgdx.indiaCS.domain.User;
import com.lgdx.indiaCS.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    public User login(String userId, String password) {
        User user = userRepository.login(userId, password);
        return user;
    }

    public User join(User user) throws RuntimeException {

        if(user.getUserId().length() > 11) {
            throw new RuntimeException("사용자 ID는 최대 10자리입니다.");
        }

        if(user.getPassword().length() > 11) {
            throw new RuntimeException("비밀번호는 최대 10자리입니다.");
        }

        User joiningUser = userRepository.save(user);
        return joiningUser;
    }

    public User loginCheck(String userId) {
        Optional<User> joinedUser = userRepository.findById(userId);
        return joinedUser.orElse(null);
    }

}
