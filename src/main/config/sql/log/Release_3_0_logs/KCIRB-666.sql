ALTER TABLE PROTOCOL_VOTE_ABSTAINEES
MODIFY ("PERSON_ID" VARCHAR2(11 BYTE)); 

CREATE TABLE PROTOCOL_VOTE_RECUSED
(
  PROTOCOL_VOTE_RECUSED_ID NUMBER(12, 0) NOT NULL,
  PROTOCOL_ID_FK NUMBER(12) NOT NULL,
  SCHEDULE_ID_FK NUMBER(12) NOT NULL,
  PERSON_ID VARCHAR2(11) NOT NULL,
  NON_EMPLOYEE_FLAG VARCHAR2(1) NOT NULL,
  COMMENTS VARCHAR2(2000),
  UPDATE_TIMESTAMP DATE NOT NULL,
  UPDATE_USER VARCHAR2(60) NOT NULL,
  VER_NBR NUMBER(8),
  OBJ_ID VARCHAR2(36)
, CONSTRAINT PROTOCOL_VOTE_RECUSED_PK PRIMARY KEY
  (
    PROTOCOL_VOTE_RECUSED_ID
  )
  ENABLE
);

ALTER TABLE PROTOCOL_VOTE_RECUSED
ADD CONSTRAINT PROTOCOL_VOTE_RECUSED_PRO_FK1 FOREIGN KEY
(
  PROTOCOL_ID_FK
)
REFERENCES PROTOCOL
(
PROTOCOL_ID
) ENABLE;

ALTER TABLE PROTOCOL_VOTE_RECUSED
ADD CONSTRAINT PROTOCOL_VOTE_RECUSED_COM_FK1 FOREIGN KEY
(
  SCHEDULE_ID_FK
)
REFERENCES COMM_SCHEDULE
(
ID
) ENABLE;