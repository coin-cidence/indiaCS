package com.lgdx.indiaCS.controller.main;

import com.lgdx.indiaCS.domain.user.User;
import com.lgdx.indiaCS.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeViewController {

    @Autowired
    UserService userService;

    @GetMapping("/")
    public String goLogin() {
        return "/login";
    }

    @GetMapping("/login")
    public String login() {
        return "/home";
    }

    @GetMapping("/register")
    public String register() {
        return "/register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute User user, Model model) {

        try {
            userService.join(user);
        } catch (RuntimeException e) {
            model.addAttribute("error", "회원가입 실패!!");
            return "/register";
        }

        User joiningUser = userService.join(user);

        if(joiningUser != null) {
            return "/login";
        } else {
            model.addAttribute("error", "회원가입 실패!!");
            return "/register";
        }
    }

    @PostMapping("/login-process")
    public String loginProcess(@RequestParam("userId") String userId,
                               @RequestParam("password") String password,
                               Model model) {
        User user = userService.login(userId, password);

        if(user != null) {
            model.addAttribute("username", user.getName());
            return "/home";
        } else {
            model.addAttribute("error", "로그인 실패! 다시 해보세요!");
            return "/login";
        }
    }

}
