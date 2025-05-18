package com.backend.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.api.service.SessionService;
import com.backend.model.SessionVo;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/sample")
public class SampleApiController {
    
    @Autowired
    private SessionService sessionService;
    
    /**
     * 인증이 필요한 API 예제
     * 요청 시 세션 인터셉터가 먼저 세션 유효성을 검증
     */
    @GetMapping("/secure-data")
    public ResponseEntity<?> getSecureData() {
        // 세션이 있으면 세션 인터셉터에서 이미 검증되었으므로 여기까지 도달함
        Optional<SessionVo> sessionOpt = sessionService.getCurrentSession();
        
        Map<String, Object> response = new HashMap<>();
        sessionOpt.ifPresent(session -> {
            response.put("userId", session.getUserId());
            response.put("message", session.getUserNm() + "님을 위한 보안 데이터입니다.");
        });
        
        // 예제 데이터 추가
        response.put("secureData", "이 데이터는 인증된 사용자만 볼 수 있습니다.");
        
        return ResponseEntity.ok(response);
    }
} 