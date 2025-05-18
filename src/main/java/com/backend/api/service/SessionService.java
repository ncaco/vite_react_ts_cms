package com.backend.api.service;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.backend.model.SessionVo;
import com.backend.model.UserVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class SessionService {
    
    // 세션에 저장되는 키 값
    private static final String SESSION_KEY = "SESSION_INFO";

    /**
     * 현재 요청의 HttpServletRequest 객체를 가져옵니다.
     * @return HttpServletRequest 객체
     */
    public HttpServletRequest getCurrentRequest() {
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        return attrs.getRequest();
    }
    
    /**
     * 현재 세션을 가져옵니다.
     * @param create 세션이 없을 경우 생성할지 여부
     * @return HttpSession 객체
     */
    public HttpSession getSession(boolean create) {
        return getCurrentRequest().getSession(create);
    }
    
    /**
     * 클라이언트 IP를 가져옵니다.
     * @return 클라이언트 IP 주소
     */
    public String getClientIp() {
        HttpServletRequest request = getCurrentRequest();
        String ip = request.getHeader("X-Forwarded-For");
        
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        
        return ip;
    }
    
    /**
     * 사용자 로그인 처리 및 세션 생성
     * @param user 로그인한 사용자 정보
     * @return 생성된 세션 정보
     */
    public SessionVo createSession(UserVo user) {
        HttpSession session = getSession(true);
        String sessionId = session.getId();
        
        SessionVo sessionVo = SessionVo.builder()
                .userId(user.getUserId())
                .userNm(user.getUserNm())
                .authrtCd(user.getAuthrtCd())
                .deptCd(user.getDeptCd())
                .sessionId(sessionId)
                .clientIp(getClientIp())
                .loginDt(LocalDateTime.now())
                .lastAccessDt(LocalDateTime.now())
                .build();
        
        // 세션에 정보 저장
        session.setAttribute(SESSION_KEY, sessionVo);
        
        return sessionVo;
    }
    
    /**
     * 현재 세션 정보 조회
     * @return 세션 정보 (없으면 빈 Optional 반환)
     */
    public Optional<SessionVo> getCurrentSession() {
        HttpSession session = getSession(false);
        if (session == null) {
            return Optional.empty();
        }
        
        SessionVo sessionVo = (SessionVo) session.getAttribute(SESSION_KEY);
        if (sessionVo == null) {
            return Optional.empty();
        }
        
        // 마지막 접근 시간 업데이트
        sessionVo.setLastAccessDt(LocalDateTime.now());
        session.setAttribute(SESSION_KEY, sessionVo);
        
        return Optional.of(sessionVo);
    }
    
    /**
     * 세션 파기 (로그아웃)
     */
    public void invalidateSession() {
        HttpSession session = getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
} 