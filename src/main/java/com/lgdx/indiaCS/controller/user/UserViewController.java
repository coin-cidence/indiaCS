package com.lgdx.indiaCS.controller.user;

import com.lgdx.indiaCS.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
public class UserViewController {

    @Autowired
    UserService userService;

    @GetMapping("/reservation-check")
    public String reservationCheck() { return "/reservationCheck"; }

    @PostMapping("/reservation-check")
    public String checkReservation(@RequestParam("asRequestId") String asRequestId, Model model) {
        boolean find = userService.checkReservationNumber(asRequestId);

        if (find) {
            return "redirect:/process";  // 성공 시 다음 페이지로 리다이렉트
        } else {
            model.addAttribute("error", "Reservation number not found. Please try again.");
            return "/reservationCheck";  // 실패 시 같은 페이지로 이동하며 오류 메시지 표시
        }
    }

}
