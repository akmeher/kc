DROP TABLE QUESTION_EXPLANATION;
DROP TABLE QUESTIONNAIRE_ANSWER;
DROP TABLE QUESTIONNAIRE_QUESTIONS;
DROP TABLE QUESTION;

-- ***** QUESTION *****
-- Table Script 
CREATE TABLE QUESTION (
    QUESTION_REF_ID NUMBER(12,0) NOT NULL,
    QUESTION_ID NUMBER(6,0) NOT NULL,
    SEQUENCE_NUMBER NUMBER(4,0) NOT NULL,
    QUESTION VARCHAR2(2000) NOT NULL, 
    STATUS CHAR(1) NOT NULL,
    GROUP_TYPE_CODE NUMBER(3,0) NOT NULL, 
    QUESTION_TYPE_ID NUMBER(12,0) NOT NULL, 
    LOOKUP_CLASS VARCHAR2(100), 
    LOOKUP_RETURN VARCHAR2(30), 
    DISPLAYED_ANSWERS NUMBER(2,0),
    MAX_ANSWERS NUMBER(2,0),
    ANSWER_MAX_LENGTH NUMBER(4,0), 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL);


-- Primary Key Constraint 
ALTER TABLE QUESTION 
ADD CONSTRAINT PK_QUESTION 
PRIMARY KEY (QUESTION_REF_ID);

/* *************** UNIQUE CONSTRAINT DEFINED FOR COMPOSITE KEY COLUMNS ************ */ 
ALTER TABLE QUESTION 
ADD CONSTRAINT UQ_QUESTION_ID
UNIQUE (QUESTION_ID, SEQUENCE_NUMBER);


-- ***** QUESTIONNAIRE_QUESTIONS *****
-- Table Script 
CREATE TABLE QUESTIONNAIRE_QUESTIONS ( 
    QUESTIONNAIRE_QUESTIONS_ID NUMBER(12,0) NOT NULL, 
    QUESTIONNAIRE_ID NUMBER(6,0) NOT NULL, 
    QUESTION_REF_ID_FK NUMBER (12,0) NOT NULL, 
    QUESTION_NUMBER NUMBER(6,0) NOT NULL, 
    PARENT_QUESTION_NUMBER NUMBER(6,0) NOT NULL, 
    CONDITION_FLAG VARCHAR2(1) NOT NULL, 
    CONDITION VARCHAR2(50), 
    CONDITION_VALUE VARCHAR2(2000), 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    QUESTION_SEQ_NUMBER NUMBER(3,0), 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL);


-- Primary Key Constraint 
ALTER TABLE QUESTIONNAIRE_QUESTIONS 
ADD CONSTRAINT PK_QUESTIONNAIRE_QUESTIONS 
PRIMARY KEY (QUESTIONNAIRE_QUESTIONS_ID);

-- *************** MODIFIED PRIMARY KEY COLUMN - Introduced new primary key for existing composite key ************ 
-- ALTER TABLE QUESTIONNAIRE_QUESTIONS 
-- ADD CONSTRAINT PK_QUESTIONNAIRE_QUESTIONS 
-- PRIMARY KEY (QUESTIONNAIRE_ID, QUESTION_NUMBER);
-- *************** MODIFIED PRIMARY KEY COLUMN - Introduced new primary key for existing composite key ************ 
 

-- *************** UNIQUE CONSTRAINT DEFINED FOR COMPOSITE KEY COLUMNS ************ 
ALTER TABLE QUESTIONNAIRE_QUESTIONS 
ADD CONSTRAINT UQ_QUESTIONNAIRE_QUESTIONS 
UNIQUE (QUESTIONNAIRE_ID, QUESTION_NUMBER);

-- Foreign Key Constraint(s)
ALTER TABLE QUESTIONNAIRE_QUESTIONS 
ADD CONSTRAINT FK_QUESTIONNAIRE_QUESTIONS 
FOREIGN KEY (QUESTION_REF_ID_FK) 
REFERENCES QUESTION (QUESTION_REF_ID);

ALTER TABLE QUESTIONNAIRE_QUESTIONS 
ADD CONSTRAINT FK_QUESTIONNAIRE_QUESTIONNAIRE 
FOREIGN KEY (QUESTIONNAIRE_ID) 
REFERENCES QUESTIONNAIRE (QUESTIONNAIRE_ID);


-- ***** QUESTIONNAIRE_ANSWER *****
-- Table Script 
CREATE TABLE QUESTIONNAIRE_ANSWER ( 
    QUESTIONNAIRE_ANSWER_ID NUMBER(12,0) NOT NULL, 
    QUESTIONNAIRE_AH_ID_FK NUMBER(12,0) NOT NULL, 
    QUESTION_REF_ID_FK NUMBER(12,0) NOT NULL, 
    QUESTION_NUMBER NUMBER(6,0) NOT NULL, 
    ANSWER_NUMBER NUMBER(3,0) NOT NULL, 
    ANSWER VARCHAR2(2000), 
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL);


-- Primary Key Constraint 
ALTER TABLE QUESTIONNAIRE_ANSWER 
ADD CONSTRAINT PK_QUESTIONNAIRE_ANSWER 
PRIMARY KEY (QUESTIONNAIRE_ANSWER_ID);

-- *************** MODIFIED PRIMARY KEY COLUMN - Introduced new primary key for existing composite key ************ 
-- ALTER TABLE QUESTIONNAIRE_ANSWER 
-- ADD CONSTRAINT PK_QUESTIONNAIRE_ANSWER
-- PRIMARY KEY (QUESTIONNAIRE_AH_ID_FK, QUESTION_NUMBER, ANSWER_NUMBER);
-- *************** MODIFIED PRIMARY KEY COLUMN - Introduced new primary key for existing composite key ************ 
 

-- *************** UNIQUE CONSTRAINT DEFINED FOR COMPOSITE KEY COLUMNS ************ 
ALTER TABLE QUESTIONNAIRE_ANSWER 
ADD CONSTRAINT UQ_QUESTIONNAIRE_ANSWER 
UNIQUE (QUESTIONNAIRE_AH_ID_FK, QUESTION_NUMBER, ANSWER_NUMBER);

-- Foreign Key Constraint(s)
ALTER TABLE QUESTIONNAIRE_ANSWER 
ADD CONSTRAINT FK_QUESTIONNAIRE_ANS_COMP_ID 
FOREIGN KEY (QUESTIONNAIRE_AH_ID_FK) 
REFERENCES QUESTIONNAIRE_ANSWER_HEADER (QUESTIONNAIRE_ANSWER_HEADER_ID);

--ALTER TABLE QUESTIONNAIRE_ANSWER 
--ADD CONSTRAINT FK_QUESTIONNAIRE_ANS_QID 
--FOREIGN KEY (QUESTION_REF_ID_FK) 
--REFERENCES QUESTION (QUESTION_REF_ID);


-- ***** QUESTION_EXPLANATION *****
-- Table Script
CREATE TABLE QUESTION_EXPLANATION ( 
    QUESTION_EXPLANATION_ID NUMBER(12,0) NOT NULL, 
    QUESTION_REF_ID_FK NUMBER(12,0) NOT NULL, 
    EXPLANATION_TYPE CHAR(1) NOT NULL, 
    EXPLANATION CLOB, 
    UPDATE_TIMESTAMP DATE NOT NULL,
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) DEFAULT SYS_GUID() NOT NULL);


-- Primary Key Constraint
ALTER TABLE QUESTION_EXPLANATION 
ADD CONSTRAINT PK_QUESTION_EXPLANATION 
PRIMARY KEY (QUESTION_EXPLANATION_ID);

-- *************** UNIQUE CONSTRAINT DEFINED FOR COMPOSITE KEY COLUMNS ************
ALTER TABLE QUESTION_EXPLANATION 
ADD CONSTRAINT UQ_QUESTION_EXPLANATION 
UNIQUE (QUESTION_REF_ID_FK, EXPLANATION_TYPE);

-- Foreign Key Constraint(s)
ALTER TABLE QUESTION_EXPLANATION 
ADD CONSTRAINT FK_QUESTION_EXPLANATION
FOREIGN KEY (QUESTION_REF_ID_FK) 
REFERENCES QUESTION (QUESTION_REF_ID);



-- View for Coeus compatibility 
CREATE OR REPLACE VIEW OSP$QUESTION AS SELECT 
    QUESTION.QUESTION_ID, 
    QUESTION.QUESTION, 
    QUESTION.MAX_ANSWERS, 
    NULL AS VALID_ANSWER, 
    QUESTION.LOOKUP_RETURN AS LOOKUP_NAME, 
    QUESTION_TYPES.QUESTION_TYPE_NAME AS ANSWER_DATA_TYPE, 
    QUESTION.ANSWER_MAX_LENGTH, 
    QUESTION.LOOKUP_CLASS AS LOOKUP_GUI, 
    QUESTION.UPDATE_TIMESTAMP, 
    QUESTION.UPDATE_USER, 
    QUESTION.GROUP_TYPE_CODE
FROM QUESTION,
     QUESTION_TYPES
WHERE QUESTION.QUESTION_TYPE_ID = QUESTION_TYPES.QUESTION_TYPE_ID;

-- View for Coeus compatibility 
CREATE OR REPLACE VIEW OSP$QUESTIONNAIRE_QUESTIONS AS SELECT 
    QUESTIONNAIRE_QUESTIONS.QUESTIONNAIRE_ID, 
    QUESTION.QUESTION_ID, 
    QUESTIONNAIRE_QUESTIONS.QUESTION_NUMBER, 
    QUESTIONNAIRE_QUESTIONS.PARENT_QUESTION_NUMBER, 
    QUESTIONNAIRE_QUESTIONS.CONDITION_FLAG, 
    QUESTIONNAIRE_QUESTIONS.CONDITION, 
    QUESTIONNAIRE_QUESTIONS.CONDITION_VALUE, 
    QUESTIONNAIRE_QUESTIONS.UPDATE_TIMESTAMP, 
    QUESTIONNAIRE_QUESTIONS.UPDATE_USER, 
    QUESTIONNAIRE_QUESTIONS.QUESTION_SEQ_NUMBER
FROM QUESTIONNAIRE_QUESTIONS,
     QUESTION
WHERE QUESTION.QUESTION_REF_ID = QUESTIONNAIRE_QUESTIONS.QUESTION_REF_ID_FK;

-- View for Coeus compatibility 
CREATE OR REPLACE VIEW OSP$QUESTIONNAIRE_ANSWERS AS SELECT 
    QUESTIONNAIRE_ANSWER.QUESTIONNAIRE_AH_ID_FK, 
    QUESTION.QUESTION_ID, 
    QUESTIONNAIRE_ANSWER.QUESTION_NUMBER, 
    QUESTIONNAIRE_ANSWER.ANSWER_NUMBER, 
    QUESTIONNAIRE_ANSWER.ANSWER, 
    QUESTIONNAIRE_ANSWER.UPDATE_TIMESTAMP, 
    QUESTIONNAIRE_ANSWER.UPDATE_USER
FROM QUESTIONNAIRE_ANSWER,
     QUESTION
WHERE QUESTION.QUESTION_REF_ID = QUESTIONNAIRE_ANSWER.QUESTION_REF_ID_FK;


-- View for Coeus compatibility 
CREATE OR REPLACE VIEW OSP$QUESTION_EXPLANATION AS SELECT 
    QUESTION.QUESTION_ID, 
    QUESTION_EXPLANATION.EXPLANATION_TYPE, 
    QUESTION_EXPLANATION.EXPLANATION, 
    QUESTION_EXPLANATION.UPDATE_TIMESTAMP, 
    QUESTION_EXPLANATION.UPDATE_USER
FROM QUESTION_EXPLANATION,
     QUESTION
WHERE QUESTION.QUESTION_REF_ID = QUESTION_EXPLANATION.QUESTION_REF_ID_FK;




