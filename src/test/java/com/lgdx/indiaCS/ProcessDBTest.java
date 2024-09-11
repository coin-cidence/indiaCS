package com.lgdx.indiaCS;

import com.lgdx.indiaCS.domain.Diagnose;
import com.lgdx.indiaCS.repository.DiagnoseRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
public class ProcessDBTest {

    @Autowired
    private DiagnoseRepository diagnoseRepository;

    @Test
    public void 진단내용불러오기() {

        // 특정 진단 ID로 조회
        Optional<Diagnose> diagnoseOptional = diagnoseRepository.findByAsDiagnoseId("diag001");

        // 결과가 존재하는지 확인
        assertNotNull(diagnoseOptional);

        // 결과가 존재하는 경우
        if (diagnoseOptional.isPresent()) {
            Diagnose diagnose = diagnoseOptional.get();
//            System.out.println(diagnose.toString()); // 행 전체 정보
            System.out.println(diagnose.getDiagnoseContent() + "(Date: " + diagnose.getDiagnoseDate() + ")"); //필요 정보만
        } else {
            System.out.println("진단 프로세스가 아직 진행되지 않았습니다.");
        }
    }

}
