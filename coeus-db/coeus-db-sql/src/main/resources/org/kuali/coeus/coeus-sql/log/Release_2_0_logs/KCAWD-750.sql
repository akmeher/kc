ALTER TABLE AWARD_BUDGET_EXT 
    ADD OBLIGATED_AMOUNT NUMBER(12,2); 

CREATE TABLE AWARD_BUDGET_PERIOD_EXT (
	BUDGET_PERIOD_NUMBER NUMBER(12,0),
    OBLIGATED_AMOUNT NUMBER(12,0),
    VER_NBR NUMBER (8, 0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2 (36 BYTE) DEFAULT SYS_GUID () NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2 (60 BYTE) NOT NULL) ;

ALTER TABLE AWARD_BUDGET_PERIOD_EXT 
    ADD CONSTRAINT AWARD_BUDGET_PERIOD_EXT_PK 
            PRIMARY KEY (BUDGET_PERIOD_NUMBER) ;
            
ALTER TABLE AWARD_BUDGET_PERIOD_EXT 
	ADD CONSTRAINT AWARD_BUDGET_PERIOD_EXT 
	FOREIGN KEY (BUDGET_PERIOD_NUMBER) 
	REFERENCES BUDGET_PERIODS (BUDGET_PERIOD_NUMBER);
	
    
ALTER TABLE BUDGET_DETAILS ADD BUDGET_DETAILS_ID NUMBER(12,0); 
ALTER TABLE BUDGET_DETAILS DROP PRIMARY KEY cascade;
delete from budget_details;
ALTER TABLE BUDGET_DETAILS  
			ADD CONSTRAINT BUDGET_DETAILS_PK 
            PRIMARY KEY (BUDGET_DETAILS_ID) ;
 
CREATE TABLE AWARD_BUDGET_DETAILS_EXT (
	BUDGET_DETAILS_ID NUMBER(12,0),
    OBLIGATED_AMOUNT NUMBER(12,0),
    VER_NBR NUMBER (8, 0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2 (36 BYTE) DEFAULT SYS_GUID () NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2 (60 BYTE) NOT NULL) ;

ALTER TABLE AWARD_BUDGET_DETAILS_EXT 
    ADD CONSTRAINT AWARD_BUDGET_DETAILS_EXT_PK 
            PRIMARY KEY (BUDGET_DETAILS_ID) ;
            
ALTER TABLE AWARD_BUDGET_DETAILS_EXT 
	ADD CONSTRAINT FK_AWARD_BUDGET_DETAILS_EXT 
	FOREIGN KEY (BUDGET_DETAILS_ID) 
	REFERENCES BUDGET_DETAILS (BUDGET_DETAILS_ID);
	
ALTER TABLE BUDGET_DETAILS_CAL_AMTS ADD BUDGET_DETAILS_CAL_AMTS_ID NUMBER(12,0); 
ALTER TABLE BUDGET_DETAILS_CAL_AMTS DROP PRIMARY KEY cascade;
delete from budget_rate_and_base;
delete from budget_details_cal_amts;
ALTER TABLE BUDGET_DETAILS_CAL_AMTS  
			ADD CONSTRAINT BUDGET_DETAILS_CAL_AMTS_PK 
            PRIMARY KEY (BUDGET_DETAILS_CAL_AMTS_ID) ;
ALTER TABLE BUDGET_DETAILS_CAL_AMTS ADD BUDGET_DETAILS_ID NUMBER(12,0); 
ALTER TABLE BUDGET_DETAILS_CAL_AMTS 
	ADD CONSTRAINT FK1_BUDGET_DETAILS_CAL_AMTS 
	FOREIGN KEY (BUDGET_DETAILS_ID) 
	REFERENCES BUDGET_DETAILS (BUDGET_DETAILS_ID);
---
ALTER TABLE BUDGET_RATE_AND_BASE ADD BUDGET_RATE_AND_BASE_ID NUMBER(12,0); 
ALTER TABLE BUDGET_RATE_AND_BASE DROP PRIMARY KEY;
ALTER TABLE BUDGET_RATE_AND_BASE  
			ADD CONSTRAINT BUDGET_RATE_AND_BASE_PK 
            PRIMARY KEY (BUDGET_RATE_AND_BASE_ID) ;
ALTER TABLE BUDGET_RATE_AND_BASE ADD BUDGET_DETAILS_CAL_AMTS_ID NUMBER(12,0); 
ALTER TABLE BUDGET_RATE_AND_BASE 
	ADD CONSTRAINT FK2_BUDGET_RATE_AND_BASE 
	FOREIGN KEY (BUDGET_DETAILS_CAL_AMTS_ID) 
	REFERENCES BUDGET_DETAILS_CAL_AMTS (BUDGET_DETAILS_CAL_AMTS_ID);
ALTER TABLE BUDGET_RATE_AND_BASE ADD BUDGET_DETAILS_ID NUMBER(12,0); 
ALTER TABLE BUDGET_RATE_AND_BASE 
	ADD CONSTRAINT FK1_BUDGET_RATE_AND_BASE 
	FOREIGN KEY (BUDGET_DETAILS_ID) 
	REFERENCES BUDGET_DETAILS (BUDGET_DETAILS_ID);
---

CREATE TABLE AWD_BGT_DET_CAL_AMTS_EXT (
	BUDGET_DETAILS_CAL_AMTS_ID NUMBER(12,0),
    OBLIGATED_AMOUNT NUMBER(12,0),
    VER_NBR NUMBER (8, 0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2 (36 BYTE) DEFAULT SYS_GUID () NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2 (60 BYTE) NOT NULL) ;

ALTER TABLE AWD_BGT_DET_CAL_AMTS_EXT 
    ADD CONSTRAINT AWD_BGT_DET_CAL_AMTS_EXT_PK 
            PRIMARY KEY (BUDGET_DETAILS_CAL_AMTS_ID) ;

ALTER TABLE AWD_BGT_DET_CAL_AMTS_EXT 
	ADD CONSTRAINT FK_AWD_BGT_DET_CAL_AMTS_EXT 
	FOREIGN KEY (BUDGET_DETAILS_CAL_AMTS_ID) 
	REFERENCES BUDGET_DETAILS_CAL_AMTS (BUDGET_DETAILS_CAL_AMTS_ID);
    
ALTER TABLE BUDGET_PERSONNEL_DETAILS ADD BUDGET_PERSONNEL_DETAILS_ID NUMBER(12,0); 
ALTER TABLE BUDGET_PERSONNEL_DETAILS DROP primary key cascade;
delete from budget_personnel_details;	
ALTER TABLE BUDGET_PERSONNEL_DETAILS  
			ADD CONSTRAINT BUDGET_PERSONNEL_DETAILS_PK 
            PRIMARY KEY (BUDGET_PERSONNEL_DETAILS_ID) ;
ALTER TABLE BUDGET_PERSONNEL_DETAILS ADD BUDGET_DETAILS_ID NUMBER(12,0); 
ALTER TABLE BUDGET_PERSONNEL_DETAILS 
	ADD CONSTRAINT FK1_BUDGET_PERSONNEL_DETAILS 
	FOREIGN KEY (BUDGET_DETAILS_ID) 
	REFERENCES BUDGET_DETAILS (BUDGET_DETAILS_ID);
 
CREATE TABLE AWD_BUDGET_PER_DET_EXT (
	BUDGET_PERSONNEL_DETAILS_ID NUMBER(12,0),
    OBLIGATED_AMOUNT NUMBER(12,0),
    VER_NBR NUMBER (8, 0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2 (36 BYTE) DEFAULT SYS_GUID () NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2 (60 BYTE) NOT NULL) ;

ALTER TABLE AWD_BUDGET_PER_DET_EXT 
    ADD CONSTRAINT AWD_BGT_PER_DET_EXT_PK 
            PRIMARY KEY (BUDGET_PERSONNEL_DETAILS_ID) ;

ALTER TABLE AWD_BUDGET_PER_DET_EXT 
	ADD CONSTRAINT FK_AWD_BUDGET_PER_DET_EXT 
	FOREIGN KEY (BUDGET_PERSONNEL_DETAILS_ID) 
	REFERENCES BUDGET_PERSONNEL_DETAILS (BUDGET_PERSONNEL_DETAILS_ID);

ALTER TABLE BUDGET_PERSONNEL_CAL_AMTS ADD BUDGET_PERSONNEL_CAL_AMTS_ID NUMBER(12,0); 
ALTER TABLE BUDGET_PERSONNEL_CAL_AMTS DROP PRIMARY KEY cascade;
delete from budget_per_det_rate_and_base;
delete from budget_personnel_cal_amts;	
ALTER TABLE BUDGET_PERSONNEL_CAL_AMTS  
			ADD CONSTRAINT BUDGET_PERSONNEL_CAL_AMTS_PK 
            PRIMARY KEY (BUDGET_PERSONNEL_CAL_AMTS_ID) ;
ALTER TABLE BUDGET_PERSONNEL_CAL_AMTS ADD BUDGET_PERSONNEL_DETAILS_ID NUMBER(12,0); 
ALTER TABLE BUDGET_PERSONNEL_CAL_AMTS 
	ADD CONSTRAINT FK1_BUDGET_PERSONNEL_CAL_AMTS 
	FOREIGN KEY (BUDGET_PERSONNEL_DETAILS_ID) 
	REFERENCES BUDGET_PERSONNEL_DETAILS (BUDGET_PERSONNEL_DETAILS_ID);

---	
ALTER TABLE BUDGET_PER_DET_RATE_AND_BASE ADD BGT_PER_DET_RATE_AND_BASE_ID NUMBER(12,0); 
ALTER TABLE BUDGET_PER_DET_RATE_AND_BASE DROP PRIMARY KEY;
ALTER TABLE BUDGET_PER_DET_RATE_AND_BASE  
			ADD CONSTRAINT BGT_PER_DET_RATE_AND_BASE_PK 
            PRIMARY KEY (BGT_PER_DET_RATE_AND_BASE_ID) ;
ALTER TABLE BUDGET_PER_DET_RATE_AND_BASE ADD BUDGET_PERSONNEL_DETAILS_ID NUMBER(12,0); 
ALTER TABLE BUDGET_PER_DET_RATE_AND_BASE 
	ADD CONSTRAINT FK1_BGT_PER_DET_RATE_AND_BASE 
	FOREIGN KEY (BUDGET_PERSONNEL_DETAILS_ID) 
	REFERENCES BUDGET_PERSONNEL_DETAILS (BUDGET_PERSONNEL_DETAILS_ID);
ALTER TABLE BUDGET_PER_DET_RATE_AND_BASE ADD BUDGET_PERSONNEL_CAL_AMTS_ID NUMBER(12,0); 
ALTER TABLE BUDGET_PER_DET_RATE_AND_BASE 
	ADD CONSTRAINT FK_BGT_PER_DET_RATE_AND_BASE 
	FOREIGN KEY (BUDGET_PERSONNEL_CAL_AMTS_ID) 
	REFERENCES BUDGET_PERSONNEL_CAL_AMTS (BUDGET_PERSONNEL_CAL_AMTS_ID);
---	

CREATE TABLE AWD_BUDGET_PER_CAL_AMTS_EXT (
	BUDGET_PERSONNEL_CAL_AMTS_ID NUMBER(12,0),
    OBLIGATED_AMOUNT NUMBER(12,0),
    VER_NBR NUMBER (8, 0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2 (36 BYTE) DEFAULT SYS_GUID () NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2 (60 BYTE) NOT NULL) ;

ALTER TABLE AWD_BUDGET_PER_CAL_AMTS_EXT 
    ADD CONSTRAINT AWD_BUDGET_PER_CAL_AMTS_EXT_PK 
            PRIMARY KEY (BUDGET_PERSONNEL_CAL_AMTS_ID) ;

ALTER TABLE AWD_BUDGET_PER_CAL_AMTS_EXT 
	ADD CONSTRAINT FK_AWD_BGT_PER_CAL_AMTS_EXT 
	FOREIGN KEY (BUDGET_PERSONNEL_CAL_AMTS_ID) 
	REFERENCES BUDGET_PERSONNEL_CAL_AMTS (BUDGET_PERSONNEL_CAL_AMTS_ID);

	

CREATE SEQUENCE  SEQ_BUDGET_DETAILS_ID  MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 START WITH 9 NOCACHE  ORDER  NOCYCLE ;
CREATE SEQUENCE  SEQ_BUDGET_DETAILS_CAL_AMTS_ID  MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 START WITH 9 NOCACHE  ORDER  NOCYCLE ;
CREATE SEQUENCE  SEQ_BUDGET_PER_DET_ID  MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 START WITH 9 NOCACHE  ORDER  NOCYCLE ;
CREATE SEQUENCE  SEQ_BUDGET_PER_CAL_AMTS_ID  MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 START WITH 9 NOCACHE  ORDER  NOCYCLE ;
CREATE SEQUENCE  SEQ_BUDGET_RATE_AND_BASE_ID  MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 START WITH 9 NOCACHE  ORDER  NOCYCLE ;
CREATE SEQUENCE  SEQ_BGT_PER_DET_RATE_BASE_ID  MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 START WITH 9 NOCACHE  ORDER  NOCYCLE ;
 	

CREATE TABLE EPS_PROPOSAL_BUDGET_EXT (
    BUDGET_ID NUMBER (12, 0) NOT NULL ENABLE, 
    FINAL_VERSION_FLAG VARCHAR2 (1), 
    VER_NBR NUMBER (8, 0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2 (36 BYTE) DEFAULT SYS_GUID () NOT NULL, 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2 (60 BYTE) NOT NULL) ;

ALTER TABLE EPS_PROPOSAL_BUDGET_EXT 
    ADD CONSTRAINT EPS_PROPOSAL_BUDGET_EXT_PK 
            PRIMARY KEY (BUDGET_ID) ;
  
  ALTER TABLE EPS_PROPOSAL_BUDGET_EXT 
	ADD CONSTRAINT FK_EPS_PROPOSAL_BUDGET_EXT 
	FOREIGN KEY (BUDGET_ID) 
	REFERENCES BUDGET (BUDGET_ID);
