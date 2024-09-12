package com.lgdx.indiaCS.controller.process;

import com.lgdx.indiaCS.domain.AsRequest;
import com.lgdx.indiaCS.domain.Diagnose;
import com.lgdx.indiaCS.domain.Repair;
import com.lgdx.indiaCS.repository.AsRequestRepository;
import com.lgdx.indiaCS.service.ASService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;

@Controller
public class ProcessViewController {

    @Autowired
    ASService asService;

    @Autowired
    AsRequestRepository asRequestRepository;

    @GetMapping("/process")
    public String reviewComplete(HttpSession session, Model model) {

        System.out.println("프로세스 진입");
        //사전세팅
        model.addAttribute("date1", "");
        model.addAttribute("date2", "");
        model.addAttribute("date3", "");
        model.addAttribute("date4", "");
        model.addAttribute("date5", "");
        model.addAttribute("date6", "");
        model.addAttribute("diagnosisData", "");
        model.addAttribute("repairData", "");

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");

        // 세션에서 asRequestId 값을 가져옴
<<<<<<< HEAD
        String asRequestId = (String) session.getAttribute("asRequestId");
        String userId = (String)session.getAttribute("userId");
=======
        Object asRequestId = session.getAttribute("asRequestId");
        Object userId = session.getAttribute("userId");
>>>>>>> b2719bc5a49b7ce07b3f490b646504228bf94672

        if (asRequestId == null && userId == null) {
            return "redirect:/reservation-check";
        }

        if(userId != null) {
            System.out.println("userId로 체크");
            asRequestId = asRequestRepository.findByUserId(userId).get(0).getAsRequestId();
            session.setAttribute("asRequestId" , asRequestId);
            System.out.println("asRequestId = " + asRequestId );
        }

        AsRequest asRequest = asService.asRequestInfo(asRequestId);
        if(asRequest != null) {
            model.addAttribute("date1", formatter.format(asRequest.getAsRequestDate()));

            Diagnose diagnose = asService.diagnoseInfo(asRequest.getAsRequestId());
            if(diagnose != null) {
                model.addAttribute("date2", formatter.format(diagnose.getDiagnoseDate()));
                model.addAttribute("diagnosisData", diagnose.getDiagnoseContent());

                List<Repair> repairList = asService.repairInfo(diagnose.getDiagnoseId());
                int startIndex = 3;
                for(Repair repair : repairList) {
                    String key = "date" + startIndex;
                    model.addAttribute(key , formatter.format(repair.getRepairDate()));

                    if(startIndex == 3) {
                        model.addAttribute("repairData", repair.getRepairPartInventory());
                    }
                    startIndex++;
                }
            }
        }

        return "/process";
    }

}
