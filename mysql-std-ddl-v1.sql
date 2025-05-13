-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 211.57.201.78    Database: wcon_lite
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.36-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `TB_AUTHRT`
--

DROP TABLE IF EXISTS `TB_AUTHRT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_AUTHRT` (
  `AUTHRT_CD` char(8) NOT NULL COMMENT 'AUTH0000',
  `AUTHRT_NM` varchar(100) NOT NULL COMMENT '시스템권한명',
  `AUTHRT_LVL` char(1) DEFAULT NULL COMMENT '권한레벨\r\n1 LVL 웹콘시스템 관리자\r\n2 LVL 사이트시스템 관리자\r\n3 LVL 일반사용자\r\n4 LVL 회원/비회원',
  `MEMO_CN` varchar(1000) DEFAULT NULL COMMENT '메모내용',
  `USE_YN` char(1) DEFAULT NULL COMMENT '사용여부',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`AUTHRT_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹콘권한';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_AUTHRT`
--


--
-- Table structure for table `TB_AUTHRT_ROLE`
--

DROP TABLE IF EXISTS `TB_AUTHRT_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_AUTHRT_ROLE` (
  `AUTHRT_CD` char(8) NOT NULL COMMENT 'AUTH0000',
  `MENU_SN` int(11) NOT NULL COMMENT '0...',
  `INQ_YN` char(1) NOT NULL COMMENT 'Y:허용,N:허용안함',
  `WRT_YN` char(1) NOT NULL COMMENT 'Y:허용,N:허용안함',
  `MDFCN_YN` char(1) NOT NULL COMMENT 'Y:허용,N:허용안함',
  `DEL_YN` char(1) NOT NULL COMMENT 'Y:허용,N:허용안함',
  `OTPT_YN` char(1) NOT NULL COMMENT 'Y:허용,N:허용안함',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`AUTHRT_CD`,`MENU_SN`),
  KEY `MENU_SEQ` (`MENU_SN`) USING BTREE,
  CONSTRAINT `TB_SYS_AUTH_ROLE_ibfk_1` FOREIGN KEY (`AUTHRT_CD`) REFERENCES `TB_AUTHRT` (`AUTHRT_CD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SYS_AUTH_ROLE_ibfk_2` FOREIGN KEY (`MENU_SN`) REFERENCES `TB_MENU` (`MENU_SN`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹콘권한역할';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_AUTHRT_ROLE`
--


--
-- Table structure for table `TB_BANNER`
--

DROP TABLE IF EXISTS `TB_BANNER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_BANNER` (
  `BANNER_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '배너일련번호',
  `SITE_ID` varchar(30) NOT NULL DEFAULT 'SITE000001' COMMENT '사이트아이디',
  `TTL` varchar(200) NOT NULL COMMENT '제목',
  `LNKG_SE_CD` varchar(30) NOT NULL COMMENT '링크구분코드(공통코드:U005 / C001:현재창 / C002:새창 / C003:링크없음 / C004:이미지맵)',
  `LNKG_URL` varchar(200) DEFAULT NULL COMMENT '링크URL',
  `SORT_SN` int(10) unsigned NOT NULL COMMENT '0:메인\r\n1~00',
  `BGNG_DT` date NOT NULL COMMENT '시작일시',
  `END_DT` date NOT NULL COMMENT '종료일시',
  `BANNER_PSTN_SE` char(4) DEFAULT NULL COMMENT '0010 : 메뉴\r\n0020 : 상단',
  `USE_YN` char(1) NOT NULL COMMENT 'Y:사용함, N:사용안함',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  `PRGRM_FILE_ID` char(15) DEFAULT NULL COMMENT 'FILE00000000001',
  PRIMARY KEY (`BANNER_SN`),
  KEY `SITE_ID` (`SITE_ID`) USING BTREE,
  CONSTRAINT `TB_BANNER_ibfk_2` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='웹콘배너';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_BANNER`
--


--
-- Table structure for table `TB_BBS_INFO`
--

DROP TABLE IF EXISTS `TB_BBS_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_BBS_INFO` (
  `BBS_ID` char(7) NOT NULL COMMENT '게시판아이디',
  `SITE_ID` varchar(30) NOT NULL DEFAULT 'SITE000001' COMMENT '사이트아이디',
  `BBS_TYPE_SN` int(10) unsigned DEFAULT NULL COMMENT '게시판유형일련번호',
  `BBS_NM` varchar(50) NOT NULL COMMENT '게시판명',
  `BBS_GROUP_CD` char(4) DEFAULT NULL COMMENT '0010:시스템\r\n0020:조합',
  `BBS_SKIN_NM` varchar(50) DEFAULT NULL COMMENT '게시판스킨명',
  `BBS_TBL_NM` char(16) DEFAULT NULL COMMENT '게시판테이블',
  `NTC_AUTHRT` varchar(1000) DEFAULT NULL COMMENT '공지권한',
  `ANON_AUTHRT` varchar(1000) DEFAULT NULL COMMENT '익명 권한',
  `SCRTP_INQ_AUTHRT` varchar(1000) DEFAULT NULL COMMENT '비밀글 조회 권한',
  `ANS_AUTHRT` varchar(1000) DEFAULT NULL COMMENT '답변권한',
  `RPLPST_AUTHRT` varchar(1000) DEFAULT NULL COMMENT '답글권한',
  `CMNT_AUTHRT` varchar(1000) DEFAULT NULL COMMENT '댓글권한',
  `INQ_YN_PRSL_AUTHRT` varchar(1000) DEFAULT NULL COMMENT '읽음여부 열람권한',
  `OTPPL_PST_MNG_AUTHRT` varchar(1000) DEFAULT NULL COMMENT '타인게시물 관리권한',
  `NTC_USE_YN` char(1) DEFAULT NULL COMMENT '공지사용여부',
  `ANON_USE_YN` char(1) DEFAULT NULL COMMENT '익명사용여부(Y, N)',
  `SCRTP_USE_YN` char(1) DEFAULT NULL COMMENT 'Y:비밀글,N:공개글',
  `ANS_USE_YN` char(1) DEFAULT NULL COMMENT '답변 사용여부',
  `RPLPST_USE_YN` char(1) DEFAULT NULL COMMENT '답글 사용여부',
  `CMNT_USE_YN` char(1) DEFAULT NULL COMMENT '댓글 사용여부',
  `INQ_USE_YN` char(1) DEFAULT NULL COMMENT '읽음여부 사용여부',
  `OTPPL_PST_USE_YN` char(1) DEFAULT NULL COMMENT '타인게시물사용여부',
  `NCKNM_USE_YN` char(1) DEFAULT NULL COMMENT '닉네임 사용여부',
  `INQ_CNT_USE_YN` char(1) DEFAULT NULL COMMENT '조회수 사용여부(Y,N)',
  `LIKE_USE_YN` char(1) DEFAULT NULL COMMENT '좋아요 사용여부(Y,N)',
  `EDITOR_USE_YN` char(1) DEFAULT NULL COMMENT 'Y:편집기사용 ,N:텍스트에어리어사용',
  `FILE_CNT` tinyint(2) unsigned DEFAULT NULL COMMENT '파일업로드가능수',
  `FILE_SZ` int(10) unsigned DEFAULT NULL COMMENT '파일크기',
  `PRMSN_FILE_EXTN_NM` varchar(200) DEFAULT NULL COMMENT '허용파일확장자명',
  `NEWICON_NODAYS` tinyint(3) unsigned DEFAULT NULL COMMENT '뉴아이콘노출날짜 1:하루노출,2: 이틀노출',
  `ARTCLS` varchar(200) DEFAULT NULL COMMENT '항목들',
  `ROW_CNT` mediumint(8) unsigned DEFAULT NULL COMMENT '페이징목록',
  `PAGE_CNT` mediumint(8) unsigned DEFAULT NULL COMMENT '화면당 게시물 노출수',
  `TOP_HTML` mediumtext DEFAULT NULL COMMENT '상단HTML',
  `BOTTOM_HTML` mediumtext DEFAULT NULL COMMENT '하단HTML',
  `FORM_HTML` mediumtext DEFAULT NULL COMMENT '양식HTML',
  `SORT_USE_YN` char(1) DEFAULT NULL COMMENT '정렬사용여부',
  `SORT_CRTR_SE_CD` char(4) DEFAULT NULL COMMENT '정렬기준구분코드(U020 / C001 : 등록일 / C002 : 조회수)',
  `SORT_MTHD_SE_CD` char(4) DEFAULT NULL COMMENT '정렬방법구분코드 (U021 / C001 : 내림차순 / C002 : 오름차순)',
  `HTAG_USE_YN` char(1) DEFAULT NULL COMMENT '해시태그사용여부',
  `PSTG_PRD_USE_YN` char(1) DEFAULT NULL COMMENT '게시기간사용여부',
  `BFR_NXT_USE_YN` char(1) DEFAULT NULL COMMENT '이전다음사용여부',
  `CPRT_PRTCN_SE_CD` char(4) DEFAULT NULL COMMENT '저작권보호구분코드 \r\n저작권보호구분코드 / U017	\r\n모두사용	C000\r\nCCL	C001\r\n공공누리	C002\r\n사용안함	C003',
  `PRVC_CLCT_USE_YN` char(1) DEFAULT NULL COMMENT '개인정보수집사용여부',
  `PRVC_CLCT_CN` text DEFAULT NULL COMMENT '개인정보수집내용',
  `RGTR_ID` varchar(50) DEFAULT NULL COMMENT '등록자아이디',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`BBS_ID`),
  KEY `BBS_TYPE_SN` (`BBS_TYPE_SN`),
  KEY `SITE_ID` (`SITE_ID`),
  CONSTRAINT `TB_BBS_INFO_ibfk_1` FOREIGN KEY (`BBS_TYPE_SN`) REFERENCES `TB_BBS_TYPE` (`BBS_TYPE_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_BBS_INFO_ibfk_2` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_BBS_INFO_ibfk_3` FOREIGN KEY (`BBS_TYPE_SN`) REFERENCES `TB_BBS_TYPE` (`BBS_TYPE_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_BBS_INFO_ibfk_4` FOREIGN KEY (`BBS_TYPE_SN`) REFERENCES `TB_BBS_TYPE` (`BBS_TYPE_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_BBS_INFO_ibfk_5` FOREIGN KEY (`BBS_TYPE_SN`) REFERENCES `TB_BBS_TYPE` (`BBS_TYPE_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_BBS_INFO_ibfk_6` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹콘게시판정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_BBS_INFO`
--


--
-- Table structure for table `TB_BBS_TYPE`
--

DROP TABLE IF EXISTS `TB_BBS_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_BBS_TYPE` (
  `BBS_TYPE_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '게시판유형일련번호',
  `BBS_TYPE_NM` varchar(100) NOT NULL COMMENT '게시판유형명',
  `BBS_TYPE_PATH` varchar(100) NOT NULL COMMENT '게시판유형경로',
  `USE_YN` char(1) DEFAULT NULL COMMENT 'Y:사용함, N:사용안함',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`BBS_TYPE_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='웹콘게시판유형';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_BBS_TYPE`
--


--
-- Table structure for table `TB_BMK`
--

DROP TABLE IF EXISTS `TB_BMK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_BMK` (
  `BMK_SN` int(11) NOT NULL AUTO_INCREMENT COMMENT '즐겨찾기 일련번호',
  `SITE_ID` varchar(30) NOT NULL DEFAULT 'SITE000001' COMMENT '사이트아이디',
  `BMK_SE_CD` char(4) DEFAULT NULL COMMENT '즐겨찾기구분코드',
  `MENU_SN` int(11) DEFAULT NULL COMMENT '메뉴일련번호',
  `BBS_ID` char(7) DEFAULT NULL COMMENT '게시판아이디',
  `RGTR_ID` varchar(50) DEFAULT NULL COMMENT '등록자아이디',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  PRIMARY KEY (`BMK_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='웹콘 즐겨찾기';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_BMK`
--


--
-- Table structure for table `TB_CMM_CD`
--

DROP TABLE IF EXISTS `TB_CMM_CD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_CMM_CD` (
  `UP_CMM_CD` char(4) NOT NULL COMMENT '상위공통코드',
  `CMM_CD` char(4) NOT NULL COMMENT '시스템코드',
  `CMM_CD_NM` varchar(50) NOT NULL COMMENT '시스템코드명',
  `SORT_SN` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '0:메인\r\n1~00',
  `USE_YN` char(1) NOT NULL DEFAULT 'Y' COMMENT 'Y:사용함, N:사용안함',
  `ABBR_NM` varchar(300) DEFAULT NULL COMMENT '약어명',
  `USE_BGNG_YMD` char(8) DEFAULT NULL COMMENT '사용시작일시',
  `USE_END_YMD` char(8) DEFAULT NULL COMMENT '사용종료일시',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`UP_CMM_CD`,`CMM_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹콘공통코드';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_CMM_CD`
--


--
-- Table structure for table `TB_CNTN_LOG`
--

DROP TABLE IF EXISTS `TB_CNTN_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_CNTN_LOG` (
  `LOG_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '로그일련번호',
  `SITE_ID` varchar(30) NOT NULL DEFAULT 'SITE000001' COMMENT '사이트아이디',
  `EXCN_DT` datetime NOT NULL COMMENT '실행시간',
  `CNTN_ID` varchar(50) NOT NULL COMMENT '접속아이디',
  `CNTN_SE_CD` char(1) NOT NULL COMMENT 'I:로그인\r\nO:로그아웃',
  `CNTN_IP_ADDR` varchar(15) NOT NULL COMMENT '접속IP주소',
  PRIMARY KEY (`LOG_SN`),
  KEY `TB_ACC_LOG_ibfk_1` (`SITE_ID`),
  CONSTRAINT `TB_ACC_LOG_ibfk_1` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1790 DEFAULT CHARSET=utf8 COMMENT='웹콘접속로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_CNTN_LOG`
--


--
-- Table structure for table `TB_CNTN_STATS`
--

DROP TABLE IF EXISTS `TB_CNTN_STATS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_CNTN_STATS` (
  `CNTN_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '접속시퀀스',
  `SITE_ID` varchar(30) NOT NULL DEFAULT 'SITE000001' COMMENT '사이트아이디',
  `MENU_SN` int(10) NOT NULL DEFAULT 0 COMMENT '메뉴일련번호',
  `MAC_ADDR` varchar(17) NOT NULL COMMENT 'MAC주소',
  `INQ_CNT` int(10) NOT NULL DEFAULT 0 COMMENT '조회수',
  `CNTN_DT` date NOT NULL COMMENT '접속일시',
  `CNTN_URL_ADDR` varchar(2000) NOT NULL COMMENT '접속URL주소',
  `BFR_CNTN_URL_ADDR` varchar(2000) NOT NULL COMMENT '이전접속URL주소',
  `CNTN_BRSR` varchar(500) NOT NULL COMMENT '접속브라우저',
  `CNTN_IP_ADDR` varchar(15) NOT NULL COMMENT '접속IP주소',
  `CNTN_YR` char(4) NOT NULL COMMENT '접속년도',
  `CNTN_MM` tinyint(4) NOT NULL COMMENT '접속월',
  `CNTN_DD` tinyint(4) NOT NULL COMMENT '접속일',
  `CNTN_HR` tinyint(4) DEFAULT NULL COMMENT '접속시간',
  PRIMARY KEY (`CNTN_SN`),
  UNIQUE KEY `TB_CNTN_STATS_UNIQUE` (`SITE_ID`,`MENU_SN`,`MAC_ADDR`,`CNTN_DT`),
  CONSTRAINT `TB_ACC_STATS_ibfk_1` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2430 DEFAULT CHARSET=utf8 COMMENT='웹콘접속통계';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_CNTN_STATS`
--


--
-- Table structure for table `TB_CONTS`
--

DROP TABLE IF EXISTS `TB_CONTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_CONTS` (
  `CONTS_ID` char(7) NOT NULL COMMENT 'C000001',
  `SITE_ID` varchar(30) NOT NULL DEFAULT 'SITE000001' COMMENT '사이트아이디',
  `CONTS_VER` float DEFAULT NULL COMMENT '콘텐츠버전',
  `CONTS_TTL` varchar(100) NOT NULL COMMENT '콘텐츠제목',
  `CONTS_SE_CD` char(4) DEFAULT NULL COMMENT '콘텐츠구분코드',
  `CONTS_FILE_PATH` varchar(100) DEFAULT NULL COMMENT '콘텐츠파일경로',
  `CONTS_CN` longtext DEFAULT NULL COMMENT '콘텐츠내용',
  `CONTS_CN_SRCH` longtext DEFAULT NULL COMMENT '콘텐츠내용검색',
  `USE_YN` char(1) NOT NULL COMMENT 'Y:사용함, N:사용안함',
  `CCL_SE_CD` char(4) DEFAULT NULL COMMENT 'CCL구분코드',
  `KOGL_SE_CD` char(4) DEFAULT NULL COMMENT '공공누리구분코드',
  `PRGRM_FILE_ID` char(15) DEFAULT NULL COMMENT '프로그램파일아이디',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`CONTS_ID`),
  KEY `TB_SYS_CNTS_ibfk_1` (`SITE_ID`),
  CONSTRAINT `TB_SYS_CNTS_ibfk_1` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹콘콘텐츠';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_CONTS`
--


--
-- Table structure for table `TB_CONTS_LOG`
--

DROP TABLE IF EXISTS `TB_CONTS_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_CONTS_LOG` (
  `CONTS_LOG_SN` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CONTS_VER` float DEFAULT NULL COMMENT '콘텐츠버전',
  `CONTS_ID` char(7) DEFAULT NULL COMMENT 'C000001',
  `SITE_ID` varchar(30) DEFAULT NULL COMMENT '사이트아이디',
  `CONTS_TTL` varchar(100) DEFAULT NULL COMMENT '콘텐츠제목',
  `CONTS_SE_CD` char(4) DEFAULT NULL COMMENT '콘텐츠구분코드',
  `CONTS_FILE_PATH` varchar(100) DEFAULT NULL COMMENT '콘텐츠파일경로',
  `CONTS_CN` longtext DEFAULT NULL COMMENT '콘텐츠내용',
  `CONTS_CN_SRCH` longtext DEFAULT NULL COMMENT '콘텐츠내용검색',
  `USE_YN` char(1) DEFAULT NULL COMMENT 'Y:사용함, N:사용안함',
  `CCL_SE_CD` char(4) DEFAULT NULL COMMENT 'CCL구분코드',
  `KOGL_SE_CD` char(4) DEFAULT NULL COMMENT '공공누리구분코드',
  `PRGRM_FILE_ID` char(15) DEFAULT NULL COMMENT '프로그램파일아이디',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  PRIMARY KEY (`CONTS_LOG_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='웹콘콘텐츠로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_CONTS_LOG`
--


--
-- Table structure for table `TB_CONTS_RSVT`
--

DROP TABLE IF EXISTS `TB_CONTS_RSVT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_CONTS_RSVT` (
  `CONTS_RSVT_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '콘텐츠예약일련번호',
  `CONTS_ID` char(7) DEFAULT NULL COMMENT '콘텐츠아이디',
  `SITE_ID` varchar(30) DEFAULT NULL COMMENT '사이트아이디',
  `CONTS_TTL` varchar(100) DEFAULT NULL COMMENT '콘텐츠제목',
  `CONTS_SE_CD` char(4) DEFAULT NULL COMMENT '콘텐츠구분코드',
  `CONTS_FILE_PATH` varchar(100) DEFAULT NULL COMMENT '콘텐츠파일경로',
  `CONTS_CN` longtext DEFAULT NULL COMMENT '콘텐츠내용',
  `CONTS_CN_SRCH` longtext DEFAULT NULL COMMENT '콘텐츠내용검색',
  `USE_YN` char(1) DEFAULT NULL COMMENT 'Y:사용함, N:사용안함',
  `CCL_SE_CD` char(4) DEFAULT NULL COMMENT 'CCL구분코드',
  `KOGL_SE_CD` char(4) DEFAULT NULL COMMENT '공공누리구분코드',
  `BTC_RSVT_DT` datetime DEFAULT NULL COMMENT '배치예약일시',
  `BTC_EXCN_DT` datetime DEFAULT NULL COMMENT '배치실행일시',
  `BTC_STTS_CD` char(4) DEFAULT NULL COMMENT '배치상태코드',
  `PRGRM_FILE_ID` char(15) DEFAULT NULL COMMENT '프로그램파일아이디',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`CONTS_RSVT_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='웹콘콘텐츠예약';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_CONTS_RSVT`
--


--
-- Table structure for table `TB_CTGRY_CD`
--

DROP TABLE IF EXISTS `TB_CTGRY_CD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_CTGRY_CD` (
  `CTGRY_CD` char(7) NOT NULL COMMENT '카테고리코드',
  `CTGRY_NM` varchar(100) NOT NULL COMMENT '카테고리명',
  `CTGRY_ENG_NM` varchar(100) DEFAULT NULL COMMENT '카테고리영문명',
  `UP_CTGRY_CD` char(7) NOT NULL COMMENT '상위카테고리코드',
  `MEMO_CN` varchar(1000) DEFAULT NULL COMMENT '메모내용',
  `USE_YN` char(1) NOT NULL DEFAULT 'Y' COMMENT 'Y:사용함, N:사용안함',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`CTGRY_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹콘카테고리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_CTGRY_CD`
--


--
-- Table structure for table `TB_ERR_LOG`
--

DROP TABLE IF EXISTS `TB_ERR_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_ERR_LOG` (
  `ERR_LOG_SN` int(10) NOT NULL AUTO_INCREMENT COMMENT '오류로그일련번호',
  `USER_ID` varchar(30) DEFAULT NULL COMMENT '사용자아이디',
  `USER_IP_ADDR` varchar(15) NOT NULL COMMENT '사용자IP주소',
  `ERR_TP` varchar(100) NOT NULL COMMENT '오류유형',
  `ERR_CD` char(3) DEFAULT NULL COMMENT '오류코드',
  `ERR_MSG` varchar(1000) NOT NULL COMMENT '오류메시지',
  `ERR_DT` datetime NOT NULL COMMENT '오류일시',
  `ERR_PSTN` varchar(2000) DEFAULT NULL COMMENT '오류위치',
  PRIMARY KEY (`ERR_LOG_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=3173 DEFAULT CHARSET=utf8 COMMENT='웹콘에러로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_ERR_LOG`
--


--
-- Table structure for table `TB_EZ_LGN`
--

DROP TABLE IF EXISTS `TB_EZ_LGN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_EZ_LGN` (
  `EZ_LGN_SE_CD` char(4) NOT NULL COMMENT '간편로그인구분코드\r\nU016 / C001 : 네이버 / C002 : 카카오 / C003 : 구글',
  `APP_ID` varchar(100) DEFAULT NULL COMMENT '앱아이디',
  `ACS_TOKEN` varchar(300) DEFAULT NULL COMMENT '접근토큰',
  `USE_YN` char(1) NOT NULL COMMENT '사용여부',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`EZ_LGN_SE_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹콘간편로그인';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_EZ_LGN`
--


--
-- Table structure for table `TB_HSTRY`
--

DROP TABLE IF EXISTS `TB_HSTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_HSTRY` (
  `HSTRY_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '연혁일련번호',
  `SITE_ID` varchar(30) NOT NULL DEFAULT 'SITE000001' COMMENT '사이트아이디',
  `HSTRY_YMD` char(8) NOT NULL COMMENT '회사연혁일자',
  `EXPSR_YN` char(1) DEFAULT NULL COMMENT 'Y:노출함, N:노출안함',
  `SORT_SN` int(10) unsigned DEFAULT NULL COMMENT '0:메인\r\n1~00',
  `HSTRY_SE_NM` varchar(50) DEFAULT NULL COMMENT '연혁구분명(연혁, 수상)',
  `HSTRY_CN` varchar(2000) DEFAULT NULL COMMENT '연혁내용',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`HSTRY_SN`),
  KEY `SITE_ID` (`SITE_ID`),
  CONSTRAINT `TB_HSTRY_ibfk_1` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_HSTRY_ibfk_2` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='웹콘연혁';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_HSTRY`
--


--
-- Table structure for table `TB_JOB_LOG`
--

DROP TABLE IF EXISTS `TB_JOB_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_JOB_LOG` (
  `JOB_LOG_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '작업로그일련번호',
  `SITE_ID` varchar(30) NOT NULL DEFAULT 'SITE000001' COMMENT '사이트아이디',
  `EXCN_DT` datetime DEFAULT NULL COMMENT '실행시간',
  `USER_ID` varchar(30) DEFAULT NULL COMMENT '사용자아이디',
  `WORK_SE_CD` char(4) NOT NULL COMMENT '작업구분코드',
  `CNTN_IP_ADDR` varchar(15) NOT NULL COMMENT '접속IP주소',
  `QRY_ID` varchar(100) NOT NULL COMMENT '쿼리아이디',
  `MEMO_CN` longtext DEFAULT NULL COMMENT '메모내용',
  PRIMARY KEY (`JOB_LOG_SN`),
  KEY `TB_WORK_LOG_ibfk_1` (`SITE_ID`),
  CONSTRAINT `TB_WORK_LOG_ibfk_1` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=554 DEFAULT CHARSET=utf8 COMMENT='웹콘작업로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_JOB_LOG`
--


--
-- Table structure for table `TB_LCNS`
--

DROP TABLE IF EXISTS `TB_LCNS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_LCNS` (
  `LCNS_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '라이센스일련번호',
  `BIZ_CD` varchar(20) DEFAULT NULL COMMENT '사업코드',
  `BIZ_NM` varchar(20) DEFAULT NULL COMMENT '사업명',
  `IP_ADDR` varchar(15) DEFAULT NULL COMMENT 'IP주소',
  `HST_NM` varchar(20) DEFAULT NULL COMMENT '호스트명',
  `ENCPT_KEY` varchar(50) DEFAULT NULL COMMENT '암호화키',
  `IV_KEY` varchar(50) DEFAULT NULL COMMENT 'IV키',
  `LCNS_CN` varchar(4000) DEFAULT NULL COMMENT '라이센스내용',
  `LCNS_CN_ENCPT` varchar(4000) DEFAULT NULL COMMENT '라이센스내용암호화',
  `BGNG_YMD` varchar(10) DEFAULT NULL COMMENT '시작일자',
  `END_YMD` varchar(10) DEFAULT NULL COMMENT '종료일자',
  `LCNS_STTS_CD` varchar(4) DEFAULT NULL COMMENT '라이센스상태코드',
  `MEMO_CN` varchar(1000) DEFAULT NULL COMMENT '메모내용',
  `PRGRM_FILE_ID` char(15) DEFAULT NULL COMMENT 'FILE00000000001',
  `RGTR_ID` varchar(50) DEFAULT NULL COMMENT '등록자아이디',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`LCNS_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_LCNS`
--


--
-- Table structure for table `TB_LCNS_LOG`
--

DROP TABLE IF EXISTS `TB_LCNS_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_LCNS_LOG` (
  `LCNS_LOG_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '라이센스로그일련번호',
  `LCNS_SN` int(10) unsigned NOT NULL COMMENT '라이센스일련번호',
  `BIZ_CD` varchar(20) DEFAULT NULL COMMENT '사업코드',
  `BIZ_NM` varchar(20) DEFAULT NULL COMMENT '사업명',
  `IP_ADDR` varchar(15) DEFAULT NULL COMMENT 'IP주소',
  `HST_NM` varchar(20) DEFAULT NULL COMMENT '호스트명',
  `ENCPT_KEY` varchar(50) DEFAULT NULL COMMENT '암호화키',
  `IV_KEY` varchar(50) DEFAULT NULL COMMENT 'IV키',
  `LCNS_CN` varchar(4000) DEFAULT NULL COMMENT '라이센스내용',
  `LCNS_CN_ENCPT` varbinary(50) DEFAULT NULL COMMENT '라이센스내용암호화',
  `BGNG_YMD` varchar(10) DEFAULT NULL COMMENT '시작일자',
  `END_YMD` varchar(10) DEFAULT NULL COMMENT '종료일자',
  `LCNS_STTS_CD` varchar(4) DEFAULT NULL COMMENT '라이센스상태코드',
  `MEMO_CN` varchar(1000) DEFAULT NULL COMMENT '메모내용',
  `PRGRM_FILE_ID` char(15) DEFAULT NULL COMMENT 'FILE00000000001',
  `RGTR_ID` varchar(50) DEFAULT NULL COMMENT '등록자아이디',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`LCNS_LOG_SN`),
  UNIQUE KEY `LCNS_LOG_SN` (`LCNS_LOG_SN`),
  KEY `LCNS_SN` (`LCNS_SN`),
  CONSTRAINT `TB_LCNS_LOG_ibfk_1` FOREIGN KEY (`LCNS_SN`) REFERENCES `TB_LCNS` (`LCNS_SN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_LCNS_LOG`
--


--
-- Table structure for table `TB_LCNS_TRSM_LOG`
--

DROP TABLE IF EXISTS `TB_LCNS_TRSM_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_LCNS_TRSM_LOG` (
  `LCNS_TRSM_LOG_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '라이센스전송로그일련번호',
  `LCNS_SN` int(10) unsigned DEFAULT NULL COMMENT '라이센스일련번호',
  `TRSM_DATA` varchar(1000) DEFAULT NULL COMMENT '전송데이터',
  `TRSM_RSLT_CD` char(4) DEFAULT NULL COMMENT '전송결과코드',
  `TRSM_DT` datetime DEFAULT NULL COMMENT '전송일시',
  PRIMARY KEY (`LCNS_TRSM_LOG_SN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_LCNS_TRSM_LOG`
--


--
-- Table structure for table `TB_LGN_BLCK`
--

DROP TABLE IF EXISTS `TB_LGN_BLCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_LGN_BLCK` (
  `LGN_BLCK_SN` int(11) NOT NULL AUTO_INCREMENT COMMENT '로그인차단일련번호',
  `SSN_ID` varchar(100) DEFAULT NULL COMMENT '세션아이디(맥어드레스 암호화 값)',
  `LGN_SE_CD` char(4) DEFAULT NULL COMMENT '로그인구분코드 C001:회원, C002:관리자',
  `MBR_ID` varchar(50) DEFAULT NULL COMMENT '회원아이디',
  `BLCK_IP_ADDR` varchar(15) DEFAULT NULL COMMENT '차단IP주소',
  `BLCK_DT` datetime DEFAULT NULL COMMENT '차단일시(차단일시기준 10분간 로그인 차단)',
  PRIMARY KEY (`LGN_BLCK_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='웹콘로그인차단';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_LGN_BLCK`
--


--
-- Table structure for table `TB_LGN_LOG`
--

DROP TABLE IF EXISTS `TB_LGN_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_LGN_LOG` (
  `LGN_LOG_SN` int(11) NOT NULL AUTO_INCREMENT COMMENT '로그인로그일련번호',
  `SSN_ID` varchar(100) DEFAULT NULL COMMENT '세션아이디(맥어드레스 암호화 값)',
  `LGN_SE_CD` char(4) DEFAULT NULL COMMENT '로그인구분코드 C001:회원, C002:관리자',
  `MBR_ID` varchar(50) DEFAULT NULL COMMENT '회원아이디',
  `LGN_IP_ADDR` varchar(15) DEFAULT NULL COMMENT '로그인IP주소',
  `LGN_DT` datetime DEFAULT NULL COMMENT '로그인일시',
  `SCS_YN` char(1) DEFAULT NULL COMMENT '성공여부',
  `DEL_YN` char(1) DEFAULT NULL COMMENT '삭제여부(차단 OR 로그인 성공시 삭제여부 = Y)',
  PRIMARY KEY (`LGN_LOG_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=1328 DEFAULT CHARSET=utf8 COMMENT='웹콘로그인로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_LGN_LOG`
--


--
-- Table structure for table `TB_LGN_SCRTY`
--

DROP TABLE IF EXISTS `TB_LGN_SCRTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_LGN_SCRTY` (
  `LGN_SCRTY_SN` int(11) NOT NULL AUTO_INCREMENT COMMENT '로그인보안일련번호',
  `LGN_SE_CD` char(4) DEFAULT NULL COMMENT '로그인구분코드 C001:회원, C002:관리자',
  `DPCN_LGN_YN` char(1) DEFAULT NULL COMMENT '중복로그인여부',
  `LGN_SCRTY_YN` char(1) DEFAULT NULL COMMENT '로그인보안여부',
  `LGN_FAIL_NMTM` int(2) DEFAULT NULL COMMENT '로그인실패횟수',
  `LGN_BLCK_MI` int(3) DEFAULT NULL COMMENT '로그인차단분',
  `IP_BLCK_YN` char(1) DEFAULT NULL COMMENT 'IP차단여부',
  `BLCK_IP_ADDR_LIST` varchar(1000) DEFAULT NULL COMMENT '차단IP주소목록',
  `PSWD_CHG_YN` char(1) DEFAULT NULL COMMENT '비밀번호변경여부',
  `PSWD_CHG_CYC` int(2) DEFAULT NULL COMMENT '비밀번호변경주기',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`LGN_SCRTY_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='웹콘로그인보안';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_LGN_SCRTY`
--


--
-- Table structure for table `TB_MBR`
--

DROP TABLE IF EXISTS `TB_MBR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_MBR` (
  `MBR_ID` varchar(50) NOT NULL COMMENT '회원아이디',
  `SITE_ID` varchar(30) NOT NULL DEFAULT 'SITE000001' COMMENT '사이트아이디',
  `MBR_PSWD_SE` char(3) DEFAULT NULL COMMENT '회원비밀번호구분',
  `MBR_PSWD` varchar(100) NOT NULL COMMENT '회원비밀번호',
  `BFR_MBR_PSWD` varchar(100) DEFAULT NULL COMMENT '이전회원비밀번호',
  `MBR_NM` varchar(50) NOT NULL COMMENT '회원명',
  `EML_ADDR` varchar(320) NOT NULL COMMENT '이메일',
  `MBL_TELNO` varchar(20) DEFAULT NULL COMMENT '휴대폰번호',
  `BRDT` char(8) DEFAULT NULL COMMENT '생년월일',
  `EMP_NO` varchar(6) DEFAULT NULL COMMENT '직원번호',
  `MBR_SE_CD` char(4) DEFAULT NULL COMMENT '0010 : 브론즈\r\n0020 : 실버\r\n0030 : 골드',
  `MBR_GRD_CD` char(4) DEFAULT NULL COMMENT '회원등급코드',
  `MBR_STTS_CD` char(4) NOT NULL DEFAULT '0010' COMMENT '0010 : 정상\r\n0020 : 휴면\r\n0030 : 탈퇴',
  `PRFL_IMG_NO` int(2) DEFAULT NULL COMMENT '프로필이미지번호',
  `ADDR` varchar(200) DEFAULT NULL COMMENT '주소',
  `DADDR` varchar(200) DEFAULT NULL COMMENT '상세주소',
  `EML_RCPTN_AGRE_YN` char(1) DEFAULT NULL COMMENT '메일수신동의여부\r\nY : 예\r\nN : 아니오',
  `SMS_RCPTN_AGRE_YN` char(1) DEFAULT NULL COMMENT 'SMS수신동의여부 Y:예, N:아니오',
  `MEMO_CN` varchar(1000) DEFAULT NULL COMMENT '메모내용',
  `LGN_DT` datetime DEFAULT NULL COMMENT '로그인일시',
  `LGN_IP_ADDR` varchar(20) DEFAULT NULL COMMENT '로그인IP주소',
  `APRV_DT` datetime DEFAULT NULL COMMENT '승인일시',
  `DRMNT_DT` datetime DEFAULT NULL COMMENT '휴면일시',
  `WHDWL_DT` datetime DEFAULT NULL COMMENT '탈퇴일시',
  `IDNTY_YN` char(1) NOT NULL DEFAULT 'N' COMMENT 'N : 확인전\r\nY : 확인',
  `WHDWL_RSN` tinytext DEFAULT NULL COMMENT '탈퇴사유',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  `OGDP_CD` char(4) DEFAULT NULL COMMENT '소속코드',
  `DEPT_CD` char(4) DEFAULT NULL COMMENT '부서코드',
  `JBGD_CD` char(4) DEFAULT NULL COMMENT '직급코드',
  `NCKNM` varchar(50) DEFAULT NULL COMMENT '닉네임(별명)',
  `PRVC_CLCT_AGRE_YN` char(1) DEFAULT NULL COMMENT '개인정보수집동의여부',
  `STC_AGRE_YN` char(1) DEFAULT NULL COMMENT '이용약관동의여부',
  `AGRE_DT` datetime DEFAULT NULL COMMENT '동의일시',
  `PUSH_TOKEN` varchar(200) DEFAULT NULL COMMENT 'FCM 푸시 알림 토큰',
  PRIMARY KEY (`MBR_ID`),
  KEY `SITE_ID` (`SITE_ID`),
  CONSTRAINT `TB_MBR_ibfk_1` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_MBR_ibfk_2` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹콘회원';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_MBR`
--


--
-- Table structure for table `TB_MBR_SCHDL`
--

DROP TABLE IF EXISTS `TB_MBR_SCHDL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_MBR_SCHDL` (
  `MBR_SCHDL_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '회원일정일련번호',
  `MBR_SCHDL_SE_ID` varchar(10) NOT NULL COMMENT '회원일정구분아이디(휴면:drmc / 개인정보:prvc)',
  `MBR_SCHDL_USE_YN` char(1) DEFAULT NULL COMMENT '회원스케쥴사용여부',
  `MBR_SCHDL_STNG_MM` int(11) DEFAULT NULL COMMENT '회원일정설정월',
  `PRNMNT_MSG_USE_YN` char(1) DEFAULT NULL COMMENT '예정알림사용여부',
  `MSG_KND_LIST` varchar(100) DEFAULT NULL COMMENT '알림종류코드(공통코드/ U023)\r\nSMS / 알림톡 / 이메일',
  `MSG_TALK_ID` varchar(50) DEFAULT NULL COMMENT '알림톡아이디',
  `MSG_TALK_TMPLT_CD` varchar(100) DEFAULT NULL COMMENT '알림톡템플릿코드',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`MBR_SCHDL_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='웹콘회원일정(스케줄)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_MBR_SCHDL`
--


--
-- Table structure for table `TB_MEMO`
--

DROP TABLE IF EXISTS `TB_MEMO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_MEMO` (
  `MEMO_SN` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MEMO_CN` varchar(1000) DEFAULT NULL COMMENT '메모내용',
  `RGTR_ID` varchar(50) DEFAULT NULL COMMENT '등록자아이디',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`MEMO_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_MEMO`
--


--
-- Table structure for table `TB_MENU`
--

DROP TABLE IF EXISTS `TB_MENU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_MENU` (
  `MENU_SN` int(11) NOT NULL AUTO_INCREMENT COMMENT '메뉴일련번호',
  `SITE_ID` varchar(30) NOT NULL DEFAULT 'SITE000001' COMMENT '사이트아이디',
  `MENU_VER` float DEFAULT NULL COMMENT '메뉴버전',
  `MENU_UP_SN` int(10) unsigned NOT NULL COMMENT '메뉴상위일련번호',
  `MENU_NM` varchar(50) NOT NULL COMMENT '메뉴명',
  `MENU_SE_CD` char(4) NOT NULL COMMENT '메뉴구분코드(U001) / 프로그램(C001) / 게시판(C002) / 콘텐츠(C003) / 링크(C004)',
  `MENU_HELP_CN` text DEFAULT NULL COMMENT '메뉴도움말내용',
  `PRGRM_ID` char(7) DEFAULT NULL COMMENT '프로그램아이디',
  `BBS_ID` char(7) DEFAULT NULL COMMENT '게시판아이디',
  `CONTS_ID` char(7) DEFAULT NULL COMMENT '콘텐츠아이디',
  `LNKG_URL` varchar(200) DEFAULT NULL COMMENT '링크URL',
  `SORT_SN` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '정렬일련번호',
  `USE_YN` char(1) NOT NULL DEFAULT 'Y' COMMENT 'Y:사용함, N:사용안함',
  `EXPSR_YN` char(1) DEFAULT 'Y' COMMENT 'Y:노출함, N:노출안함',
  `MEMO_CN` varchar(1000) DEFAULT NULL COMMENT '메모내용',
  `ICON` varchar(50) DEFAULT NULL COMMENT '아이콘',
  `PIC_USE_YN` char(1) DEFAULT NULL COMMENT '담당자사용여부',
  `DGSTFN_USE_YN` char(1) DEFAULT NULL COMMENT '만족도사용여부',
  `OGNZ_SN` int(10) DEFAULT NULL COMMENT '조직일련번호',
  `FILTER_SE_CD_LIST` varchar(1000) DEFAULT NULL COMMENT '필터구분코드목록',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`MENU_SN`),
  KEY `TB_SYS_MENU_ibfk_3` (`CONTS_ID`),
  KEY `TB_SYS_MENU_ibfk_4` (`PRGRM_ID`),
  KEY `TB_SYS_MENU_ibfk_2` (`SITE_ID`),
  KEY `BBS_ID` (`BBS_ID`),
  CONSTRAINT `TB_MENU_ibfk_1` FOREIGN KEY (`BBS_ID`) REFERENCES `TB_BBS_INFO` (`BBS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_MENU_ibfk_2` FOREIGN KEY (`BBS_ID`) REFERENCES `TB_BBS_INFO` (`BBS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SYS_MENU_ibfk_2` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SYS_MENU_ibfk_3` FOREIGN KEY (`CONTS_ID`) REFERENCES `TB_CONTS` (`CONTS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SYS_MENU_ibfk_4` FOREIGN KEY (`PRGRM_ID`) REFERENCES `TB_PRGRM` (`PRGRM_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=966 DEFAULT CHARSET=utf8 COMMENT='웹콘메뉴';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_MENU`
--


--
-- Table structure for table `TB_MENU_DGSTFN`
--

DROP TABLE IF EXISTS `TB_MENU_DGSTFN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_MENU_DGSTFN` (
  `MENU_DGSTFN_SN` int(10) NOT NULL AUTO_INCREMENT COMMENT '메뉴만족도일련번호',
  `SITE_ID` varchar(30) DEFAULT NULL COMMENT '사이트아이디',
  `MENU_SN` int(11) DEFAULT NULL COMMENT '메뉴일련번호',
  `DGSTFN_SCR` int(7) DEFAULT NULL COMMENT '만족도점수',
  `DGSTFN_CN` varchar(4000) DEFAULT NULL COMMENT '만족도내용',
  `USER_IP_ADDR` varchar(15) DEFAULT NULL COMMENT '사용자IP주소',
  `RGTR_ID` varchar(50) DEFAULT NULL COMMENT '등록자아이디',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  PRIMARY KEY (`MENU_DGSTFN_SN`),
  KEY `MENU_SN` (`MENU_SN`),
  KEY `SITE_ID` (`SITE_ID`),
  CONSTRAINT `TB_MENU_DGSTFN_ibfk_1` FOREIGN KEY (`MENU_SN`) REFERENCES `TB_MENU` (`MENU_SN`),
  CONSTRAINT `TB_MENU_DGSTFN_ibfk_2` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='웹콘메뉴만족도';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_MENU_DGSTFN`
--


--
-- Table structure for table `TB_MENU_LOG`
--

DROP TABLE IF EXISTS `TB_MENU_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_MENU_LOG` (
  `MENU_LOG_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '메뉴로그일련번호',
  `MENU_SN` int(11) NOT NULL COMMENT '메뉴일련번호',
  `SITE_ID` varchar(30) NOT NULL DEFAULT 'SITE000001' COMMENT '사이트아이디',
  `MENU_VER` float DEFAULT NULL COMMENT '메뉴버전',
  `MENU_UP_SN` int(10) unsigned NOT NULL COMMENT '메뉴상위일련번호',
  `MENU_NM` varchar(50) NOT NULL COMMENT '메뉴명',
  `MENU_SE_CD` char(4) NOT NULL COMMENT '메뉴구분코드(U001) / 프로그램(C001) / 게시판(C002) / 콘텐츠(C003) / 링크(C004)',
  `MENU_HELP_CN` text DEFAULT NULL COMMENT '메뉴도움말내용',
  `PRGRM_ID` char(7) DEFAULT NULL COMMENT '프로그램아이디',
  `BBS_ID` char(7) DEFAULT NULL COMMENT '게시판아이디',
  `CONTS_ID` char(7) DEFAULT NULL COMMENT '콘텐츠아이디',
  `LNKG_URL` varchar(200) DEFAULT NULL COMMENT '링크URL',
  `SORT_SN` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '정렬일련번호',
  `USE_YN` char(1) NOT NULL DEFAULT 'Y' COMMENT 'Y:사용함, N:사용안함',
  `EXPSR_YN` char(1) DEFAULT 'Y' COMMENT 'Y:노출함, N:노출안함',
  `MEMO_CN` varchar(1000) DEFAULT NULL COMMENT '메모내용',
  `ICON` varchar(50) DEFAULT NULL COMMENT '아이콘',
  `PIC_USE_YN` char(1) DEFAULT NULL COMMENT '담당자사용여부',
  `DGSTFN_USE_YN` char(1) DEFAULT NULL COMMENT '만족도사용여부(나중에쓸까봐삭제안함)',
  `OGNZ_SN` int(10) unsigned DEFAULT NULL COMMENT '조직일련번호',
  `MDFCN_RSN` varchar(1000) DEFAULT NULL COMMENT '수정사유',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`MENU_LOG_SN`),
  KEY `MENU_SN` (`MENU_SN`),
  CONSTRAINT `TB_MENU_LOG_ibfk_1` FOREIGN KEY (`MENU_SN`) REFERENCES `TB_MENU` (`MENU_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COMMENT='웹콘메뉴로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_MENU_LOG`
--


--
-- Table structure for table `TB_OGNZ`
--

DROP TABLE IF EXISTS `TB_OGNZ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_OGNZ` (
  `OGNZ_CD` char(7) NOT NULL COMMENT '조직코드',
  `SITE_ID` varchar(30) NOT NULL COMMENT '사이트아이디',
  `OGNZ_NM` varchar(100) DEFAULT NULL COMMENT '조직명',
  `UP_OGNZ_CD` char(7) DEFAULT NULL COMMENT '상위조직코드',
  `OGNZ_LVL` int(10) unsigned DEFAULT NULL COMMENT '조직레벨',
  `SORT_SN` int(10) unsigned DEFAULT NULL COMMENT '정렬일련번호',
  `USE_YN` char(1) DEFAULT NULL COMMENT '사용여부',
  `RGTR_ID` varchar(50) DEFAULT NULL COMMENT '등록자아이디',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`OGNZ_CD`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹콘조직';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_OGNZ`
--


--
-- Table structure for table `TB_OGNZ_PSNL`
--

DROP TABLE IF EXISTS `TB_OGNZ_PSNL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_OGNZ_PSNL` (
  `OGNZ_PSNL_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '조직인원일련번호',
  `OGNZ_CD` char(7) DEFAULT NULL COMMENT '조직코드',
  `SITE_ID` varchar(30) DEFAULT NULL COMMENT '사이트아이디',
  `JBGD_NM` varchar(100) DEFAULT NULL COMMENT '직급명',
  `EMP_NM` varchar(100) DEFAULT NULL COMMENT '직원명',
  `OFC_TELNO` varchar(20) DEFAULT NULL COMMENT '사무실전화번호',
  `TKCG_TASK_NM` varchar(300) DEFAULT NULL COMMENT '담당업무명',
  `RGTR_ID` varchar(50) DEFAULT NULL COMMENT '등록자아이디',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`OGNZ_PSNL_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='웹콘조직인원';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_OGNZ_PSNL`
--


--
-- Table structure for table `TB_POPUP`
--

DROP TABLE IF EXISTS `TB_POPUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_POPUP` (
  `POPUP_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '팝업일련번호',
  `SITE_ID` varchar(30) NOT NULL DEFAULT 'SITE000001' COMMENT '사이트아이디',
  `POPUP_SE_CD` varchar(4) DEFAULT NULL COMMENT '팝업구분코드(공통코드:U007 / C001:팝업창 / C002:팝업존)',
  `TTL` varchar(200) NOT NULL COMMENT '제목',
  `CN` longtext DEFAULT NULL COMMENT '내용',
  `WDT` int(10) unsigned NOT NULL COMMENT '넓이',
  `HGT` int(10) unsigned NOT NULL COMMENT '높이',
  `X_PSTN` int(11) NOT NULL DEFAULT 0 COMMENT 'X위치',
  `Y_PSTN` int(11) NOT NULL DEFAULT 0 COMMENT 'Y위치',
  `EXPSR_SE_CD` char(4) DEFAULT NULL COMMENT '노출구분코드(공통코드:U006 / C001:팝업 / C002:레이어)',
  `MENU_SN` int(11) DEFAULT NULL COMMENT '메뉴일련번호',
  `LNKG_SE_CD` varchar(30) NOT NULL COMMENT '링크구분코드(공통코드:U005 / C001:현재창 / C002:새창 / C003:링크없음 / C004:이미지맵)',
  `LNKG_URL` varchar(200) NOT NULL COMMENT '링크URL',
  `SORT_SN` int(10) unsigned NOT NULL COMMENT '정렬일련번호',
  `BGNG_DT` date NOT NULL COMMENT '시작일시',
  `END_DT` date NOT NULL COMMENT '종료일시',
  `STRG_FILE_NM` varchar(200) DEFAULT NULL COMMENT '저장파일명',
  `ACTL_FILE_NM` varchar(200) DEFAULT NULL COMMENT '실제파일명',
  `IMG_RPLMNT_TEXT` varchar(100) DEFAULT NULL COMMENT '이미지대체텍스트',
  `FILE_PATH_NM` varchar(200) DEFAULT NULL COMMENT '파일경로명',
  `USE_YN` char(1) NOT NULL COMMENT 'Y:사용함, N:사용안함',
  `PRGRM_FILE_ID` char(15) DEFAULT NULL COMMENT 'FILE00000000001',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '수정일시',
  PRIMARY KEY (`POPUP_SN`),
  KEY `TB_POPWIN_ibfk_1` (`SITE_ID`),
  CONSTRAINT `TB_POPWIN_ibfk_1` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='웹콘팝업';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_POPUP`
--


--
-- Table structure for table `TB_PRGRM`
--

DROP TABLE IF EXISTS `TB_PRGRM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_PRGRM` (
  `PRGRM_ID` char(7) NOT NULL COMMENT '프로그램아이디',
  `SITE_ID` varchar(30) NOT NULL COMMENT '사이트아이디',
  `PRGRM_SE_CD` char(4) DEFAULT NULL COMMENT '0010 : 시스템\r\n0020 : 개별홈페이지',
  `PRGRM_NM` varchar(50) NOT NULL COMMENT '프로그램명',
  `PRGRM_CN` longtext DEFAULT NULL COMMENT '프로그램내용',
  `PRGRM_PATH` varchar(50) NOT NULL COMMENT '프로그램실행경로(Controller Path)',
  `SORT_SN` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '0:메인\r\n1~00',
  `USE_YN` char(1) NOT NULL DEFAULT 'Y' COMMENT 'Y:사용함, N:사용안함',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`PRGRM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹콘프로그램';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PRGRM`
--


--
-- Table structure for table `TB_PRGRM_FILE`
--

DROP TABLE IF EXISTS `TB_PRGRM_FILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_PRGRM_FILE` (
  `PRGRM_FILE_ID` char(15) NOT NULL COMMENT 'FILE00000000001',
  `PRGRM_FILE_SN` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '파일일련번호 1,2,3...',
  `SITE_ID` varchar(30) NOT NULL DEFAULT 'SITE000001' COMMENT '사이트아이디',
  `STRG_FILE_NM` varchar(200) DEFAULT NULL COMMENT '저장파일명',
  `ACTL_FILE_NM` varchar(200) DEFAULT NULL COMMENT '실제파일명',
  `FILE_SZ` int(10) unsigned DEFAULT NULL COMMENT '파일크기',
  `FILE_SE_CD` char(4) NOT NULL COMMENT '0010 : 이미지\r\n0020 : 첨부파일',
  `FILE_DTL_SE_CD` char(4) DEFAULT NULL COMMENT '파일상세구분',
  `FILE_EXTN_NM` varchar(20) DEFAULT NULL COMMENT '파일확장자명',
  `FILE_PATH_NM` varchar(200) DEFAULT NULL COMMENT '파일경로명',
  `SORT_SN` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '0:메인\r\n1~00',
  `TRGT_TBL_NM` varchar(50) DEFAULT NULL COMMENT '대상테이블명',
  `TRGT_SN` int(10) unsigned DEFAULT NULL COMMENT '대상일련번호',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  PRIMARY KEY (`PRGRM_FILE_ID`,`PRGRM_FILE_SN`),
  KEY `TB_PGM_FILE_ibfk_1` (`SITE_ID`),
  CONSTRAINT `TB_PGM_FILE_ibfk_1` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹콘프로그램파일';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PRGRM_FILE`
--


--
-- Table structure for table `TB_PRVC_FILTER`
--

DROP TABLE IF EXISTS `TB_PRVC_FILTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_PRVC_FILTER` (
  `PRVC_FILTER_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '개인정보필터일련번호',
  `SITE_ID` varchar(30) DEFAULT NULL COMMENT '사이트아이디',
  `TTL` varchar(200) DEFAULT NULL COMMENT '제목',
  `MENU_SE_CD` char(4) DEFAULT NULL COMMENT '메뉴구분코드(U001) / 프로그램(C001) / 게시판(C002) / 콘텐츠(C003) / 링크(C004)',
  `PRGRM_ID` char(7) DEFAULT NULL COMMENT '프로그램아이디',
  `BBS_ID` char(7) DEFAULT NULL COMMENT '게시판아이디',
  `CONTS_ID` char(7) DEFAULT NULL COMMENT '콘텐츠아이디',
  `MENU_URL_ADDR` varchar(2000) DEFAULT NULL COMMENT '메뉴URL주소',
  `FILTER_RRNO` varchar(1000) DEFAULT NULL COMMENT '필터주민등록번호',
  `FILTER_EML_ADDR` varchar(1000) DEFAULT NULL COMMENT '필터이메일주소',
  `FILTER_CARD_NO` varchar(1000) DEFAULT NULL COMMENT '필터카드번호',
  `FILTER_BRNO` varchar(1000) DEFAULT NULL COMMENT '필터사업자등록번호',
  `FILTER_TELNO` varchar(1000) DEFAULT NULL COMMENT '필터전화번호',
  `FILTER_MBL_TELNO` varchar(1000) DEFAULT NULL COMMENT '필터휴대전화번호',
  `FILTER_PNO` varchar(1000) DEFAULT NULL COMMENT '필터여권번호',
  `FILTER_PHWRD_NM` varchar(1000) DEFAULT NULL COMMENT '필터금칙어명',
  `RGTR_ID` varchar(50) DEFAULT NULL COMMENT '등록자아이디',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  PRIMARY KEY (`PRVC_FILTER_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='웹콘개인정보필터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PRVC_FILTER`
--


--
-- Table structure for table `TB_PRVC_LOG`
--

DROP TABLE IF EXISTS `TB_PRVC_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_PRVC_LOG` (
  `PRVC_LOG_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '개인정보로그일련번호',
  `SITE_ID` varchar(30) NOT NULL COMMENT '사이트아이디',
  `OCRN_DT` date NOT NULL COMMENT '발생일시',
  `SRVC_NM` varchar(100) NOT NULL COMMENT '서비스명',
  `INQ_INFO_LIST` varchar(100) DEFAULT NULL COMMENT '조회정보목록',
  `RQSTR_ID` varchar(50) DEFAULT NULL COMMENT '요청자아이디',
  `RQSTR_NM` varchar(100) DEFAULT NULL COMMENT '요청자명',
  `RQSTR_IP_ADDR` varchar(15) NOT NULL COMMENT '요청자IP주소',
  `TRPR_NM` varchar(100) DEFAULT NULL COMMENT '대상자명',
  PRIMARY KEY (`PRVC_LOG_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='웹콘 개인정보 로그';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PRVC_LOG`
--


--
-- Table structure for table `TB_PST`
--

DROP TABLE IF EXISTS `TB_PST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_PST` (
  `PST_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '게시글일련번호',
  `UP_PST_SN` int(10) unsigned DEFAULT NULL COMMENT '상위게시글일련번호',
  `BBS_ID` char(7) NOT NULL COMMENT '게시판아이디',
  `SITE_ID` varchar(30) NOT NULL DEFAULT 'SITE000001' COMMENT '사이트아이디',
  `WRTR_SE` varchar(20) DEFAULT NULL COMMENT '작성자구분(member, guest)',
  `WRTR_NM` varchar(100) DEFAULT NULL COMMENT '작성자명',
  `PSWD` varchar(100) DEFAULT NULL COMMENT '비밀번호',
  `TTL` varchar(200) DEFAULT NULL COMMENT '제목',
  `CN` longtext DEFAULT NULL COMMENT '내용',
  `CN_SRCH` longtext DEFAULT NULL COMMENT '내용검색',
  `PST_SE` varchar(50) DEFAULT NULL COMMENT '말머리구분명',
  `ANSWR_NM` varchar(100) DEFAULT NULL COMMENT '답변자명',
  `ANS_CN` text DEFAULT NULL COMMENT '답변내용',
  `ANS_DT` datetime DEFAULT NULL COMMENT '답변일시',
  `RFRNC_NO` int(11) NOT NULL DEFAULT 0 COMMENT '참조번호',
  `RFRNC_LVL_NO` int(11) NOT NULL DEFAULT 0 COMMENT '참조레벨번호',
  `RFRNC_STEP_NO` int(11) NOT NULL DEFAULT 0 COMMENT '참조단계번호',
  `USER_IP_ADDR` varchar(15) NOT NULL COMMENT '사용자IP주소',
  `VST_CNT` int(10) unsigned NOT NULL COMMENT '방문수',
  `USE_YN` char(1) DEFAULT NULL COMMENT 'Y:사용함, N:사용안함',
  `NTC_YN` char(1) DEFAULT NULL COMMENT '공지여부',
  `SCRTP` char(1) DEFAULT NULL COMMENT '비밀글',
  `EDITOR` char(1) DEFAULT NULL COMMENT '에디터작성',
  `ICON_EXPSR_NODAYS` int(10) unsigned DEFAULT 0 COMMENT '아이콘노출일',
  `SORT_SN` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '0:메인\r\n1~00',
  `EML_ADDR` varchar(320) DEFAULT NULL COMMENT '이메일',
  `TELNO` varchar(20) DEFAULT NULL COMMENT '전화번호',
  `PRVC_ESNTL_AGRE_YN` char(1) DEFAULT NULL COMMENT '개인정보필수동의여부(Y,N)',
  `PRVC_CHGC_AGRE_YN` char(1) DEFAULT NULL COMMENT '개인정보선택동의여부(Y,N)',
  `PRVC_AGRE_DT` datetime DEFAULT NULL COMMENT '개인정보동의일시',
  `PSTG_BGNG_YMD` char(8) DEFAULT NULL COMMENT '게시시작일자',
  `PSTG_END_YMD` char(8) DEFAULT NULL COMMENT '게시종료일자',
  `LNKG_ADDR` varchar(2000) DEFAULT NULL COMMENT '연결주소',
  `HTAG_NM` varchar(100) DEFAULT NULL COMMENT '해시태그명',
  `CCL_SE_CD` char(4) DEFAULT NULL COMMENT 'CCL구분코드',
  `KOGL_SE_CD` char(4) DEFAULT NULL COMMENT '공공누리구분코드',
  `RGTR_ID` varchar(50) DEFAULT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`PST_SN`),
  KEY `BBS_ID` (`BBS_ID`),
  KEY `SITE_ID` (`SITE_ID`),
  CONSTRAINT `TB_PST_ibfk_1` FOREIGN KEY (`BBS_ID`) REFERENCES `TB_BBS_INFO` (`BBS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_PST_ibfk_2` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_PST_ibfk_3` FOREIGN KEY (`BBS_ID`) REFERENCES `TB_BBS_INFO` (`BBS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_PST_ibfk_4` FOREIGN KEY (`BBS_ID`) REFERENCES `TB_BBS_INFO` (`BBS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_PST_ibfk_5` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='웹콘게시글';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PST`
--


--
-- Table structure for table `TB_PST_CMNT`
--

DROP TABLE IF EXISTS `TB_PST_CMNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_PST_CMNT` (
  `CMNT_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '댓글일련번호',
  `UP_CMNT_SN` int(10) unsigned DEFAULT NULL COMMENT '상위댓글일련번호',
  `PST_SN` int(10) unsigned NOT NULL COMMENT '게시글일련번호',
  `WRTR_SE` varchar(20) DEFAULT NULL COMMENT '작성자구분(member, guest)',
  `WRTR_NM` varchar(100) DEFAULT NULL COMMENT '작성자명',
  `PSWD` varchar(100) DEFAULT NULL COMMENT '비밀번호',
  `CN` longtext DEFAULT NULL COMMENT '내용',
  `CN_SRCH` longtext DEFAULT NULL COMMENT '내용검색',
  `RFRNC_NO` int(11) NOT NULL DEFAULT 0 COMMENT '참조번호',
  `RFRNC_LVL_NO` int(11) NOT NULL DEFAULT 0 COMMENT '참조레벨번호',
  `RFRNC_STEP_NO` int(11) NOT NULL DEFAULT 0 COMMENT '참조단계번호',
  `USER_IP_ADDR` varchar(15) NOT NULL COMMENT '사용자IP주소',
  `USE_YN` char(1) DEFAULT NULL COMMENT 'Y:사용함, N:사용안함',
  `SORT_SN` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '0:메인\r\n1~00',
  `RGTR_ID` varchar(50) DEFAULT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`CMNT_SN`),
  KEY `PST_SN` (`PST_SN`),
  CONSTRAINT `TB_PST_CMNT_ibfk_1` FOREIGN KEY (`PST_SN`) REFERENCES `TB_PST` (`PST_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_PST_CMNT_ibfk_2` FOREIGN KEY (`PST_SN`) REFERENCES `TB_PST` (`PST_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='웹콘게시글댓글';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PST_CMNT`
--


--
-- Table structure for table `TB_PST_FILE`
--

DROP TABLE IF EXISTS `TB_PST_FILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_PST_FILE` (
  `FILE_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '파일일련번호',
  `PST_SN` int(10) unsigned NOT NULL COMMENT '게시글일련번호',
  `SITE_ID` varchar(30) NOT NULL DEFAULT 'SITE000001' COMMENT '사이트아이디',
  `FILE_SE_CD` char(4) DEFAULT NULL COMMENT '0010 : 이미지\r\n0020 : 첨부파일 0030 : 썸네일',
  `STRG_FILE_NM` varchar(200) NOT NULL COMMENT '저장파일명',
  `ACTL_FILE_NM` varchar(200) NOT NULL COMMENT '실제파일명',
  `FILE_PATH_NM` varchar(200) NOT NULL COMMENT '파일경로명',
  `FILE_SZ` int(10) unsigned DEFAULT 0 COMMENT '파일크기',
  `FILE_EXTN_NM` varchar(20) DEFAULT NULL COMMENT '파일확장자명',
  `DWNLD_CNT` int(10) unsigned DEFAULT NULL COMMENT '다운로드수',
  `BBS_ID` char(7) NOT NULL COMMENT '게시판아이디',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  PRIMARY KEY (`FILE_SN`),
  KEY `TB_BOARD_FILE_ibfk_2` (`SITE_ID`),
  KEY `PST_SN` (`PST_SN`),
  CONSTRAINT `TB_BOARD_FILE_ibfk_2` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_PST_FILE_ibfk_1` FOREIGN KEY (`PST_SN`) REFERENCES `TB_PST` (`PST_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_PST_FILE_ibfk_2` FOREIGN KEY (`PST_SN`) REFERENCES `TB_PST` (`PST_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_PST_FILE_ibfk_3` FOREIGN KEY (`PST_SN`) REFERENCES `TB_PST` (`PST_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='웹콘게시글파일';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PST_FILE`
--


--
-- Table structure for table `TB_PST_INQ_LOG`
--

DROP TABLE IF EXISTS `TB_PST_INQ_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_PST_INQ_LOG` (
  `INQ_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '읽기시퀀스',
  `PST_SN` int(10) unsigned NOT NULL COMMENT '게시글일련번호',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  PRIMARY KEY (`INQ_SN`),
  KEY `PST_SN` (`PST_SN`),
  CONSTRAINT `TB_PST_INQ_LOG_ibfk_1` FOREIGN KEY (`PST_SN`) REFERENCES `TB_PST` (`PST_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_PST_INQ_LOG_ibfk_2` FOREIGN KEY (`PST_SN`) REFERENCES `TB_PST` (`PST_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_PST_INQ_LOG_ibfk_3` FOREIGN KEY (`PST_SN`) REFERENCES `TB_PST` (`PST_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_PST_INQ_LOG_ibfk_4` FOREIGN KEY (`PST_SN`) REFERENCES `TB_PST` (`PST_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='웹콘게시글읽기';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PST_INQ_LOG`
--


--
-- Table structure for table `TB_PST_LIKE`
--

DROP TABLE IF EXISTS `TB_PST_LIKE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_PST_LIKE` (
  `LIKE_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '좋아요일련번호',
  `PST_SN` int(10) unsigned NOT NULL COMMENT '게시글일련번호',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  PRIMARY KEY (`LIKE_SN`),
  KEY `PST_SN` (`PST_SN`),
  CONSTRAINT `TB_PST_LIKE_ibfk_1` FOREIGN KEY (`PST_SN`) REFERENCES `TB_PST` (`PST_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_PST_LIKE_ibfk_2` FOREIGN KEY (`PST_SN`) REFERENCES `TB_PST` (`PST_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_PST_LIKE_ibfk_3` FOREIGN KEY (`PST_SN`) REFERENCES `TB_PST` (`PST_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_PST_LIKE_ibfk_4` FOREIGN KEY (`PST_SN`) REFERENCES `TB_PST` (`PST_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_PST_LIKE_ibfk_5` FOREIGN KEY (`PST_SN`) REFERENCES `TB_PST` (`PST_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='웹콘게시글좋아요';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PST_LIKE`
--


--
-- Table structure for table `TB_PUSH`
--

DROP TABLE IF EXISTS `TB_PUSH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_PUSH` (
  `PUSH_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '푸시일련번호',
  `PUSH_SE_CD` char(4) NOT NULL COMMENT '푸시구분코드 (C001: TOKEN / C002: TOPIC)',
  `SITE_ID` varchar(30) NOT NULL COMMENT '사이트아이디',
  `PUSH_TTL` varchar(256) NOT NULL COMMENT '푸시제목',
  `PUSH_CN` text NOT NULL COMMENT '푸시내용',
  `LNKG_SE_CD` char(4) DEFAULT NULL COMMENT '연결구분코드',
  `LNKG_ADDR` varchar(200) DEFAULT NULL COMMENT '연결주소',
  `PRGRM_FILE_ID` char(15) DEFAULT NULL COMMENT '프로그램파일아이디',
  `RSVT_YN` char(1) DEFAULT NULL COMMENT '예약여부',
  `RSVT_DT` datetime DEFAULT NULL COMMENT '예약일시',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`PUSH_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='웹콘 푸시';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PUSH`
--


--
-- Table structure for table `TB_PUSH_TRGT`
--

DROP TABLE IF EXISTS `TB_PUSH_TRGT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_PUSH_TRGT` (
  `PUSH_TRGT_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '푸시대상일련번호',
  `PUSH_SN` int(10) unsigned NOT NULL COMMENT '푸시일련번호',
  `MBR_SE_CD` char(4) DEFAULT NULL COMMENT '회원구분코드U012 (C001 회원 / C002 관리자 )',
  `TRGT_ID` varchar(50) NOT NULL COMMENT '대상아이디',
  `SNDNG_SCS_YN` char(1) DEFAULT NULL COMMENT '발송성공여부 (성공 / 실패)',
  `SNDNG_DT` datetime DEFAULT NULL COMMENT '발송일시',
  `RCPTN_YN` char(1) DEFAULT NULL COMMENT '수신여부 (받음 / 못받음)',
  `RCPTN_DT` datetime DEFAULT NULL COMMENT '수신일시',
  `CLCK_YN` char(1) DEFAULT NULL COMMENT '클릭여부 (누름 / 안누름)',
  `CLCK_DT` datetime DEFAULT NULL COMMENT '클릭일시',
  `PUSH_MSG_ID` varchar(50) DEFAULT NULL COMMENT '메시지아이디',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`PUSH_TRGT_SN`),
  KEY `PUSH_SN` (`PUSH_SN`),
  CONSTRAINT `TB_PUSH_TRGT_ibfk_1` FOREIGN KEY (`PUSH_SN`) REFERENCES `TB_PUSH` (`PUSH_SN`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='웹콘 푸시 대상';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_PUSH_TRGT`
--


--
-- Table structure for table `TB_REL_SITE`
--

DROP TABLE IF EXISTS `TB_REL_SITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_REL_SITE` (
  `REL_SITE_SN` int(11) NOT NULL AUTO_INCREMENT COMMENT '관계사이트일련번호',
  `SITE_ID` varchar(30) NOT NULL COMMENT '사이트아이디',
  `REL_SITE_SE_CD` char(4) DEFAULT NULL COMMENT '1000,2000 사이트 구분',
  `SITE_NM` varchar(100) NOT NULL COMMENT '사이트명',
  `SITE_URL` varchar(100) DEFAULT NULL COMMENT '사이트주소(홈페이지)',
  `SORT_SN` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '0:메인\r\n1~00',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`REL_SITE_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='웹콘관련사이트';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_REL_SITE`
--


--
-- Table structure for table `TB_SITE`
--

DROP TABLE IF EXISTS `TB_SITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_SITE` (
  `SITE_ID` varchar(30) NOT NULL COMMENT '사이트아이디',
  `SITE_SE_CD` char(4) NOT NULL COMMENT '사이트구분코드\r\nU002 / C001 : 웹콘 관리, C002 : 웹사이트관리, C003 : 웹사이트',
  `SITE_NM` varchar(100) NOT NULL COMMENT '사이트명',
  `TMPLT_SN` int(11) NOT NULL COMMENT '템플릿일련번호',
  `SITE_URL_ADDR` varchar(100) DEFAULT NULL COMMENT '사이트URL주소',
  `SITE_DOMAIN` varchar(100) DEFAULT NULL COMMENT '사이트도메인',
  `SITE_TTL` varchar(100) DEFAULT NULL COMMENT '사이트제목',
  `ZIP` varchar(100) DEFAULT NULL COMMENT '우편번호',
  `ADDR` varchar(100) DEFAULT NULL COMMENT '주소',
  `DADDR` varchar(200) DEFAULT NULL COMMENT '상세주소',
  `RPRS_EML` varchar(100) DEFAULT NULL COMMENT '대표 이메일',
  `RPRS_TELNO` varchar(20) DEFAULT NULL COMMENT '대표전화',
  `COPYRIGHT` varchar(100) DEFAULT NULL COMMENT '카피라이터',
  `FXNO` varchar(20) DEFAULT NULL COMMENT '팩스번호',
  `USE_YN` char(1) NOT NULL COMMENT 'Y:사용함, N:사용안함',
  `META_TTL` varchar(500) DEFAULT NULL COMMENT '메타제목',
  `META_KYWD_NM` varchar(500) DEFAULT NULL COMMENT '메타키워드명',
  `METS_EXPLN` varchar(500) DEFAULT NULL COMMENT '메타설명',
  `OG_IMG` varchar(500) DEFAULT NULL COMMENT 'OG이미지',
  `OG_TTL` varchar(500) DEFAULT NULL COMMENT 'OG제목',
  `OG_DSCTN` varchar(500) DEFAULT NULL COMMENT 'OG내역',
  `DGSTFN_EXMN_SE_CD` char(4) DEFAULT NULL COMMENT '만족도조사구분코드 \r\n공통코드 U015사용 \n\r\nC000 : 모두사용 / C001 : 문항사용 \n - C002 :의견사용 / C003 : 사용안함',
  `DGSTFN_EXMN_QSTN` varchar(4000) DEFAULT NULL COMMENT '만족도조사질문',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`SITE_ID`),
  UNIQUE KEY `SITE_URL_ADDR` (`SITE_URL_ADDR`),
  KEY `TB_SITE_TB_TMPLT_FK` (`TMPLT_SN`),
  CONSTRAINT `TB_SITE_TB_TMPLT_FK` FOREIGN KEY (`TMPLT_SN`) REFERENCES `TB_TMPLT` (`TMPLT_SN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹콘사이트';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_SITE`
--


--
-- Table structure for table `TB_SITE_IMG`
--

DROP TABLE IF EXISTS `TB_SITE_IMG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_SITE_IMG` (
  `SITE_IMG_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '사이트이미지일련번호',
  `SITE_ID` varchar(30) NOT NULL DEFAULT 'SITE000001' COMMENT '사이트아이디',
  `IMG_TTL` varchar(100) DEFAULT NULL COMMENT '이미지제목',
  `IMG_SE_CD` char(4) NOT NULL COMMENT 'C001:메인, C002:Favicon, C003:상단 로고, C004:하단 로고',
  `STRG_FILE_NM` varchar(200) DEFAULT NULL COMMENT '저장파일명',
  `ACTL_FILE_NM` varchar(200) DEFAULT NULL COMMENT '실제파일명',
  `FILE_SZ` int(10) unsigned DEFAULT NULL COMMENT '파일크기',
  `FILE_SE_CD` char(4) NOT NULL COMMENT 'C001 : 이미지\r\nC002 : 첨부파일',
  `FILE_EXTN_NM` varchar(20) DEFAULT NULL COMMENT '파일확장자명',
  `FILE_PATH_NM` varchar(200) DEFAULT NULL COMMENT '파일경로명',
  `SORT_SN` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '0:메인\r\n1~00',
  `MEMO_CN` varchar(1000) DEFAULT NULL COMMENT '메모내용',
  `USE_YN` char(1) DEFAULT 'N' COMMENT 'Y:사용함, N:사용안함',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  `BGNG_YMD` varchar(10) DEFAULT NULL COMMENT '시작일자',
  `END_YMD` varchar(10) DEFAULT NULL COMMENT '종료일자',
  `LNKG_SE_CD` char(4) DEFAULT NULL COMMENT '링크구분코드(공통코드:U005 / C001:현재창 / C002:새창 / C003:링크없음 / C004:이미지맵)',
  `LNKG_URL` varchar(200) DEFAULT NULL COMMENT '링크URL',
  `IMG_RPLMNT_TEXT` varchar(100) DEFAULT NULL COMMENT '이미지 대체 TEXT',
  PRIMARY KEY (`SITE_IMG_SN`),
  KEY `TB_SITE_IMG_ibfk_1` (`SITE_ID`),
  CONSTRAINT `TB_SITE_IMG_ibfk_1` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='웹콘사이트이미지';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_SITE_IMG`
--


--
-- Table structure for table `TB_SN`
--

DROP TABLE IF EXISTS `TB_SN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_SN` (
  `TABLE_NAME` varchar(30) NOT NULL COMMENT '테이블명',
  `NEXT_ID` int(10) unsigned DEFAULT NULL COMMENT '다음아이디',
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹콘일련번호';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_SN`
--


--
-- Table structure for table `TB_SNS_INFO`
--

DROP TABLE IF EXISTS `TB_SNS_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_SNS_INFO` (
  `SNS_ID` varchar(50) NOT NULL COMMENT 'SNS아이디',
  `SITE_ID` varchar(30) NOT NULL COMMENT '사이트아이디',
  `SNS_USE_ARTCL` varchar(100) DEFAULT NULL COMMENT 'SNS사용항목',
  `SNS_URL_ADDR` varchar(2000) DEFAULT NULL COMMENT 'SNSURL주소',
  `API_ID` varchar(100) DEFAULT NULL COMMENT 'API아이디',
  `API_SECRET_KEY` varchar(100) DEFAULT NULL COMMENT 'API비밀키',
  `API_TOKEN` varchar(100) DEFAULT NULL COMMENT 'API토큰',
  `RSS_URL_ADDR` varchar(2000) DEFAULT NULL COMMENT 'RSS URL주소',
  `USE_YN` char(1) DEFAULT NULL COMMENT 'Y:사용함, N:사용안함',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`SNS_ID`,`SITE_ID`),
  KEY `SITE_ID` (`SITE_ID`),
  CONSTRAINT `TB_SNS_INFO_ibfk_1` FOREIGN KEY (`SITE_ID`) REFERENCES `TB_SITE` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹콘SNS정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_SNS_INFO`
--


--
-- Table structure for table `TB_SRVY`
--

DROP TABLE IF EXISTS `TB_SRVY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_SRVY` (
  `SRVY_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '설문일련번호',
  `SRVY_TTL` varchar(100) DEFAULT NULL COMMENT '제목',
  `SRVY_CN` text DEFAULT NULL COMMENT '내용',
  `SRVY_INQ_CNT` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '설문조회수',
  `ANON_USE_YN` char(1) DEFAULT NULL COMMENT '익명사용여부(Y, N)',
  `BGNG_YMD` varchar(10) DEFAULT NULL COMMENT '시작일자',
  `END_YMD` varchar(10) DEFAULT NULL COMMENT '종료일자',
  `RGTR_ID` varchar(50) DEFAULT NULL COMMENT '등록자아이디',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`SRVY_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='설문';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_SRVY`
--


--
-- Table structure for table `TB_SRVY_AITEM`
--

DROP TABLE IF EXISTS `TB_SRVY_AITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_SRVY_AITEM` (
  `SRVY_AITEM_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '설문답항일련번호',
  `SRVY_QITEM_SN` int(10) unsigned NOT NULL COMMENT '설문문항일련번호',
  `SRVY_AITEM_TTL` varchar(100) DEFAULT NULL COMMENT '설문답항제목',
  `PRGRM_FILE_ID` char(15) DEFAULT NULL COMMENT 'FILE00000000001',
  PRIMARY KEY (`SRVY_AITEM_SN`),
  KEY `SRVY_QITEM_SN` (`SRVY_QITEM_SN`),
  CONSTRAINT `TB_SRVY_AITEM_ibfk_1` FOREIGN KEY (`SRVY_QITEM_SN`) REFERENCES `TB_SRVY_QITEM` (`SRVY_QITEM_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_AITEM_ibfk_2` FOREIGN KEY (`SRVY_QITEM_SN`) REFERENCES `TB_SRVY_QITEM` (`SRVY_QITEM_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_AITEM_ibfk_3` FOREIGN KEY (`SRVY_QITEM_SN`) REFERENCES `TB_SRVY_QITEM` (`SRVY_QITEM_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_AITEM_ibfk_4` FOREIGN KEY (`SRVY_QITEM_SN`) REFERENCES `TB_SRVY_QITEM` (`SRVY_QITEM_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='설문문항항목';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_SRVY_AITEM`
--


--
-- Table structure for table `TB_SRVY_QITEM`
--

DROP TABLE IF EXISTS `TB_SRVY_QITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_SRVY_QITEM` (
  `SRVY_QITEM_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '설문문항일련번호',
  `SRVY_SN` int(10) unsigned NOT NULL COMMENT '설문일련번호',
  `SRVY_QITEM_TTL` varchar(100) DEFAULT NULL COMMENT '설문문항제목',
  PRIMARY KEY (`SRVY_QITEM_SN`),
  KEY `SRVY_SN` (`SRVY_SN`),
  CONSTRAINT `TB_SRVY_QITEM_ibfk_1` FOREIGN KEY (`SRVY_SN`) REFERENCES `TB_SRVY` (`SRVY_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_QITEM_ibfk_2` FOREIGN KEY (`SRVY_SN`) REFERENCES `TB_SRVY` (`SRVY_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_QITEM_ibfk_3` FOREIGN KEY (`SRVY_SN`) REFERENCES `TB_SRVY` (`SRVY_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_QITEM_ibfk_4` FOREIGN KEY (`SRVY_SN`) REFERENCES `TB_SRVY` (`SRVY_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='설문문항';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_SRVY_QITEM`
--


--
-- Table structure for table `TB_SRVY_RSLT`
--

DROP TABLE IF EXISTS `TB_SRVY_RSLT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_SRVY_RSLT` (
  `SRVY_RSLT_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '설문결과시퀀스',
  `SRVY_SN` int(10) unsigned NOT NULL COMMENT '설문일련번호',
  `SRVY_QITEM_SN` int(10) unsigned NOT NULL COMMENT '설문문항일련번호',
  `SRVY_AITEM_SN` int(10) unsigned NOT NULL COMMENT '설문답항일련번호',
  `RGTR_ID` varchar(50) DEFAULT NULL COMMENT '등록자아이디',
  `REG_DT` datetime DEFAULT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`SRVY_RSLT_SN`),
  KEY `SRVY_SN` (`SRVY_SN`),
  KEY `SRVY_AITEM_SN` (`SRVY_AITEM_SN`),
  KEY `SRVY_QITEM_SN` (`SRVY_QITEM_SN`),
  CONSTRAINT `TB_SRVY_RSLT_ibfk_1` FOREIGN KEY (`SRVY_SN`) REFERENCES `TB_SRVY` (`SRVY_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_RSLT_ibfk_10` FOREIGN KEY (`SRVY_SN`) REFERENCES `TB_SRVY` (`SRVY_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_RSLT_ibfk_11` FOREIGN KEY (`SRVY_AITEM_SN`) REFERENCES `TB_SRVY_AITEM` (`SRVY_AITEM_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_RSLT_ibfk_12` FOREIGN KEY (`SRVY_QITEM_SN`) REFERENCES `TB_SRVY_QITEM` (`SRVY_QITEM_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_RSLT_ibfk_2` FOREIGN KEY (`SRVY_AITEM_SN`) REFERENCES `TB_SRVY_AITEM` (`SRVY_AITEM_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_RSLT_ibfk_3` FOREIGN KEY (`SRVY_QITEM_SN`) REFERENCES `TB_SRVY_QITEM` (`SRVY_QITEM_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_RSLT_ibfk_4` FOREIGN KEY (`SRVY_SN`) REFERENCES `TB_SRVY` (`SRVY_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_RSLT_ibfk_5` FOREIGN KEY (`SRVY_AITEM_SN`) REFERENCES `TB_SRVY_AITEM` (`SRVY_AITEM_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_RSLT_ibfk_6` FOREIGN KEY (`SRVY_QITEM_SN`) REFERENCES `TB_SRVY_QITEM` (`SRVY_QITEM_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_RSLT_ibfk_7` FOREIGN KEY (`SRVY_SN`) REFERENCES `TB_SRVY` (`SRVY_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_RSLT_ibfk_8` FOREIGN KEY (`SRVY_AITEM_SN`) REFERENCES `TB_SRVY_AITEM` (`SRVY_AITEM_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TB_SRVY_RSLT_ibfk_9` FOREIGN KEY (`SRVY_QITEM_SN`) REFERENCES `TB_SRVY_QITEM` (`SRVY_QITEM_SN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='설문결과';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_SRVY_RSLT`
--


--
-- Table structure for table `TB_TMPLT`
--

DROP TABLE IF EXISTS `TB_TMPLT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_TMPLT` (
  `TMPLT_SN` int(11) NOT NULL AUTO_INCREMENT COMMENT '템플릿일련번호',
  `TMPLT_SE` varchar(10) DEFAULT NULL COMMENT '템플릿구분',
  `TMPLT_NM` varchar(100) DEFAULT NULL COMMENT '템플릿명',
  `TMPLT_FILE_PATH` varchar(100) DEFAULT NULL COMMENT '템플릿파일경로',
  `TMPLT_PREV_PATH` varchar(100) DEFAULT NULL COMMENT '템플릿미리보기경로',
  `USE_YN` char(1) NOT NULL COMMENT 'Y:사용함, N:사용안함',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`TMPLT_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='웹콘템플릿';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_TMPLT`
--


--
-- Table structure for table `TB_USER`
--

DROP TABLE IF EXISTS `TB_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_USER` (
  `USER_ID` varchar(30) NOT NULL COMMENT '사용자아이디',
  `USER_PSWD` varchar(100) NOT NULL COMMENT '사용자비밀번호',
  `USER_NM` varchar(50) NOT NULL COMMENT '사용자명',
  `AUTHRT_CD` char(8) NOT NULL COMMENT 'AUTH0000',
  `DEPT_CD` char(4) DEFAULT NULL COMMENT '0010',
  `EMP_NO` varchar(6) DEFAULT NULL COMMENT '직원번호',
  `MBL_TELNO` varchar(20) DEFAULT NULL COMMENT '휴대폰번호',
  `EML_ADDR` varchar(320) DEFAULT NULL COMMENT '이메일',
  `USE_YN` char(1) NOT NULL COMMENT 'Y:사용함, N:사용안함',
  `MEMO_CN` varchar(1000) DEFAULT NULL COMMENT '메모내용',
  `APRV_IP_ADDR_LIST` varchar(1000) DEFAULT NULL COMMENT '승인IP주소목록',
  `MNG_SITE_LIST` varchar(1000) DEFAULT NULL COMMENT '관리사이트주소목록',
  `RGTR_ID` varchar(50) NOT NULL COMMENT '등록자아이디',
  `REG_DT` datetime NOT NULL COMMENT '등록일시',
  `MDFR_ID` varchar(50) DEFAULT NULL COMMENT '수정자아이디',
  `MDFCN_DT` datetime DEFAULT NULL COMMENT '수정일시',
  `PUSH_TOKEN` varchar(200) DEFAULT NULL COMMENT 'FCM 푸시 알림 토큰',
  PRIMARY KEY (`USER_ID`),
  KEY `TB_SYS_USER_ibfk_1` (`AUTHRT_CD`),
  CONSTRAINT `TB_SYS_USER_ibfk_1` FOREIGN KEY (`AUTHRT_CD`) REFERENCES `TB_AUTHRT` (`AUTHRT_CD`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹콘사용자';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_USER`
--


--
-- Table structure for table `TB_WORD`
--

DROP TABLE IF EXISTS `TB_WORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_WORD` (
  `WORD_SE` varchar(10) NOT NULL COMMENT '단어구분',
  `WORD_CN` text NOT NULL COMMENT '단어1,단어2 콤마구분',
  PRIMARY KEY (`WORD_SE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='웹콘단어';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_WORD`
--


--
-- Dumping routines for database 'wcon_lite'
--
/*!50003 DROP FUNCTION IF EXISTS `TB_FNC_CMM_CD_NM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  FUNCTION `TB_FNC_CMM_CD_NM`(

	`IN_UP_CMM_CD` CHAR(4),

	`IN_CMM_CD` CHAR(4)

) RETURNS varchar(50) CHARSET utf8
BEGIN

		DECLARE OUT_DATA VARCHAR(50);

		

        SELECT CMM_CD_NM

          INTO OUT_DATA

          FROM TB_CMM_CD

         WHERE UP_CMM_CD = IN_UP_CMM_CD

           AND CMM_CD = IN_CMM_CD;

           

        RETURN OUT_DATA;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TB_FNC_GET_FIRST_PRGRM_PATH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  FUNCTION `TB_FNC_GET_FIRST_PRGRM_PATH`(

	`IN_MENU_SN` CHAR(5),

	`IN_SITE_ID` VARCHAR(30),

	`IN_TYPE` VARCHAR(50)

) RETURNS varchar(100) CHARSET utf8
BEGIN

        DECLARE OUT_DATA VARCHAR(100);

		  DECLARE V_PRGRM_PATH VARCHAR(100);

		  DECLARE V_MENU_SN VARCHAR(100);

		  

        WITH RECURSIVE CTE AS (

			  SELECT MENU_SN

			        ,SITE_ID

			        ,MENU_UP_SN

			        ,MENU_NM

					,MENU_SE_CD

					,BBS_ID

					,PRGRM_ID

					,CONTS_ID

					,LNKG_URL

					,1 AS NDEPTH

			        ,CAST(SORT_SN AS CHAR(20)) SORT

			    FROM TB_MENU WHERE MENU_SN=IN_MENU_SN

			    						AND SITE_ID = IN_SITE_ID

			  UNION ALL

			  SELECT A.MENU_SN

			        ,A.SITE_ID

			        ,A.MENU_UP_SN

			        ,A.MENU_NM

					,A.MENU_SE_CD

					,A.BBS_ID

					,A.PRGRM_ID

					,A.CONTS_ID

					,A.LNKG_URL

					,NDEPTH + 1 AS NDEPTH

			        ,CONCAT(CAST(B.SORT AS CHAR(20)), CONCAT(REPEAT('0', 2-CHAR_LENGTH(CAST(A.SORT_SN AS CHAR(20)))), A.SORT_SN)) SORT

			    FROM TB_MENU A, CTE B

			      WHERE A.MENU_UP_SN = B.MENU_SN						

					AND A.SITE_ID = IN_SITE_ID

			)

			  SELECT CASE WHEN CTE.MENU_SE_CD = '0010' THEN ( SELECT PRGRM_PATH FROM TB_PRGRM WHERE PRGRM_ID = CTE.PRGRM_ID) 

			  				  WHEN CTE.MENU_SE_CD = '0020' THEN CTE.BBS_ID

		  				     WHEN CTE.MENU_SE_CD = '0030' THEN CTE.CONTS_ID

		  				     WHEN CTE.MENU_SE_CD = '0040' THEN CTE.LNKG_URL

		  				ELSE ''

						END AS PRGRM_PATH		  				     

				 , CTE.MENU_SN

		     INTO V_PRGRM_PATH, V_MENU_SN

			 FROM CTE 

			 WHERE MENU_SE_CD != '0000'

			 ORDER BY SORT ASC

			 LIMIT 1;

		

		IF IN_TYPE = 'MENU_SN' THEN

			SET OUT_DATA = V_MENU_SN;

		ELSE

			SET OUT_DATA = V_PRGRM_PATH;

		END IF;

		

		RETURN OUT_DATA;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-26  7:58:30
