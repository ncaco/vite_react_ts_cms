package com.backend.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.backend.api.service.SessionService;
import com.backend.model.SessionVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.Optional;

import org.springframework.lang.NonNull;

@Component
public class SessionInterceptor implements HandlerInterceptor {
    
    private static final Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);
    
    @Autowired
    private SessionService sessionService;
    
    @Override
    public boolean preHandle(@NonNull HttpServletRequest request, @NonNull HttpServletResponse response, @NonNull Object handler) throws Exception {
        // 세션 정보 확인
        Optional<SessionVo> sessionOpt = sessionService.getCurrentSession();
        
        if (sessionOpt.isPresent()) {
            // 세션이 있으면 통과
            SessionVo session = sessionOpt.get();
            logger.debug("인증된 사용자 요청 [{}]: {}", session.getUserId(), request.getRequestURI());
            return true;
        } else {
            // 세션이 없으면 401 Unauthorized 응답
            logger.warn("인증되지 않은 요청: {}", request.getRequestURI());
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.setContentType("application/json");
            response.getWriter().write("{\"error\":\"세션이 없거나 만료되었습니다. 다시 로그인해주세요.\"}");
            return false;
        }
    }
} 