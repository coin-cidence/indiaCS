package com.lgdx.indiaCS.controller.process;

import com.lgdx.indiaCS.domain.AsRequest;
import com.lgdx.indiaCS.domain.Diagnose;
import com.lgdx.indiaCS.domain.Repair;
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

    @GetMapping("/process")
    public String reviewComplete(HttpSession session, Model model) {

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//        System.out.println("[입력받은 asRequestId in ProcessViewController]" + session.getAttribute("asRequestId"));

        // 세션에서 asRequestId 값을 가져옴
        Object asRequestId = session.getAttribute("asRequestId");

        // asRequestId가 null인지 확인
        if (asRequestId != null) {
            Optional<AsRequest>asRequestOptional = asService.asRequestInfo((String) asRequestId);
            if(asRequestOptional.isPresent()){
                AsRequest asRequest = asRequestOptional.get();
                model.addAttribute("date1",formatter.format(asRequest.getAsRequestDate()));
                Optional<Diagnose>diagnoseOptional = asService.diagnoseInfo(asRequest.getAsRequestId());
                if(diagnoseOptional.isPresent()){
                    Diagnose diagnose = diagnoseOptional.get();
                    model.addAttribute("date2",formatter.format(diagnose.getDiagnoseDate()));
                    model.addAttribute("diagnosisData",diagnose.getDiagnoseContent());
                    List<Repair> repairList = asService.repairInfo(diagnose.getDiagnoseId());
                    try{
                        Repair repairState1 = repairList.get(0);
                        model.addAttribute("date3",formatter.format(repairState1.getRepairDate()));
                        model.addAttribute("repairData",repairState1.getRepairPartInventory());
                    }catch(Exception e){
                        model.addAttribute("date3","");
                        model.addAttribute("RepairData","");
                    }
                    try{
                        Repair repairState2 = repairList.get(1);
                        model.addAttribute("date4",formatter.format(repairState2.getRepairDate()));
                    }catch(Exception e){
                        model.addAttribute("date4","");
                    }
                    try{
                        Repair repairState3 = repairList.get(2);
                        model.addAttribute("date5",formatter.format(repairState3.getRepairDate()));
                    }catch(Exception e){
                        model.addAttribute("date5","");
                    }
                    try{
                        Repair repairState4 = repairList.get(3);
                        model.addAttribute("date6",formatter.format(repairState4.getRepairDate()));
                    }catch(Exception e){
                        model.addAttribute("date6","");
                    }
                }else {
                    model.addAttribute("date2","");
                    model.addAttribute("diagnosisData","");
                }
            }else {
                model.addAttribute("date1","");
            }
        }
        return "/process";
    }
    }
