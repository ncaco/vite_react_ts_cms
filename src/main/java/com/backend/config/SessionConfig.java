package com.backend.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.request.RequestContextListener;

import jakarta.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Configuration
public class SessionConfig {

    private static final Logger LOGGER = LoggerFactory.getLogger(SessionConfig.class);

    // 세션 설정 (기본 세션 사용)
    @Bean
    public HttpSessionListener httpSessionListener() {
        return new HttpSessionListener() {
            @Override
            public void sessionCreated(jakarta.servlet.http.HttpSessionEvent se) {
                // 세션 타임아웃 30분 (1800초)
                se.getSession().setMaxInactiveInterval(1800);
            }

            @Override
            public void sessionDestroyed(jakarta.servlet.http.HttpSessionEvent se) {
                // 세션 만료 시 처리할 로직
                LOGGER.info("Session destroyed for user: {}", se.getSession().getAttribute("sn"));
            }
        };
    }
    
    // 요청 컨텍스트 리스너 등록
    @Bean
    public RequestContextListener requestContextListener() {
        return new RequestContextListener();
    }
} 