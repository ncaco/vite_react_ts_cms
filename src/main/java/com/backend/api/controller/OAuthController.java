package com.backend.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.client.RestTemplate;

import com.backend.api.service.SessionService;
import com.backend.api.service.UserService;
import com.backend.model.SessionVo;
import com.backend.model.UserVo;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * OAuth 인증 관련 컨트롤러
 */
@Controller
@RequestMapping("/api/oauth")
public class OAuthController {
    
    private static final Logger logger = LoggerFactory.getLogger(OAuthController.class);
    
    @Autowired
    private SessionService sessionService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private RestTemplate restTemplate;
    
    @Value("${oauth2.google.client.id}")
    private String googleClientId;
    
    @Value("${oauth2.google.client.secret}")
    private String googleClientSecret;
    
    @Value("${oauth2.google.redirect.uri}")
    private String googleRedirectUri;
    
    @Value("${frontend.base.url:http://localhost:8080}")
    private String frontendBaseUrl;
    
    /**
     * 구글 로그인을 위한 리다이렉트 URL 생성
     */
    @GetMapping("/google/url")
    public ResponseEntity<?> getGoogleAuthUrl() {
        String googleAuthUrl = "https://accounts.google.com/o/oauth2/v2/auth";
        String scope = "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile";
        
        String authUrl = googleAuthUrl + "?client_id=" + googleClientId
                + "&redirect_uri=" + googleRedirectUri
                + "&response_type=code"
                + "&scope=" + scope;
        
        Map<String, Object> response = new HashMap<>();
        response.put("authUrl", authUrl);
        
        return ResponseEntity.ok(response);
    }
    
    /**
     * 구글 로그인 콜백 처리 - 브라우저에서 직접 접근하는 엔드포인트
     */
    @GetMapping("/google/callback")
    public RedirectView googleCallback(@RequestParam("code") String code) {
        try {
            // 액세스 토큰 받기
            String tokenUrl = "https://oauth2.googleapis.com/token";
            Map<String, String> tokenRequest = new HashMap<>();
            tokenRequest.put("code", code);
            tokenRequest.put("client_id", googleClientId);
            tokenRequest.put("client_secret", googleClientSecret);
            tokenRequest.put("redirect_uri", googleRedirectUri);
            tokenRequest.put("grant_type", "authorization_code");
            
            Map<String, String> tokenResponse = restTemplate.postForObject(tokenUrl, tokenRequest, Map.class);
            String accessToken = tokenResponse.get("access_token");
            
            // 사용자 정보 받기
            String userInfoUrl = "https://www.googleapis.com/oauth2/v2/userinfo";
            Map<String, Object> userInfo = restTemplate.getForObject(userInfoUrl + "?access_token=" + accessToken, Map.class);
            
            String email = (String) userInfo.get("email");
            String name = (String) userInfo.get("name");
            String googleId = (String) userInfo.get("id");
            
            // 해당 이메일의 사용자가 있는지 확인, 없으면 생성
            Optional<UserVo> userOpt = userService.getUserByEmail(email);
            UserVo user;
            
            if (!userOpt.isPresent()) {
                // 신규 사용자 생성
                user = new UserVo();
                user.setUserId(email);
                user.setUserNm(name);
                user.setAuthrtCd("AUTH0001"); // 기본 권한
                user.setDeptCd("0010"); // 기본 부서
                user.setUseYn("Y");
                user.setEmlAddr(email);
                
                // 구글 ID 설정
                userService.setGoogleIdToUser(user, googleId);
                
                user = userService.createUser(user);
            } else {
                user = userOpt.get();
                // 구글 ID 업데이트
                String savedGoogleId = userService.getGoogleIdFromUser(user);
                if (savedGoogleId == null || !savedGoogleId.equals(googleId)) {
                    userService.setGoogleIdToUser(user, googleId);
                    user = userService.updateUser(user);
                }
            }
            
            // 세션 생성
            sessionService.createSession(user);
            
            logger.info("구글 로그인 성공: {}", email);
            
            // 프론트엔드 메인 페이지로 리다이렉트
            return new RedirectView(frontendBaseUrl + "/home/main");
            
        } catch (Exception e) {
            logger.error("구글 로그인 처리 중 오류 발생", e);
            // 오류 발생 시 로그인 페이지로 리다이렉트
            return new RedirectView(frontendBaseUrl + "/home/login?error=auth_failed");
        }
    }
} 