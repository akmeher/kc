ALTER TABLE IACUC_PROC_PERSON_RESPONSIBLE 
ADD CONSTRAINT UQ_IACUC_PROTO_PERSON_RESPONSI 
UNIQUE (PROTOCOL_NUMBER, SEQUENCE_NUMBER, IACUC_PROTOCOL_STUDY_GROUPS_ID, PERSON_ID) 
/

