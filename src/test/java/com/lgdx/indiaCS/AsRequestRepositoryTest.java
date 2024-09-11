package com.lgdx.indiaCS;

import com.lgdx.indiaCS.domain.AsRequest;
import com.lgdx.indiaCS.repository.AsRequestRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

@SpringBootTest
public class AsRequestRepositoryTest {

    AsRequestRepository asRequestRepository;

    @Autowired
    public AsRequestRepositoryTest( AsRequestRepository asRequestRepository ) { this.asRequestRepository = asRequestRepository; }

    @Test
    public void 접수번호조회_테스트() {
        String asRequestId = "asr001";
        Optional<AsRequest> findRequestId = asRequestRepository.findByAsRequestId(asRequestId);
        System.out.println(findRequestId.orElse(null));
    }

}
