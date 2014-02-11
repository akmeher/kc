INSERT INTO QUESTIONNAIRE_USAGE (QUESTIONNAIRE_USAGE_ID, MODULE_ITEM_CODE, MODULE_SUB_ITEM_CODE, QUESTIONNAIRE_REF_ID_FK, QUESTIONNAIRE_SEQUENCE_NUMBER, RULE_ID, QUESTIONNAIRE_LABEL, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID, IS_MANDATORY) 
    VALUES (6112, (SELECT MODULE_CODE FROM COEUS_MODULE WHERE DESCRIPTION = 'Development Proposal'), 3, (SELECT QUESTIONNAIRE_REF_ID FROM QUESTIONNAIRE WHERE NAME = 'Proposal Person Certification'), 1, NULL, 'Proposal Person Certification', SYSDATE, 'admin', 1, SYS_GUID(), 'Y');