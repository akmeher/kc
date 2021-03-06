-- Create Application Administrator person and user for unit 000001 descending
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
SELECT KRIM_ENTITY_ID_S.NEXTVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENT_TYP_CD, ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT 'PERSON', KRIM_ENTITY_ID_S.CURRVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_NM_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'Application', 'Administrator', 'PRFR', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_EMP_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, '000001','Y','Y',SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_LINE_1 , CITY_NM , POSTAL_STATE_CD , POSTAL_CD , POSTAL_CNTRY_CD ,  ADDR_TYP_CD , DFLT_IND ,ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_ADDR_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '71 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_ADDR, EMAIL_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_EMAIL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', 'appadmin@kuali.org', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-1071', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-2071', 'FAX', 'N', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_PRNCPL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'appadmin', 'fK69ATFsAydwQuteang+xMva+Tc=','Y',SYSDATE,SYS_GUID(),1 FROM DUAL;

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ROLE_MBR_ID_S.NEXTVAL, ROLE_ID, KRIM_PRNCPL_ID_S.CURRVAL, 'P', SYSDATE, SYS_GUID(), 1 FROM KRIM_ROLE_T
WHERE ROLE_NM = 'Application Administrator';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, '000001', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'unitNumber' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, 'Y', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'subunits' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

-- Create  Award Budget Approver person and user for unit 000001 descending
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
SELECT KRIM_ENTITY_ID_S.NEXTVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENT_TYP_CD, ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT 'PERSON', KRIM_ENTITY_ID_S.CURRVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_NM_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'AwardBudget', 'Approver', 'PRFR', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_EMP_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, '000001','Y','Y',SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_LINE_1 , CITY_NM , POSTAL_STATE_CD , POSTAL_CD , POSTAL_CNTRY_CD ,  ADDR_TYP_CD , DFLT_IND ,ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_ADDR_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '72 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_ADDR, EMAIL_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_EMAIL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', 'awdbudapprover@kuali.org', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-1072', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-2072', 'FAX', 'N', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_PRNCPL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'awdbudapprover', 'fK69ATFsAydwQuteang+xMva+Tc=','Y',SYSDATE,SYS_GUID(),1 FROM DUAL;

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ROLE_MBR_ID_S.NEXTVAL, ROLE_ID, KRIM_PRNCPL_ID_S.CURRVAL, 'P', SYSDATE, SYS_GUID(), 1 FROM KRIM_ROLE_T
WHERE ROLE_NM = 'Award Budget Approver';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, '000001', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'unitNumber' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, 'Y', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'subunits' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

-- Create Award Modifier person and user for unit 000001 descending
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
SELECT KRIM_ENTITY_ID_S.NEXTVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENT_TYP_CD, ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT 'PERSON', KRIM_ENTITY_ID_S.CURRVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_NM_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'Award', 'Modifier', 'PRFR', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_EMP_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, '000001','Y','Y',SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_LINE_1 , CITY_NM , POSTAL_STATE_CD , POSTAL_CD , POSTAL_CNTRY_CD ,  ADDR_TYP_CD , DFLT_IND ,ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_ADDR_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '73 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_ADDR, EMAIL_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_EMAIL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', 'awdmodifier@kuali.org', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-1073', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-2073', 'FAX', 'N', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_PRNCPL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'awdmodifier', 'fK69ATFsAydwQuteang+xMva+Tc=','Y',SYSDATE,SYS_GUID(),1 FROM DUAL;

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ROLE_MBR_ID_S.NEXTVAL, ROLE_ID, KRIM_PRNCPL_ID_S.CURRVAL, 'P', SYSDATE, SYS_GUID(), 1 FROM KRIM_ROLE_T
WHERE ROLE_NM = 'Award Modifier';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, '000001', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'unitNumber' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, 'Y', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'subunits' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

-- Create Award Budget Administrator person and user for unit 000001 descending
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
SELECT KRIM_ENTITY_ID_S.NEXTVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENT_TYP_CD, ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT 'PERSON', KRIM_ENTITY_ID_S.CURRVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_NM_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'AwardBudget', 'Administrator', 'PRFR', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_EMP_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, '000001','Y','Y',SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_LINE_1 , CITY_NM , POSTAL_STATE_CD , POSTAL_CD , POSTAL_CNTRY_CD ,  ADDR_TYP_CD , DFLT_IND ,ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_ADDR_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '73 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_ADDR, EMAIL_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_EMAIL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', 'awdbudadmin@kuali.org', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-1073', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-2073', 'FAX', 'N', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_PRNCPL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'awdbudadmin', 'fK69ATFsAydwQuteang+xMva+Tc=','Y',SYSDATE,SYS_GUID(),1 FROM DUAL;

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ROLE_MBR_ID_S.NEXTVAL, ROLE_ID, KRIM_PRNCPL_ID_S.CURRVAL, 'P', SYSDATE, SYS_GUID(), 1 FROM KRIM_ROLE_T
WHERE ROLE_NM = 'Award Budget Administrator';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, '000001', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'unitNumber' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, 'Y', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'subunits' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

-- Create OSP Administrator person and user for unit 000001 descending
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
SELECT KRIM_ENTITY_ID_S.NEXTVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENT_TYP_CD, ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT 'PERSON', KRIM_ENTITY_ID_S.CURRVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_NM_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'OSP', 'Administrator', 'PRFR', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_EMP_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, '000001','Y','Y',SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_LINE_1 , CITY_NM , POSTAL_STATE_CD , POSTAL_CD , POSTAL_CNTRY_CD ,  ADDR_TYP_CD , DFLT_IND ,ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_ADDR_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '73 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_ADDR, EMAIL_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_EMAIL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', 'ospadmin@kuali.org', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-1073', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-2073', 'FAX', 'N', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_PRNCPL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'ospadmin', 'fK69ATFsAydwQuteang+xMva+Tc=','Y',SYSDATE,SYS_GUID(),1 FROM DUAL;

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ROLE_MBR_ID_S.NEXTVAL, ROLE_ID, KRIM_PRNCPL_ID_S.CURRVAL, 'P', SYSDATE, SYS_GUID(), 1 FROM KRIM_ROLE_T
WHERE ROLE_NM = 'OSP Administrator';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, '000001', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'unitNumber' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, 'Y', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'subunits' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

-- Create Award Budget Aggregator person and user for unit 000001 descending
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
SELECT KRIM_ENTITY_ID_S.NEXTVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENT_TYP_CD, ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT 'PERSON', KRIM_ENTITY_ID_S.CURRVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_NM_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'AwardBudget', 'Aggregator', 'PRFR', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_EMP_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, '000001','Y','Y',SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_LINE_1 , CITY_NM , POSTAL_STATE_CD , POSTAL_CD , POSTAL_CNTRY_CD ,  ADDR_TYP_CD , DFLT_IND ,ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_ADDR_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '74 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_ADDR, EMAIL_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_EMAIL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', 'awdbudaggregator@kuali.org', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-1074', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-2074', 'FAX', 'N', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_PRNCPL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'awdbudaggregator', 'fK69ATFsAydwQuteang+xMva+Tc=','Y',SYSDATE,SYS_GUID(),1 FROM DUAL;

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ROLE_MBR_ID_S.NEXTVAL, ROLE_ID, KRIM_PRNCPL_ID_S.CURRVAL, 'P', SYSDATE, SYS_GUID(), 1 FROM KRIM_ROLE_T
WHERE ROLE_NM = 'Award Budget Aggregator';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, '000001', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'unitNumber' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, 'Y', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'subunits' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

-- Create Award Budget Maintainer person and user for unit 000001 descending
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
SELECT KRIM_ENTITY_ID_S.NEXTVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENT_TYP_CD, ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT 'PERSON', KRIM_ENTITY_ID_S.CURRVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_NM_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'AwardBudget', 'Maintainer', 'PRFR', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_EMP_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, '000001','Y','Y',SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_LINE_1 , CITY_NM , POSTAL_STATE_CD , POSTAL_CD , POSTAL_CNTRY_CD ,  ADDR_TYP_CD , DFLT_IND ,ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_ADDR_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '73 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_ADDR, EMAIL_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_EMAIL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', 'awdbudmaintainer@kuali.org', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-1073', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-2073', 'FAX', 'N', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_PRNCPL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'awdbudmaintainer', 'fK69ATFsAydwQuteang+xMva+Tc=','Y',SYSDATE,SYS_GUID(),1 FROM DUAL;

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ROLE_MBR_ID_S.NEXTVAL, ROLE_ID, KRIM_PRNCPL_ID_S.CURRVAL, 'P', SYSDATE, SYS_GUID(), 1 FROM KRIM_ROLE_T
WHERE ROLE_NM = 'Award Budget Maintainer';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, '000001', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'unitNumber' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, 'Y', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'subunits' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

-- Create Award Documents Maintainer person and user for unit 000001 descending
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
SELECT KRIM_ENTITY_ID_S.NEXTVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENT_TYP_CD, ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT 'PERSON', KRIM_ENTITY_ID_S.CURRVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_NM_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'AwardDoc', 'Maintainer', 'PRFR', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_EMP_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, '000001','Y','Y',SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_LINE_1 , CITY_NM , POSTAL_STATE_CD , POSTAL_CD , POSTAL_CNTRY_CD ,  ADDR_TYP_CD , DFLT_IND ,ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_ADDR_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '75 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_ADDR, EMAIL_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_EMAIL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', 'awddocmaintainer@kuali.org', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-1075', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-2075', 'FAX', 'N', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_PRNCPL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'awddocmaintainer', 'fK69ATFsAydwQuteang+xMva+Tc=','Y',SYSDATE,SYS_GUID(),1 FROM DUAL;

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ROLE_MBR_ID_S.NEXTVAL, ROLE_ID, KRIM_PRNCPL_ID_S.CURRVAL, 'P', SYSDATE, SYS_GUID(), 1 FROM KRIM_ROLE_T
WHERE ROLE_NM = 'Award Documents Maintainer';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, '000001', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'unitNumber' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, 'Y', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'subunits' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

-- Create Award Budget Modifier person and user for unit 000001
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
SELECT KRIM_ENTITY_ID_S.NEXTVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENT_TYP_CD, ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT 'PERSON', KRIM_ENTITY_ID_S.CURRVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_NM_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'AwardBudget', 'Modifier', 'PRFR', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_EMP_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, '000001','Y','Y',SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_LINE_1 , CITY_NM , POSTAL_STATE_CD , POSTAL_CD , POSTAL_CNTRY_CD ,  ADDR_TYP_CD , DFLT_IND ,ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_ADDR_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '76 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_ADDR, EMAIL_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_EMAIL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', 'awdbudmodifier@kuali.org', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-1076', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-2076', 'FAX', 'N', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_PRNCPL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'awdbudmodifier', 'fK69ATFsAydwQuteang+xMva+Tc=','Y',SYSDATE,SYS_GUID(),1 FROM DUAL;

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ROLE_MBR_ID_S.NEXTVAL, ROLE_ID, KRIM_PRNCPL_ID_S.CURRVAL, 'P', SYSDATE, SYS_GUID(), 1 FROM KRIM_ROLE_T
WHERE ROLE_NM = 'Award Budget Modifier';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, '000001', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'unitNumber' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

-- Create Departments Awards Viewer person and user for unit 000001 descending
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
SELECT KRIM_ENTITY_ID_S.NEXTVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENT_TYP_CD, ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT 'PERSON', KRIM_ENTITY_ID_S.CURRVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_NM_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'DeptAward', 'Viewer', 'PRFR', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_EMP_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, '000001','Y','Y',SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_LINE_1 , CITY_NM , POSTAL_STATE_CD , POSTAL_CD , POSTAL_CNTRY_CD ,  ADDR_TYP_CD , DFLT_IND ,ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_ADDR_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '76 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_ADDR, EMAIL_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_EMAIL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', 'deptawdviewer@kuali.org', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-1076', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-2076', 'FAX', 'N', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_PRNCPL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'deptawdviewer', 'fK69ATFsAydwQuteang+xMva+Tc=','Y',SYSDATE,SYS_GUID(),1 FROM DUAL;

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ROLE_MBR_ID_S.NEXTVAL, ROLE_ID, KRIM_PRNCPL_ID_S.CURRVAL, 'P', SYSDATE, SYS_GUID(), 1 FROM KRIM_ROLE_T
WHERE ROLE_NM = 'Departments Awards Viewer';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, '000001', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'unitNumber' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, 'Y', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'subunits' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

-- Create Template Viewer person and user for unit 000001 descending
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
SELECT KRIM_ENTITY_ID_S.NEXTVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENT_TYP_CD, ENTITY_ID, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT 'PERSON', KRIM_ENTITY_ID_S.CURRVAL, 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_NM_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'Template', 'Viewer', 'PRFR', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_EMP_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, '000001','Y','Y',SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_LINE_1 , CITY_NM , POSTAL_STATE_CD , POSTAL_CD , POSTAL_CNTRY_CD ,  ADDR_TYP_CD , DFLT_IND ,ACTV_IND, LAST_UPDT_DT , OBJ_ID , VER_NBR)
SELECT KRIM_ENTITY_ADDR_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '77 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_ADDR, EMAIL_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_EMAIL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', 'tempviewer@kuali.org', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-1077', 'WRK', 'Y', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_NBR, PHONE_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ENTITY_PHONE_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', '321-321-2077', 'FAX', 'N', 'Y', SYSDATE, SYS_GUID(), 1 FROM DUAL;

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_PRNCPL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'tempviewer', 'fK69ATFsAydwQuteang+xMva+Tc=','Y',SYSDATE,SYS_GUID(),1 FROM DUAL;

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR)
SELECT KRIM_ROLE_MBR_ID_S.NEXTVAL, ROLE_ID, KRIM_PRNCPL_ID_S.CURRVAL, 'P', SYSDATE, SYS_GUID(), 1 FROM KRIM_ROLE_T
WHERE ROLE_NM = 'Template Viewer';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, '000001', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'unitNumber' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
SELECT KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, T.KIM_TYP_ID, D.KIM_ATTR_DEFN_ID, 'Y', SYS_GUID(), 1 FROM KRIM_TYP_T T, KRIM_ATTR_DEFN_T D
WHERE T.NM = 'UnitHierarchy' AND D.NM = 'subunits' AND T.NMSPC_CD = 'KC-SYS' AND D.NMSPC_CD = 'KC-SYS';

COMMIT;