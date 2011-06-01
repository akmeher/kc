--REM INSERTING into KREW_ACTN_TKN_T
INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
values (2331,3091,'10000000001','S',to_timestamp('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
VALUES (2332,3091,'10000000001','C',TO_TIMESTAMP('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1)
/

INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
values (2333,3092,'10000000001','S',to_timestamp('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
VALUES (2334,3092,'10000000001','C',TO_TIMESTAMP('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1)
/

INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
values (2335,3093,'10000000001','S',to_timestamp('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
VALUES (2336,3093,'10000000001','C',TO_TIMESTAMP('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1)
/

INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
values (2337,3094,'10000000001','S',to_timestamp('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_TKN_ID,DOC_HDR_ID,PRNCPL_ID,ACTN_CD,ACTN_DT,DOC_VER_NBR,CUR_IND,VER_NBR) 
VALUES (2338,3094,'10000000001','C',TO_TIMESTAMP('08-JUL-10','DD-MON-RR HH.MI.SSXFF AM'),1,1,1)
/

-- Staged Data for Award Hierarchy
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427085005', 'YYYYMMDDHH24MISS' ),2401,1,4091,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427124254', 'YYYYMMDDHH24MISS' ),2415,1,4092,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('C',TO_DATE( '20110427125129', 'YYYYMMDDHH24MISS' ),2416,1,4092,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427125338', 'YYYYMMDDHH24MISS' ),2417,1,4093,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('C',TO_DATE( '20110427125552', 'YYYYMMDDHH24MISS' ),2418,1,4093,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427125807', 'YYYYMMDDHH24MISS' ),2419,1,4094,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('C',TO_DATE( '20110427130243', 'YYYYMMDDHH24MISS' ),2420,1,4094,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427130356', 'YYYYMMDDHH24MISS' ),2421,1,4095,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('C',TO_DATE( '20110427130642', 'YYYYMMDDHH24MISS' ),2422,1,4095,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427130829', 'YYYYMMDDHH24MISS' ),2423,1,4096,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('C',TO_DATE( '20110427131101', 'YYYYMMDDHH24MISS' ),2424,1,4096,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427131139', 'YYYYMMDDHH24MISS' ),2425,1,4097,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('C',TO_DATE( '20110427131427', 'YYYYMMDDHH24MISS' ),2426,1,4097,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427131513', 'YYYYMMDDHH24MISS' ),2427,1,4098,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('C',TO_DATE( '20110427131819', 'YYYYMMDDHH24MISS' ),2428,1,4098,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427131858', 'YYYYMMDDHH24MISS' ),2429,1,4099,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('C',TO_DATE( '20110427132148', 'YYYYMMDDHH24MISS' ),2430,1,4099,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427132547', 'YYYYMMDDHH24MISS' ),2434,1,4100,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('C',TO_DATE( '20110427132709', 'YYYYMMDDHH24MISS' ),2435,1,4100,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427141918', 'YYYYMMDDHH24MISS' ),2451,1,4101,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('A',TO_DATE( '20110427185459', 'YYYYMMDDHH24MISS' ),2460,1,4101,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427185503', 'YYYYMMDDHH24MISS' ),2461,1,4102,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,ANNOTN,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('B',TO_DATE( '20110427185506', 'YYYYMMDDHH24MISS' ),2462,'Award Hierarchy Sync Routed Document',1,4102,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427185509', 'YYYYMMDDHH24MISS' ),2463,1,4103,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,ANNOTN,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('B',TO_DATE( '20110427185512', 'YYYYMMDDHH24MISS' ),2464,'Award Hierarchy Sync Routed Document',1,4103,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427185515', 'YYYYMMDDHH24MISS' ),2465,1,4104,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,ANNOTN,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('B',TO_DATE( '20110427185517', 'YYYYMMDDHH24MISS' ),2466,'Award Hierarchy Sync Routed Document',1,4104,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427185521', 'YYYYMMDDHH24MISS' ),2467,1,4105,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,ANNOTN,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('B',TO_DATE( '20110427185523', 'YYYYMMDDHH24MISS' ),2468,'Award Hierarchy Sync Routed Document',1,4105,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427185527', 'YYYYMMDDHH24MISS' ),2469,1,4106,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,ANNOTN,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('B',TO_DATE( '20110427185529', 'YYYYMMDDHH24MISS' ),2470,'Award Hierarchy Sync Routed Document',1,4106,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427185533', 'YYYYMMDDHH24MISS' ),2471,1,4107,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,ANNOTN,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('B',TO_DATE( '20110427185535', 'YYYYMMDDHH24MISS' ),2472,'Award Hierarchy Sync Routed Document',1,4107,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427185539', 'YYYYMMDDHH24MISS' ),2473,1,4108,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,ANNOTN,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('B',TO_DATE( '20110427185541', 'YYYYMMDDHH24MISS' ),2474,'Award Hierarchy Sync Routed Document',1,4108,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('S',TO_DATE( '20110427191431', 'YYYYMMDDHH24MISS' ),2475,1,4109,1,'10000000001',1)
/
INSERT INTO KREW_ACTN_TKN_T (ACTN_CD,ACTN_DT,ACTN_TKN_ID,CUR_IND,DOC_HDR_ID,DOC_VER_NBR,PRNCPL_ID,VER_NBR)
  VALUES ('C',TO_DATE( '20110427191933', 'YYYYMMDDHH24MISS' ),2476,1,4109,1,'10000000001',1)
/
