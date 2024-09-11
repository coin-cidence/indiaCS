package com.lgdx.indiaCS.service;

import com.lgdx.indiaCS.domain.User;
import com.lgdx.indiaCS.repository.AsRequestRepository;
import com.lgdx.indiaCS.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    AsRequestRepository asRequestRepository;

    public boolean checkReservationNumber(String asRequestId) {
        // Optional을 사용해 실제 데이터가 존재하는지 확인
        return asRequestRepository.findByAsRequestId(asRequestId).isPresent();
    }

    public User login(String userId, String password) {
        User user = userRepository.login(userId, password);
        return user;
    }

    public User loginCheck(String userId) {
        Optional<User> joinedUser = userRepository.findById(userId);
        return joinedUser.orElse(null);
    }

}
