package com.lgdx.indiaCS.controller.process;

import com.lgdx.indiaCS.domain.AsRequest;
import com.lgdx.indiaCS.domain.Diagnose;
import com.lgdx.indiaCS.service.ASService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class ProcessViewController {

    @Autowired
    ASService asService;

    @GetMapping("/process")
    public String reviewComplete(HttpSession session, Model model) {

        System.out.println("[입력받은 asRequestId in ProcessViewController]" + session.getAttribute("asRequestId"));

        // 세션에서 asRequestId 값을 가져옴
        Object asRequestId = session.getAttribute("asRequestId");

        // asRequestId가 null인지 확인
        if (asRequestId != null) {
            Optional<AsRequest>asRequestOptional = asService.asRequestInfo((String) asRequestId);
            if(asRequestOptional.isPresent()){
                AsRequest asRequest = asRequestOptional.get();
                model.addAttribute("date1",asRequest.getAsRequestDate());
                Optional<Diagnose>diagnoseOptional = asService.diagnoseInfo(asRequest.getAsRequestId());
                if(diagnoseOptional.isPresent()){
                    Diagnose diagnose = diagnoseOptional.get();
                    model.addAttribute("date2",diagnose.getDiagnoseDate());
                }
            }


        }
        else{

        }


        return "/process";
    }

}
