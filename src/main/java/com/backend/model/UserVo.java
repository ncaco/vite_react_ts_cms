package com.backend.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.io.Serializable;

@Entity
@Table(name = "TB_USER")
@Getter
@Setter
public class UserVo implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "USER_ID", length = 30, nullable = false)
    private String userId; // 사용자아이디

    @Column(name = "USER_PSWD", length = 100, nullable = false)
    private String userPswd; // 사용자비밀번호

    @Column(name = "USER_NM", length = 100, nullable = false)
    private String userNm; // 사용자명

    @Column(name = "AUTHRT_CD", length = 8, nullable = false)
    private String authrtCd; // AUTH0000

    @Column(name = "DEPT_CD", length = 10)
    private String deptCd; // 0010

    @Column(name = "EMP_NO", length = 20)
    private String empNo; // 직원번호

    @Column(name = "MBL_TELNO", length = 20)
    private String mblTelno; // 휴대폰번호

    @Column(name = "EML_ADDR", length = 320)
    private String emlAddr; // 이메일

    @Column(name = "USE_YN", length = 1, nullable = false)
    private String useYn; // Y:사용함, N:사용안함

    @Column(name = "MEMO_CN", length = 1000)
    private String memoCn; // 메모내용

    @Column(name = "APRV_IP_ADDR_LIST", length = 1000)
    private String aprvIpAddrList; // 승인IP주소목록

    @Column(name = "MNG_SITE_LIST", length = 1000)
    private String mngSiteList; // 관리사이트주소목록

    @Column(name = "RGTR_ID", length = 50, nullable = false)
    private String rgtrId; // 등록자아이디

    @Column(name = "REG_DT", nullable = false)
    private LocalDateTime regDt; // 등록일시

    @Column(name = "MDFR_ID", length = 50)
    private String mdfrId; // 수정자아이디

    @Column(name = "MDFCN_DT")
    private LocalDateTime mdfcnDt; // 수정일시

    @Column(name = "PUSH_TOKEN", length = 200)
    private String pushToken; // FCM 푸시 알림 토큰

    // OAuth2 관련 정보는 MEMO_CN 필드에 JSON 형태로 저장
    // 별도의 GoogleId 필드 대신 memoCn 사용
}
