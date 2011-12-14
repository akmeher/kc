set define off
set sqlblanklines on
spool KC-RELEASE-4_0-Upgrade-ORACLE-Install.log
@../../current/4.0/sequences/KC_SEQ_COI_DISCLOSURE.sql
@../../current/4.0/sequences/KC_SEQ_COI_DISCLOSURE_PERSON.sql
@../../current/4.0/sequences/KC_SEQ_COI_DISCLOSURE_PERSON_UNITS.sql
@../../current/4.0/sequences/KC_SEQ_COI_DISCL_NUMBER_S.sql
@../../current/4.0/sequences/KC_SEQ_COI_DISCL_PROJECTS_ID.sql
@../../current/4.0/sequences/KC_SEQ_COI_DISC_DETAILS_ID.sql
@../../current/4.0/sequences/KC_SEQ_ENTITY_NUMBER_S.sql
@../../current/4.0/sequences/KC_SEQ_FINANCIAL_ENTITY_REPORTER.sql
@../../current/4.0/sequences/KC_SEQ_FIN_ENTITY_CONTACT_INFO_ID.sql
@../../current/4.0/sequences/KC_SEQ_FIN_ENTITY_REPORTER_UNITS.sql
@../../current/4.0/sequences/KC_SEQ_FIN_INT_ENTITY_YNQ.sql
@../../current/4.0/sequences/KC_SEQ_INV_COI_DISC_DETAILS.sql
@../../current/4.0/sequences/KC_SEQ_NEGOTIATION_ACTIVITY_S.sql
@../../current/4.0/sequences/KC_SEQ_NEGOTIATION_ACTIVITY_TYPE_S.sql
@../../current/4.0/sequences/KC_SEQ_NEGOTIATION_AGREEMENT_TYPE_S.sql
@../../current/4.0/sequences/KC_SEQ_NEGOTIATION_ASSOCIATION_TYPE_S.sql
@../../current/4.0/sequences/KC_SEQ_NEGOTIATION_ATTACHMENT_S.sql
@../../current/4.0/sequences/KC_SEQ_NEGOTIATION_CUSTOM_DATA_ID.sql
@../../current/4.0/sequences/KC_SEQ_NEGOTIATION_LOCATION_S.sql
@../../current/4.0/sequences/KC_SEQ_NEGOTIATION_S.sql
@../../current/4.0/sequences/KC_SEQ_NEGOTIATION_STATUS_S.sql
@../../current/4.0/sequences/KC_SEQ_NEGOTIATION_UNASSOC_DETAIL_S.sql
@../../current/4.0/sequences/KC_SEQ_NOTIFICATION_MDL_ROLE_QLFR.sql
@../../current/4.0/sequences/KC_SEQ_NOTIFICATION_MODULE_ROLE.sql
@../../current/4.0/sequences/KC_SEQ_ORG_CORRESP.sql
@../../current/4.0/sequences/KC_SEQ_PERSON_FIN_INT_DISCLOSURE.sql
@../../current/4.0/sequences/KC_SEQ_PERSON_TRAINING.sql
@../../current/4.0/sequences/KC_SEQ_PER_FIN_INT_DISCL_DET.sql
@../../current/4.0/sequences/KC_SEQ_SUBAWARD.sql
@../../current/4.0/sequences/KC_SEQ_SUBAWARD_AMOUNT_INFO.sql
@../../current/4.0/sequences/KC_SEQ_SUBAWARD_AMT_RELEASED.sql
@../../current/4.0/sequences/KC_SEQ_SUBAWARD_CLOSEOUT.sql
@../../current/4.0/sequences/KC_SEQ_SUBAWARD_CONTACT.sql
@../../current/4.0/sequences/KC_SEQ_SUBAWARD_CUSTOM_DATA.sql
@../../current/4.0/sequences/KC_SEQ_SUBAWARD_FUNDING_SOURCE.sql
@../../current/4.0/sequences/KC_SEQ_UNIT_CORRESP.sql
@../../current/4.0/sequences/KC_SEQ_WATERMARK.sql
@../../current/4.0/tables/KC_TBL_AWARD.sql
@../../current/4.0/tables/KC_TBL_AWARD_PAYMENT_SCHEDULE.sql
@../../current/4.0/tables/KC_TBL_AWARD_REPORT_TRACKING.sql
@../../current/4.0/tables/KC_TBL_BUDGET_PERSONNEL_DETAILS.sql
@../../current/4.0/tables/KC_TBL_CLOSEOUT_TYPE.sql
@../../current/4.0/tables/KC_TBL_COI_COMMITTEE_ROLE_TYPE.sql
@../../current/4.0/tables/KC_TBL_COI_DISCLOSURE.sql
@../../current/4.0/tables/KC_TBL_COI_DISCLOSURE_DOCUMENT.sql
@../../current/4.0/tables/KC_TBL_COI_DISCLOSURE_EVENT_TYPE.sql
@../../current/4.0/tables/KC_TBL_COI_DISCLOSURE_PERSON.sql
@../../current/4.0/tables/KC_TBL_COI_DISCLOSURE_PERSON_UNITS.sql
@../../current/4.0/tables/KC_TBL_COI_DISCLOSURE_STATUS.sql
@../../current/4.0/tables/KC_TBL_COI_DISCL_PROJECTS.sql
@../../current/4.0/tables/KC_TBL_COI_DISC_DETAILS.sql
@../../current/4.0/tables/KC_TBL_COI_ENTITY_STATUS_CODE.sql
@../../current/4.0/tables/KC_TBL_COI_REVIEWER.sql
@../../current/4.0/tables/KC_TBL_COI_REVIEW_TYPE.sql
@../../current/4.0/tables/KC_TBL_COI_STATUS.sql
@../../current/4.0/tables/KC_TBL_COMMITTEE.sql
@../../current/4.0/tables/KC_TBL_DISTRIBUTION.sql
@../../current/4.0/tables/KC_TBL_FINANCIAL_ENTITY_CONTACT_INFO.sql
@../../current/4.0/tables/KC_TBL_FINANCIAL_ENTITY_REPORTER.sql
@../../current/4.0/tables/KC_TBL_FIN_ENTITIES_DATA_GROUPS.sql
@../../current/4.0/tables/KC_TBL_FIN_ENTITIES_DATA_MATRIX.sql
@../../current/4.0/tables/KC_TBL_FIN_ENTITY_REPORTER_UNITS.sql
@../../current/4.0/tables/KC_TBL_FIN_INT_ENTITY_REL_TYPE.sql
@../../current/4.0/tables/KC_TBL_FIN_INT_ENTITY_STATUS.sql
@../../current/4.0/tables/KC_TBL_FIN_INT_ENTITY_YNQ.sql
@../../current/4.0/tables/KC_TBL_FREQUENCY.sql
@../../current/4.0/tables/KC_TBL_FREQUENCY_BASE.sql
@../../current/4.0/tables/KC_TBL_INV_COI_DISC_DETAILS.sql
@../../current/4.0/tables/KC_TBL_NEGOTIATION.sql
@../../current/4.0/tables/KC_TBL_NEGOTIATION_ACTIVITY.sql
@../../current/4.0/tables/KC_TBL_NEGOTIATION_ACTIVITY_TYPE.sql
@../../current/4.0/tables/KC_TBL_NEGOTIATION_AGREEMENT_TYPE.sql
@../../current/4.0/tables/KC_TBL_NEGOTIATION_ASSOCIATION_TYPE.sql
@../../current/4.0/tables/KC_TBL_NEGOTIATION_ATTACHMENT.sql
@../../current/4.0/tables/KC_TBL_NEGOTIATION_CUSTOM_DATA.sql
@../../current/4.0/tables/KC_TBL_NEGOTIATION_DOCUMENT.sql
@../../current/4.0/tables/KC_TBL_NEGOTIATION_LOCATION.sql
@../../current/4.0/tables/KC_TBL_NEGOTIATION_STATUS.sql
@../../current/4.0/tables/KC_TBL_NEGOTIATION_UNASSOC_DETAIL.sql
@../../current/4.0/tables/KC_TBL_NOTIFICATION_MDL_ROLE_QLFR.sql
@../../current/4.0/tables/KC_TBL_NOTIFICATION_MODULE_ROLE.sql
@../../current/4.0/tables/KC_TBL_NOTIFICATION_TYPE.sql
@../../current/4.0/tables/KC_TBL_NOTIFICATION_TYPE_RECIPIENT.sql
@../../current/4.0/tables/KC_TBL_ORGANIZATION_CORRESPONDENT.sql
@../../current/4.0/tables/KC_TBL_PERSON_EXT_T.sql
@../../current/4.0/tables/KC_TBL_PERSON_FIN_INT_DISCLOSURE.sql
@../../current/4.0/tables/KC_TBL_PER_FIN_INT_DISCL_DET.sql
@../../current/4.0/tables/KC_TBL_PROPOSAL_ADMIN_DETAILS.sql
@../../current/4.0/tables/KC_TBL_PROTOCOL_REVIEW_TYPE.sql
@../../current/4.0/tables/KC_TBL_QUESTION.sql
@../../current/4.0/tables/KC_TBL_REPORT.sql
@../../current/4.0/tables/KC_TBL_REPORT_CLASS.sql
@../../current/4.0/tables/KC_TBL_REPORT_STATUS.sql
@../../current/4.0/tables/KC_TBL_SBAWD_00_SUBAWARD_DOCUMENT.sql
@../../current/4.0/tables/KC_TBL_SBAWD_01_SUBAWARD_STATUS.sql
@../../current/4.0/tables/KC_TBL_SBAWD_02_SUBAWARD_APPROVAL_TYPE.sql
@../../current/4.0/tables/KC_TBL_SBAWD_03_SUBAWARD.sql
@../../current/4.0/tables/KC_TBL_SBAWD_04_SUBAWARD_AMOUNT_INFO.sql
@../../current/4.0/tables/KC_TBL_SBAWD_05_SUBAWARD_AMT_RELEASED.sql
@../../current/4.0/tables/KC_TBL_SBAWD_06_SUBAWARD_CLOSEOUT.sql
@../../current/4.0/tables/KC_TBL_SBAWD_07_SUBAWARD_CONTACT.sql
@../../current/4.0/tables/KC_TBL_SBAWD_08_SUBAWARD_CUSTOM_DATA.sql
@../../current/4.0/tables/KC_TBL_SBAWD_09_SUBAWARD_FUNDING_SOURCE.sql
@../../current/4.0/tables/KC_TBL_SUBAWARD_FORMS.sql
@../../current/4.0/tables/KC_TBL_UNIT_CORRESPONDENT.sql
@../../current/4.0/dml/KC_DML_01_KCCOI-15_B000.sql
@../../current/4.0/dml/KC_DML_01_KCCOI-21_B000.sql
@../../current/4.0/dml/KC_DML_01_KCCOI-22_B000.sql
@../../current/4.0/dml/KC_DML_01_KCCOI-24_B000.sql
@../../current/4.0/dml/KC_DML_01_KCCOI-4_B000.sql
@../../current/4.0/dml/KC_DML_01_KCCOI-52_B000.sql
@../../current/4.0/dml/KC_DML_01_KCIRB-1327_B000.sql
@../../current/4.0/dml/KC_DML_01_KCIRB-1354_B000.sql
@../../current/4.0/dml/KC_DML_01_KCIRB-1470_B000.sql
@../../current/4.0/dml/KC_DML_01_KCIRB-1497_B000.sql
@../../current/4.0/dml/KC_DML_01_KCIRB-1517_B000.sql
@../../current/4.0/dml/KC_DML_01_KCIRB-1529_B000.sql
@../../current/4.0/dml/KC_DML_01_KCIRB-1530_B000.sql
@../../current/4.0/dml/KC_DML_01_KCIRB-1562_B000.sql
@../../current/4.0/dml/KC_DML_01_KCIRB-1596_B000.sql
@../../current/4.0/dml/KC_DML_01_KRACOEUS-4930_B000.sql
@../../current/4.0/dml/KC_DML_01_KRACOEUS-4937_B000.sql
@../../current/4.0/dml/KC_DML_01_KRACOEUS-4956_B000.sql
@../../current/4.0/dml/KC_DML_01_KRACOEUS-4969_B000.sql
@../../current/4.0/dml/KC_DML_01_KRACOEUS-4979_B000.sql
@../../current/4.0/dml/KC_DML_01_KRACOEUS-4998_B000.sql
@../../current/4.0/dml/KC_DML_01_KRACOEUS-5071_B000.sql
@../../current/4.0/dml/KC_DML_01_KRACOEUS-5083_B000.sql
@../../current/4.0/dml/KC_DML_02_KCIRB-1567_B000.sql
@../../current/4.0/dml/KC_DML_02_KCIRB-1568_B000.sql
@../../current/4.0/constraints/KC_FK2_AWARD_PAYMENT_SCHEDULE.sql
@../../current/4.0/constraints/KC_FK_AWARD_REPORT_TRACKING.sql
@../../current/4.0/constraints/KC_FK_COI_DISCLOSURE_PERSON_UNITS.sql
@../../current/4.0/constraints/KC_FK_COI_DISCL_PROJECTS.sql
@../../current/4.0/constraints/KC_FK_COI_DISC_DETAILS.sql
@../../current/4.0/constraints/KC_FK_COMMITTEE.sql
@../../current/4.0/constraints/KC_FK_FIN_ENTITIES_DATA_MATRIX.sql
@../../current/4.0/constraints/KC_FK_FIN_ENTITY_REPORTER_UNITS.sql
@../../current/4.0/constraints/KC_FK_FIN_INT_ENTITY_YNQ.sql
@../../current/4.0/constraints/KC_FK_INV_COI_DISC_DETAILS.sql
@../../current/4.0/constraints/KC_FK_NEGOTIATION.sql
@../../current/4.0/constraints/KC_FK_NEGOTIATION_ACTIVITY.sql
@../../current/4.0/constraints/KC_FK_NEGOTIATION_ATTACHMENT.sql
@../../current/4.0/constraints/KC_FK_NEGOTIATION_CUSTOM_DATA.sql
@../../current/4.0/constraints/KC_FK_NEGOTIATION_UNASSOC_DETAIL.sql
@../../current/4.0/constraints/KC_FK_NOTIFICATION_MDL_ROLE_QLFR.sql
@../../current/4.0/constraints/KC_FK_PERSON_FIN_INT_DISCLOSURE.sql
@../../current/4.0/constraints/KC_FK_PER_FIN_INT_DISCL_DET.sql
@../../current/4.0/constraints/KC_NEGOTIATION_ACTIVITY_TYPE_UK1.sql
@../../current/4.0/constraints/KC_NEGOTIATION_LOCATION_UK1.sql
@../../current/4.0/constraints/KC_PK_COI_DISCLOSURE_STATUS.sql
@../../current/4.0/constraints/KC_TYPE_SUBAWARD_AMOUNT_INFO.sql
@../../current/4.0/constraints/KC_TYPE_SUBAWARD_AMT_RELEASED.sql
@../../current/4.0/constraints/KC_TYPE_SUBAWARD_CLOSEOUT.sql
@../../current/4.0/constraints/KC_TYPE_SUBAWARD_CONTACT.sql
@../../current/4.0/constraints/KC_TYPE_SUBAWARD_CUSTOM_DATA.sql
@../../current/4.0/constraints/KC_TYPE_SUBAWARD_FUNDING_SOURCE.sql
@../../current/4.0/constraints/KC_UQ_COI_DISCL_PROJECTS.sql
@../../current/4.0/constraints/KC_UQ_COI_DISC_DETAILS.sql
@../../current/4.0/constraints/KC_UQ_FINANCIAL_ENTITY_REPORTER.sql
@../../current/4.0/constraints/KC_UQ_FIN_INT_ENTITY_YNQ.sql
@../../current/4.0/constraints/KC_UQ_INV_COI_DISC_DETAILS.sql
@../../current/4.0/constraints/KC_UQ_NEGOTIATION_AGREEMENT_TYPE.sql
@../../current/4.0/constraints/KC_UQ_NEGOTIATION_ASSC_TYPE.sql
@../../current/4.0/constraints/KC_UQ_NEGOTIATION_STATUS.sql
@../../current/4.0/constraints/KC_UQ_PERSON_FIN_INT_DISCLOSURE.sql
@../../current/4.0/constraints/KC_UQ_PER_FIN_INT_DISCL_DET.sql
commit;
exit
