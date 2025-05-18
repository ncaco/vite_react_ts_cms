package com.backend.model;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SessionVo implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private String userId;       // 사용자 ID
    private String userNm;       // 사용자 이름
    private String authrtCd;     // 권한 코드
    private String deptCd;       // 부서 코드
    private String sessionId;    // 세션 ID
    private String clientIp;     // 클라이언트 IP
    private LocalDateTime loginDt;  // 로그인 시간
    private LocalDateTime lastAccessDt; // 마지막 접근 시간
    
    // 세션 유효성 확인 메서드
    public boolean isValid() {
        return userId != null && sessionId != null;
    }
} 