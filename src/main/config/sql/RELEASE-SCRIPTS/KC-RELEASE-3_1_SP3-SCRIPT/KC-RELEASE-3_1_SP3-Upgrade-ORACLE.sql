set define off
set sqlblanklines on
spool KC-RELEASE-3_1_SP3-Upgrade-ORACLE-Install.log
@ORACLE/SEQUENCES/KC_SEQ_All.sql
@ORACLE/TABLES/KC_TBL_AWARD_BUDGET_LIMIT.sql
@ORACLE/TABLES/KC_TBL_AWARD_BUDGET_PERIOD_EXT.sql
@ORACLE/TABLES/KC_TBL_AWARD_TEMPLATE_REPORT_TERMS.sql
@ORACLE/TABLES/KC_TBL_AWD_BGT_PER_SUM_CALC_AMT.sql
@ORACLE/TABLES/KC_TBL_BUDGET_DOCUMENT.sql
@ORACLE/TABLES/KC_TBL_COST_ELEMENT.sql
@ORACLE/TABLES/KC_TBL_EPS_PROP_YNQ.sql
@ORACLE/TABLES/KC_TBL_NOTIFICATION_TYPE.sql
@ORACLE/TABLES/KC_TBL_NOTIFICATION_TYPE_RECIPIENT.sql
@ORACLE/TABLES/KC_TBL_PENDING_TRANSACTIONS.sql
@ORACLE/TABLES/KC_TBL_PERSON_EDITABLE_FIELDS.sql
@ORACLE/TABLES/KC_TBL_PROPOSAL_DOCUMENT.sql
@ORACLE/TABLES/KC_TBL_PROPOSAL_LOG.sql
@ORACLE/TABLES/KC_TBL_PROTOCOL_ATTACHMENT_PERSONNEL.sql
@ORACLE/TABLES/KC_TBL_PROTOCOL_ATTACHMENT_PROTOCOL.sql
@ORACLE/TABLES/KC_TBL_PROTOCOL_ONLN_RVWS.sql
@ORACLE/TABLES/KC_TBL_PROTOCOL_PERSONS.sql
@ORACLE/TABLES/KC_TBL_ROLODEX.sql
@ORACLE/TABLES/KC_TBL_SPECIAL_REVIEW.sql
@ORACLE/TABLES/KC_TBL_WATERMARK.sql
@ORACLE/TABLES/KC_TBL_YNQ.sql
@ORACLE/DML/KC_DML_BS1_ARG_VALUE_LOOKUP.sql
@ORACLE/DML/KC_DML_BS1_COST_ELEMENT.sql
@ORACLE/DML/KC_DML_BS1_MINUTE_ENTRY_CODE.sql
@ORACLE/DML/KC_DML_BS1_NARRATIVE_TYPE.sql
@ORACLE/DML/KC_DML_BS1_PROTOCOL_ACTION_TYPE.sql
@ORACLE/DML/KC_DML_BS1_QUESTION.sql
@ORACLE/DML/KC_DML_BS1_QUESTIONNAIRE.sql
@ORACLE/DML/KC_DML_BS1_SPECIAL_REVIEW.sql
@ORACLE/DML/KC_DML_BS1_TRAINING_STIPEND_RATES.SQL
@ORACLE/DML/KC_DML_BS1_YNQ.sql
@ORACLE/DML/KC_DML_BS2_QUESTIONNAIRE_QUESTIONS.sql
@ORACLE/DML/KC_DML_BS2_QUESTIONNAIRE_USAGE.sql
@ORACLE/DML/KC_DML_BS2_QUESTION_EXPLANATION.sql
@ORACLE/CONSTRAINTS/KC_FK_AWARD_BUDGET_LIMIT.sql
@ORACLE/CONSTRAINTS/KC_FK_AWD_BUDGET_PER_SUM_CALC_AMT.sql
@ORACLE/CONSTRAINTS/KC_FK_NOTIFICATION_TYPE.sql
@ORACLE/CONSTRAINTS/KC_FK_NOTIFICATION_TYPE_RECIPIENT.sql
@ORACLE/CONSTRAINTS/KC_UQ_AWD_BUDGET_PER_SUM_CALC_AMT.sql
@ORACLE/CONSTRAINTS/KC_UQ_NOTIFICATION_TYPE.sql
@ORACLE/VIEWS/KC_VEW_NOTIFICATION_TYPE.sql
@ORACLE/VIEWS/KC_VEW_NOTIFICATION_TYPE_RECIPIENT.sql
commit;
exit
