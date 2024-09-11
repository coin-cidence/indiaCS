package com.lgdx.indiaCS.controller.user;

import com.lgdx.indiaCS.domain.User;
import com.lgdx.indiaCS.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
public class UserDataController {



//    @GetMapping("/checkUserId")
//    public boolean checkUserId(@RequestParam("userId") String userId) {
//        System.out.println("사용자 중복 확인 요청 ID : " + userId);
//
//        User user = userService.loginCheck(userId);
//
//        if (user != null) {
//            return true;
//        } else {
//            return false;
//        }
//    }


}
