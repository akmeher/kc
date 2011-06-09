set sqlblanklines on
set define off
spool KC-Release-3_0-Clean-Client-Oracle-Install.log
@kcrelease/sql/schema.sql
@kcrelease/datasql/ABSTRACT_TYPE.sql
@kcrelease/datasql/ACCOUNT_TYPE.sql
@kcrelease/datasql/ACTIVITY_TYPE.sql
@kcrelease/datasql/AFFILIATION_TYPE.sql
@kcrelease/datasql/APPOINTMENT_TYPE.sql
@kcrelease/datasql/ARG_VALUE_LOOKUP.sql
@kcrelease/datasql/AWARD_ATTACHMENT_TYPE.sql
@kcrelease/datasql/AWARD_BASIS_OF_PAYMENT.sql
@kcrelease/datasql/AWARD_BUDGET_STATUS.sql
@kcrelease/datasql/AWARD_BUDGET_TYPE.sql
@kcrelease/datasql/AWARD_METHOD_OF_PAYMENT.sql
@kcrelease/datasql/AWARD_STATUS.sql
@kcrelease/datasql/AWARD_TRANSACTION_TYPE.sql
@kcrelease/datasql/AWARD_TYPE.sql
@kcrelease/datasql/BATCH_CORRESPONDENCE.sql
@kcrelease/datasql/BATCH_CORRESPONDENCE_DETAIL.sql
@kcrelease/datasql/BUDGET_CATEGORY.sql
@kcrelease/datasql/BUDGET_CATEGORY_MAPPING.sql
@kcrelease/datasql/BUDGET_CATEGORY_MAPS.sql
@kcrelease/datasql/BUDGET_CATEGORY_TYPE.sql
@kcrelease/datasql/BUDGET_PERIOD_TYPE.sql
@kcrelease/datasql/BUDGET_STATUS.sql
@kcrelease/datasql/CARRIER_TYPE.sql
@kcrelease/datasql/CLOSEOUT_REPORT_TYPE.sql
@kcrelease/datasql/COEUS_MODULE.sql
@kcrelease/datasql/COMMENT_TYPE.sql
@kcrelease/datasql/COMMITTEE_TYPE.sql
@kcrelease/datasql/COMM_DECISION_MOTION_TYPE.sql
@kcrelease/datasql/COMM_MEMBERSHIP_TYPE.sql
@kcrelease/datasql/COMM_SCHEDULE_FREQUENCY.sql
@kcrelease/datasql/CONTACT_TYPE.sql
@kcrelease/datasql/CORRESPONDENT_TYPE.sql
@kcrelease/datasql/COST_SHARE_TYPE.sql
@kcrelease/datasql/CUSTOM_ATTRIBUTE_DATA_TYPE.sql
@kcrelease/datasql/DEADLINE_TYPE.sql
@kcrelease/datasql/DEGREE_TYPE.sql
@kcrelease/datasql/DISTRIBUTION.sql
@kcrelease/datasql/EPS_PROPOSAL_STATUS.sql
@kcrelease/datasql/EPS_PROP_COLUMNS_TO_ALTER.sql
@kcrelease/datasql/EPS_PROP_PERSON_ROLE.sql
@kcrelease/datasql/EPS_PROP_PER_DOC_TYPE.sql
@kcrelease/datasql/EXEMPTION_TYPE.sql
@kcrelease/datasql/EXEMPT_STUDIES_CHECKLIST.sql
@kcrelease/datasql/EXPEDITED_REVIEW_CHECKLIST.sql
@kcrelease/datasql/FP_DOC_TYPE_T.sql
@kcrelease/datasql/FREQUENCY.sql
@kcrelease/datasql/FREQUENCY_BASE.sql
@kcrelease/datasql/FUNDING_SOURCE_TYPE.sql
@kcrelease/datasql/GROUP_TYPES.sql
@kcrelease/datasql/IDC_RATE_TYPE.sql
@kcrelease/datasql/IP_REVIEW_ACTIVITY_TYPE.sql
@kcrelease/datasql/IP_REVIEW_REQ_TYPE.sql
@kcrelease/datasql/IP_REVIEW_RESULT_TYPE.sql
@kcrelease/datasql/KRNS_NTE_TYP_T.sql
@kcrelease/datasql/KRSB_QRTZ_LOCKS.sql
@kcrelease/datasql/LOCATION_TYPE.sql
@kcrelease/datasql/MAIL_BY.sql
@kcrelease/datasql/MAIL_TYPE.sql
@kcrelease/datasql/MEMBERSHIP_ROLE.sql
@kcrelease/datasql/MINUTE_ENTRY_TYPE.sql
@kcrelease/datasql/NARRATIVE_STATUS.sql
@kcrelease/datasql/NARRATIVE_TYPE.sql
@kcrelease/datasql/NOTICE_OF_OPPORTUNITY.sql
@kcrelease/datasql/NSF_CODES.sql
@kcrelease/datasql/ORGANIZATION.sql
@kcrelease/datasql/ORGANIZATION_TYPE_LIST.sql
@kcrelease/datasql/PERSON_EDITABLE_FIELDS.sql
@kcrelease/datasql/PERSON_TRAINING.sql
@kcrelease/datasql/PROPOSAL_LOG_STATUS.sql
@kcrelease/datasql/PROPOSAL_LOG_TYPE.sql
@kcrelease/datasql/PROPOSAL_RESPONSE.sql
@kcrelease/datasql/PROPOSAL_STATE.sql
@kcrelease/datasql/PROPOSAL_STATUS.sql
@kcrelease/datasql/PROPOSAL_TYPE.sql
@kcrelease/datasql/PROTOCOL_ACTION_TYPE.sql
@kcrelease/datasql/PROTOCOL_ATTACHMENT_GROUP.sql
@kcrelease/datasql/PROTOCOL_ATTACHMENT_STATUS.sql
@kcrelease/datasql/PROTOCOL_ATTACHMENT_TYPE.sql
@kcrelease/datasql/PROTOCOL_ATTACHMENT_TYPE_GROUP.sql
@kcrelease/datasql/PROTOCOL_CONTINGENCY.sql
@kcrelease/datasql/PROTOCOL_MODULES.sql
@kcrelease/datasql/PROTOCOL_ONLN_RVW_DETERM_RECOM.sql
@kcrelease/datasql/PROTOCOL_ONLN_RVW_STATUS.sql
@kcrelease/datasql/PROTOCOL_ORG_TYPE.sql
@kcrelease/datasql/PROTOCOL_PERSON_ROLES.sql
@kcrelease/datasql/PROTOCOL_PERSON_ROLE_MAPPING.sql
@kcrelease/datasql/PROTOCOL_REFERENCE_TYPE.sql
@kcrelease/datasql/PROTOCOL_REVIEWER_TYPE.sql
@kcrelease/datasql/PROTOCOL_REVIEW_TYPE.sql
@kcrelease/datasql/PROTOCOL_STATUS.sql
@kcrelease/datasql/PROTOCOL_TYPE.sql
@kcrelease/datasql/PROTO_CORRESP_TEMPL.sql
@kcrelease/datasql/PROTO_CORRESP_TYPE.sql
@kcrelease/datasql/QUESTION.sql
@kcrelease/datasql/QUESTION_EXPLANATION.sql
@kcrelease/datasql/QUESTION_TYPES.sql
@kcrelease/datasql/RATE_CLASS_TYPE.sql
@kcrelease/datasql/REPORT.sql
@kcrelease/datasql/REPORT_CLASS.sql
@kcrelease/datasql/RESEARCH_AREAS.sql
@kcrelease/datasql/RISK_LEVEL.sql
@kcrelease/datasql/ROLODEX.sql
@kcrelease/datasql/S2S_REVISION_TYPE.sql
@kcrelease/datasql/S2S_SUBMISSION_TYPE.sql
@kcrelease/datasql/SCHEDULE_ACT_ITEM_TYPE.sql
@kcrelease/datasql/SCHEDULE_STATUS.sql
@kcrelease/datasql/SCHOOL_CODE.sql
@kcrelease/datasql/SPECIAL_REVIEW.sql
@kcrelease/datasql/SPONSOR_TERM.sql
@kcrelease/datasql/SPONSOR_TERM_TYPE.sql
@kcrelease/datasql/SPONSOR_TYPE.sql
@kcrelease/datasql/SP_REV_APPROVAL_TYPE.sql
@kcrelease/datasql/STATE_CODE.sql
@kcrelease/datasql/SUBMISSION_STATUS.sql
@kcrelease/datasql/SUBMISSION_TYPE.sql
@kcrelease/datasql/SUBMISSION_TYPE_QUALIFIER.sql
@kcrelease/datasql/TBN.sql
@kcrelease/datasql/TRAINING.sql
@kcrelease/datasql/UNIT.sql
@kcrelease/datasql/UNIT_ADMINISTRATOR_TYPE.sql
@kcrelease/datasql/USER_TABLES_TEMP.sql
@kcrelease/datasql/VALID_AWARD_BASIS_PAYMENT.sql
@kcrelease/datasql/VALID_BASIS_METHOD_PMT.sql
@kcrelease/datasql/VALID_CALC_TYPES.sql
@kcrelease/datasql/VALID_CLASS_REPORT_FREQ.sql
@kcrelease/datasql/VALID_FREQUENCY_BASE.sql
@kcrelease/datasql/VALID_NARR_FORMS.sql
@kcrelease/datasql/VALID_PROTO_SUB_REV_TYPE.sql
@kcrelease/datasql/VALID_PROTO_SUB_TYPE_QUAL.sql
@kcrelease/datasql/VULNERABLE_SUBJECT_TYPE.sql
@kcrelease/datasql/YNQ.sql
@kcrelease/datasql/YNQ_EXPLANATION.sql
@kcrelease/datasql/YNQ_EXPLANATION_TYPE.sql
@kcrelease/sql/schema-constraints.sql
quit
