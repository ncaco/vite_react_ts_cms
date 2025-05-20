package com.backend.api.service;

import org.springframework.stereotype.Service;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;

import com.backend.model.UserVo;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 사용자 관련 서비스
 */
@Service
public class UserService {
    
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    
    private ObjectMapper objectMapper = new ObjectMapper();
    
    /**
     * 사용자 ID와 비밀번호로 사용자 조회
     * 
     * @param userId 사용자 ID
     * @param password 비밀번호
     * @return 사용자 정보
     */
    public Optional<UserVo> getUserByIdAndPassword(String userId, String password) {
        // TODO: DB에서 사용자 정보 조회 구현
        // 여기서는 테스트용으로 하드코딩
        if ("admin@example.com".equals(userId) && "admin123".equals(password)) {
            UserVo user = new UserVo();
            user.setUserId(userId);
            user.setUserPswd(passwordEncoder.encode(password));
            user.setUserNm("관리자");
            user.setAuthrtCd("AUTH0001");
            user.setDeptCd("0010");
            user.setUseYn("Y");
            user.setEmlAddr(userId);
            return Optional.of(user);
        }
        
        if ("user@example.com".equals(userId) && "user123".equals(password)) {
            UserVo user = new UserVo();
            user.setUserId(userId);
            user.setUserPswd(passwordEncoder.encode(password));
            user.setUserNm("일반 사용자");
            user.setAuthrtCd("AUTH0002");
            user.setDeptCd("0020");
            user.setUseYn("Y");
            user.setEmlAddr(userId);
            return Optional.of(user);
        }
        
        return Optional.empty();
    }
    
    /**
     * 이메일로 사용자 조회
     * 
     * @param email 이메일 (사용자 ID)
     * @return 사용자 정보
     */
    public Optional<UserVo> getUserByEmail(String email) {
        // TODO: DB에서 사용자 정보 조회 구현
        // 여기서는 테스트용으로 하드코딩
        if ("admin@example.com".equals(email)) {
            UserVo user = new UserVo();
            user.setUserId(email);
            user.setUserPswd(passwordEncoder.encode("admin123"));
            user.setUserNm("관리자");
            user.setAuthrtCd("AUTH0001");
            user.setDeptCd("0010");
            user.setUseYn("Y");
            user.setEmlAddr(email);
            return Optional.of(user);
        }
        
        if ("user@example.com".equals(email)) {
            UserVo user = new UserVo();
            user.setUserId(email);
            user.setUserPswd(passwordEncoder.encode("user123"));
            user.setUserNm("일반 사용자");
            user.setAuthrtCd("AUTH0002");
            user.setDeptCd("0020");
            user.setUseYn("Y");
            user.setEmlAddr(email);
            return Optional.of(user);
        }
        
        return Optional.empty();
    }
    
    /**
     * 구글 ID로 사용자 조회
     * 
     * @param googleId 구글 ID
     * @return 사용자 정보
     */
    public Optional<UserVo> getUserByGoogleId(String googleId) {
        // TODO: DB에서 사용자 정보 조회 구현
        // 여기서는 테스트용으로 빈 Optional 반환
        return Optional.empty();
    }
    
    /**
     * 새 사용자 생성
     * 
     * @param user 사용자 정보
     * @return 생성된 사용자 정보
     */
    public UserVo createUser(UserVo user) {
        // TODO: DB에 사용자 정보 저장 구현
        // 여기서는 테스트용으로 단순 반환
        
        // 비밀번호가 있는 경우 암호화
        if (user.getUserPswd() != null && !user.getUserPswd().isEmpty()) {
            user.setUserPswd(passwordEncoder.encode(user.getUserPswd()));
        }
        
        return user;
    }
    
    /**
     * 사용자 정보 업데이트
     * 
     * @param user 업데이트할 사용자 정보
     * @return 업데이트된 사용자 정보
     */
    public UserVo updateUser(UserVo user) {
        // TODO: DB에 사용자 정보 업데이트 구현
        // 여기서는 테스트용으로 단순 반환
        
        // 비밀번호가 있는 경우 암호화
        if (user.getUserPswd() != null && !user.getUserPswd().isEmpty()) {
            user.setUserPswd(passwordEncoder.encode(user.getUserPswd()));
        }
        
        return user;
    }
    
    /**
     * 사용자 정보에서 구글 ID 가져오기
     * 
     * @param user 사용자 정보
     * @return 구글 ID 또는 null
     */
    public String getGoogleIdFromUser(UserVo user) {
        if (user.getMemoCn() != null && !user.getMemoCn().isEmpty()) {
            try {
                Map<String, Object> json = objectMapper.readValue(user.getMemoCn(), Map.class);
                if (json.containsKey("googleId")) {
                    return (String) json.get("googleId");
                }
            } catch (Exception e) {
                // JSON 파싱 오류 무시
            }
        }
        return null;
    }
    
    /**
     * 사용자 정보에 구글 ID 설정
     * 
     * @param user 사용자 정보
     * @param googleId 구글 ID
     */
    public void setGoogleIdToUser(UserVo user, String googleId) {
        Map<String, Object> json = new HashMap<>();
        
        // 기존 메모가 있으면 파싱 시도
        if (user.getMemoCn() != null && !user.getMemoCn().isEmpty()) {
            try {
                json = objectMapper.readValue(user.getMemoCn(), Map.class);
            } catch (Exception e) {
                // JSON 파싱 오류 시 새로운 JSON 객체 사용
            }
        }
        
        // 구글 ID 설정
        json.put("googleId", googleId);
        try {
            user.setMemoCn(objectMapper.writeValueAsString(json));
        } catch (Exception e) {
            // JSON 변환 오류 시 간단한 문자열로 저장
            user.setMemoCn("{\"googleId\":\"" + googleId + "\"}");
        }
    }
} 