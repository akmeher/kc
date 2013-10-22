CREATE TABLE IACUC_PROTO_STUDY_GRP_SPECIES ( 
    IACUC_PROTO_STUDY_GRP_SPC_ID NUMBER(12,0) NOT NULL, 
    PROTOCOL_ID NUMBER(12,0) NOT NULL, 
    PROTOCOL_NUMBER VARCHAR2(20) NOT NULL, 
    SEQUENCE_NUMBER NUMBER(3,0) NOT NULL, 
    SPECIES_CODE NUMBER(4) NOT NULL,
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR2(60) NOT NULL, 
    VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL, 
    OBJ_ID VARCHAR2(36) NOT NULL) 
/


ALTER TABLE IACUC_PROTO_STUDY_GRP_SPECIES 
ADD CONSTRAINT PK_IACUC_PROTO_STD_GRP_SPEC 
PRIMARY KEY (IACUC_PROTO_STUDY_GRP_SPC_ID) 
/
