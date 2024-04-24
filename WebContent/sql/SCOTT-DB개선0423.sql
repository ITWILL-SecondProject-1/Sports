CREATE TABLE SPORT_USER (
    USERIDX NUMBER(10)	PRIMARY KEY,
	EMAIL	VARCHAR2(30) UNIQUE,
	NICKNAME	VARCHAR2(30),
	PASSWORD	VARCHAR2(30),
	PHONE	VARCHAR2(20),
	GENDER	VARCHAR2(10),
    IMAGE	VARCHAR2(200),
    IMAGE_PI VARCHAR2(100),
    JOIN_DATE DATE,
    LEAVE_DATE DATE,
    MANAGER VARCHAR2(10)
);

CREATE TABLE FACILITY (
	FACILITY_IDX	NUMBER(10)	PRIMARY KEY,
	FACILITY_NAME	VARCHAR2(100),
	ADDRESS	VARCHAR2(100),
	PHONE_NUMBER	VARCHAR2(20),
	EVENT	VARCHAR2(100),
	IMAGE_IDX NUMBER(10),
    OPEN_TIME NUMBER(3),
    CLOSE_TIME NUMBER(3)
);

CREATE TABLE FACILITY_RESERVE (
	FACILITY_IDX	NUMBER(10) REFERENCES FACILITY (FACILITY_IDX),
	USERIDX	NUMBER(10) REFERENCES SPORT_USER (USERIDX),
	RESERVE VARCHAR2(20)
);

CREATE TABLE TEAMS (
	TEAM_IDX	NUMBER(10)	PRIMARY KEY,
	USERIDX NUMBER(10)  REFERENCES SPORT_USER (USERIDX),
	JOIN_CHECK	VARCHAR2(10),
	TEAM_NAME	VARCHAR2(100),
	IMAGE_IDX NUMBER(10),
    START_DATE DATE,
    END_DATE DATE
);

CREATE TABLE TEAM_MEMBER (
	TEAM_IDX	NUMBER(10)	REFERENCES TEAMS (TEAM_IDX),
	USERIDX	NUMBER(10) REFERENCES SPORT_USER (USERIDX),
	JOIN_DATE	DATE,
    LEAVE_DATE DATE,
    TEAM_MANAGER VARCHAR2(10)
);

CREATE TABLE FREE_BBS (
	BBS_IDX	NUMBER(10)	PRIMARY KEY,
	USERIDX	NUMBER(10)	REFERENCES SPORT_USER (USERIDX),
	SUBJECT	VARCHAR2(1000),
	CONTENT	VARCHAR2(3000),
	WRITE_DATE	DATE,
	IMAGE_IDX NUMBER(10),
    HIT  NUMBER(10)
);

CREATE TABLE FREE_COMMENTS (
	COMMENT_IDX	NUMBER(10)	PRIMARY KEY,
	USERIDX	NUMBER(10)	REFERENCES SPORT_USER (USERIDX),
	BBS_IDX	NUMBER(10)	REFERENCES FREE_BBS (BBS_IDX),
	CONTENT	VARCHAR2(1000),
	WRITE_DATE	DATE
);

CREATE TABLE JOIN_BBS (
	BBS_IDX	NUMBER(10)	PRIMARY KEY,
	USERIDX	NUMBER(10)	REFERENCES SPORT_USER (USERIDX),
	TEAM_IDX	NUMBER(10)	REFERENCES TEAMS (TEAM_IDX),
	SUBJECT	VARCHAR2(1000),
	TIME	VARCHAR2(1000),
	MEMBER_MAX	VARCHAR2(1000),
	LIMIT	VARCHAR2(1000),
	PLACE	VARCHAR2(1000),
	EVENT	VARCHAR2(1000),
	CONTENT	VARCHAR2(3000),
	WRITE_DATE	DATE,
	IMAGE_IDX NUMBER(10),
	TEAM_NAME	VARCHAR2(100),
    HIT  NUMBER(10)
);

CREATE TABLE JOIN_COMMENTS (
	COMMENT_IDX	NUMBER(10)	PRIMARY KEY,
	BBS_IDX	NUMBER(10)	REFERENCES JOIN_BBS (BBS_IDX),
	USERIDX	NUMBER(10)	REFERENCES SPORT_USER (USERIDX),
	CONTENT	VARCHAR2(1000),
	WRITE_DATE	DATE
);

CREATE TABLE TEAM_BBS (
    BBS_IDX	NUMBER(10)	PRIMARY KEY,
	USERIDX	NUMBER(10)	REFERENCES SPORT_USER (USERIDX),
    TEAM_IDX NUMBER(10)	REFERENCES TEAMS (TEAM_IDX),
	SUBJECT	VARCHAR2(1000),
	CONTENT	VARCHAR2(3000),
	WRITE_DATE	DATE,
	IMAGE_IDX NUMBER(10),
    HIT  NUMBER(10)
);

CREATE TABLE TEAM_COMMENTS (
	COMMENT_IDX	NUMBER(10)	PRIMARY KEY,
	USERIDX	NUMBER(10)	REFERENCES SPORT_USER (USERIDX),
	BBS_IDX	NUMBER(10)	REFERENCES FREE_BBS (BBS_IDX),
	CONTENT	VARCHAR2(1000),
	WRITE_DATE	DATE
);


CREATE TABLE TEAM_SIGNUP (
    SIGNUP_IDX 	NUMBER(10)	PRIMARY KEY,
    TEAM_IDX	REFERENCES TEAMS (TEAM_IDX),
    USERIDX	NUMBER(10)	REFERENCES SPORT_USER (USERIDX),
    SIGNUP_CHECK VARCHAR2(1),
    SIGNUP_DATE DATE
);
    
CREATE TABLE IMAGES (
    IMAGE_IDX 	NUMBER(10)	PRIMARY KEY,
    IMAGE	VARCHAR2(100),
    IMAGE_PI VARCHAR2(100)
);
/*-----------------------------------
CREATE SEQUENCE SEQ_USERIDX;
CREATE SEQUENCE SEQ_FACILITY_IDX;
CREATE SEQUENCE SEQ_FREE_BBS_IDX;
CREATE SEQUENCE SEQ_FREE_COMMENT_IDX;
CREATE SEQUENCE SEQ_JOIN_BBS_IDX;
CREATE SEQUENCE SEQ_JOIN_COMMENT_IDX;
CREATE SEQUENCE SEQ_TEAM_IDX;
CREATE SEQUENCE SEQ_TEAM_COMMENTS;
CREATE SEQUENCE SEQ_SIGNUP_IDX;
CREATE SEQUENCE SEQ_IMAGE_IDX;
-----------------------------------
DROP TABLE SPORT_USER CASCADE CONSTRAINTS;
DROP TABLE FACILITY CASCADE CONSTRAINTS;
DROP TABLE FACILITY_RESERVE;
DROP TABLE FREE_BBS CASCADE CONSTRAINTS;
DROP TABLE FREE_COMMENTS;
DROP TABLE JOIN_BBS CASCADE CONSTRAINTS;
DROP TABLE JOIN_COMMENTS;
DROP TABLE TEAMS CASCADE CONSTRAINTS;
DROP TABLE TEAM_MEMBER;
DROP TABLE TEAM_BBS;
DROP TABLE TEAM_COMMENTS;
DROP TABLE TEAM_SIGNUP;
DROP TABLE IMAGE;
-------------------------------------
DROP SEQUENCE SEQ_USERIDX;
DROP SEQUENCE SEQ_FACILITY_IDX;
DROP SEQUENCE SEQ_FREE_BBS_IDX;
DROP SEQUENCE SEQ_FREE_COMMENT_IDX;
DROP SEQUENCE SEQ_JOIN_BBS_IDX;
DROP SEQUENCE SEQ_JOIN_COMMENT_IDX;
DROP SEQUENCE SEQ_TEAM_IDX;
DROP SEQUENCE SEQ_TEAM_COMMENTS;
DROP SEQUENCE SEQ_IMAGE_IDX;
DROP SEQUENCE SEQ_SIGNUP_IDX;
----------------------------------*/