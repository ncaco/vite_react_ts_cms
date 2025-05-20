package com.backend.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.backend.api.service.SessionService;
import com.backend.api.service.UserService;
import com.backend.model.SessionVo;
import com.backend.model.UserVo;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/api/session")
public class SessionController {
    
    private static final Logger logger = LoggerFactory.getLogger(SessionController.class);
    
    @Autowired
    private SessionService sessionService;
    
    @Autowired
    private UserService userService;
    
    /**
     * 임시 사용자 생성 메서드 (실제로는 DB에서 사용자 정보를 가져와야 함)
     * 테스트 용도로만 사용
     */
    private UserVo createTestUser(String userId, String password) {
        // 실제 환경에서는 이렇게 하지 말고 DB 조회 결과를 반환해야 함
        UserVo user = new UserVo();
        user.setUserId(userId);
        user.setUserPswd(password); // 실제로는 암호화된 비밀번호를 저장해야 함
        user.setUserNm("테스트 사용자");
        user.setAuthrtCd("AUTH0001");
        user.setDeptCd("0010");
        user.setUseYn("Y");
        return user;
    }
    
    /**
     * 로그인 처리 및 세션 생성
     */
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Map<String, String> loginRequest) {
        try {
            String userId = loginRequest.get("userId");
            String password = loginRequest.get("password");
            
            if (userId == null || password == null) {
                return ResponseEntity.badRequest().body("사용자 ID와 비밀번호를 모두 입력해주세요.");
            }
            
            logger.info("로그인 시도: {}", userId);
            
            // 실제 DB에서 사용자 정보를 조회하여 인증
            Optional<UserVo> userOpt = userService.getUserByIdAndPassword(userId, password);
            
            if (!userOpt.isPresent()) {
                logger.warn("로그인 실패: 아이디 또는 비밀번호 불일치 - {}", userId);
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("아이디 또는 비밀번호가 일치하지 않습니다.");
            }
            
            UserVo user = userOpt.get();
            
            // 비활성화된 사용자 체크
            if (!"Y".equals(user.getUseYn())) {
                logger.warn("로그인 실패: 비활성화된 계정 - {}", userId);
                return ResponseEntity.status(HttpStatus.FORBIDDEN).body("비활성화된 계정입니다. 관리자에게 문의하세요.");
            }
            
            // 세션 생성
            SessionVo sessionVo = sessionService.createSession(user);
            
            // 응답에 민감한 정보를 제외하고 필요한 정보만 담아서 반환
            Map<String, Object> response = new HashMap<>();
            response.put("userId", sessionVo.getUserId());
            response.put("userNm", sessionVo.getUserNm());
            response.put("authrtCd", sessionVo.getAuthrtCd());
            response.put("loginDt", sessionVo.getLoginDt());
            
            logger.info("로그인 성공: {}", userId);
            return ResponseEntity.ok(response);
            
        } catch (Exception e) {
            logger.error("로그인 처리 중 오류 발생", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("로그인 처리 중 오류가 발생했습니다.");
        }
    }
    
    /**
     * 현재 세션 정보 조회
     */
    @GetMapping("/info")
    public ResponseEntity<?> getSessionInfo() {
        Optional<SessionVo> sessionOpt = sessionService.getCurrentSession();
        
        if (sessionOpt.isPresent()) {
            SessionVo session = sessionOpt.get();
            // 응답에 민감한 정보를 제외하고 필요한 정보만 담아서 반환
            Map<String, Object> response = new HashMap<>();
            response.put("userId", session.getUserId());
            response.put("userNm", session.getUserNm());
            response.put("authrtCd", session.getAuthrtCd());
            response.put("loginDt", session.getLoginDt());
            response.put("lastAccessDt", session.getLastAccessDt());
            
            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("세션이 없거나 만료되었습니다.");
        }
    }
    
    /**
     * 로그아웃 처리
     */
    @PostMapping("/logout")
    public ResponseEntity<?> logout() {
        sessionService.invalidateSession();
        logger.info("로그아웃 처리 완료");
        return ResponseEntity.ok("로그아웃 되었습니다.");
    }
} 