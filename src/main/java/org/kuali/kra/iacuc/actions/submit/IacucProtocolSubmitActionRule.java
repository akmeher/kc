/*
 * Copyright 2005-2010 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.iacuc.actions.submit;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.kuali.kra.committee.bo.CommitteeMembership;
import org.kuali.kra.committee.service.CommitteeService;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.infrastructure.KeyConstants;
import org.kuali.kra.infrastructure.KraServiceLocator;
import org.kuali.kra.iacuc.IacucProtocolDocument;
import org.kuali.kra.iacuc.actions.IacucProtocolStatus;
import org.kuali.kra.rules.ResearchDocumentRuleBase;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;
import org.kuali.rice.krad.bo.BusinessObject;
import org.kuali.rice.krad.service.BusinessObjectService;
import org.kuali.rice.krad.util.GlobalVariables;

/**
 * Validate a protocol submission to the IRB for review.
 */
/**
 * This class...
 */
public class IacucProtocolSubmitActionRule extends ResearchDocumentRuleBase implements IacucExecuteProtocolSubmitActionRule {

    private static final String MANDATORY = "M";
    private ParameterService parameterService;
    private CommitteeService committeeService;

    /**
     * @see org.kuali.kra.irb.actions.submit.ExecuteProtocolSubmitActionRule#processSubmitAction(org.kuali.kra.iacuc.IacucProtocolDocument,
     *      org.kuali.kra.irb.actions.submit.ProtocolSubmitAction)
     */
    public boolean processSubmitAction(IacucProtocolDocument document, IacucProtocolSubmitAction submitAction) {

        boolean isValid = validateSubmissionType(document, submitAction);
        isValid &= validateProtocolReviewType(submitAction);
        if (StringUtils.isNotBlank(submitAction.getSubmissionTypeCode())
                && StringUtils.isNotBlank(submitAction.getProtocolReviewTypeCode())) {
            isValid &= isValidSubmReviewType(submitAction);
        }
        if (isMandatory()) {
            isValid &= validateCommittee(submitAction);
            isValid &= validateSchedule(submitAction);
        }
//TODO: Not sure if following will be needed for IACUC.    
//        isValid &= validateCheckLists(submitAction);
        isValid &= validateReviewers(submitAction);
        isValid &= checkNoSpoofing(submitAction);

        return isValid;

    }


    /**
     * If the committee is mandatory, verify that a committee has been selected.
     */
    private boolean validateCommittee(IacucProtocolSubmitAction submitAction) {
        boolean valid = true;
        if (StringUtils.isBlank(submitAction.getNewCommitteeId())) {
            valid = false;
            GlobalVariables.getMessageMap().putError(Constants.PROTOCOL_SUBMIT_ACTION_PROPERTY_KEY + ".committeeId",
                    KeyConstants.ERROR_PROTOCOL_COMMITTEE_NOT_SELECTED);
        }
        return valid;
    }

    /**
     * If the schedule is mandatory, verify that a schedule has been selected.
     */
    private boolean validateSchedule(IacucProtocolSubmitAction submitAction) {
        boolean valid = true;
        if (StringUtils.isBlank(submitAction.getNewScheduleId())) {
            valid = false;
            GlobalVariables.getMessageMap().putError(Constants.PROTOCOL_SUBMIT_ACTION_PROPERTY_KEY + ".scheduleId",
                    KeyConstants.ERROR_PROTOCOL_SCHEDULE_NOT_SELECTED);
        }
        return valid;
    }

    private boolean isSubmissionTypeInvalidForProtocolStatus(IacucProtocolDocument document, String submissionTypeCode) {
        String protocolStatusCode = document.getProtocol().getProtocolStatusCode();
        return (StringUtils.isNotBlank(protocolStatusCode)
                && (StringUtils.equals(IacucProtocolStatus.MINOR_REVISIONS_REQUIRED, protocolStatusCode) || StringUtils.equals(
                        IacucProtocolStatus.MAJOR_REVISIONS_REQUIRED, protocolStatusCode)) && !(StringUtils.equals(
                IacucProtocolSubmissionType.RESPONSE_TO_PREV_IACUC_NOTIFICATION, submissionTypeCode) || StringUtils.equals(
                IacucProtocolSubmissionType.CONTINUATION, submissionTypeCode)));
    }

    /**
     * Validate the Submission Type.
     */
    private boolean validateSubmissionType(IacucProtocolDocument document, IacucProtocolSubmitAction submitAction) {
        boolean isValid = true;
        String submissionTypeCode = submitAction.getSubmissionTypeCode();
        if (StringUtils.isBlank(submissionTypeCode)) {
            // If the user didn't select a submission type, i.e. he/she choose the "select:" option,
            // then the Submission Type Code will be "blank".
            isValid = false;
            GlobalVariables.getMessageMap().putError(Constants.PROTOCOL_SUBMIT_ACTION_PROPERTY_KEY + ".submissionTypeCode",
                    KeyConstants.ERROR_PROTOCOL_SUBMISSION_TYPE_NOT_SELECTED);
        }
        else {
            isValid = isValidSubmTypeQual(submitAction);
        }
        return isValid;
    }

    /**
     * Validate the Protocol Review Type.
     */
    private boolean validateProtocolReviewType(IacucProtocolSubmitAction submitAction) {
        boolean isValid = true;
        String protocolReviewTypeCode = submitAction.getProtocolReviewTypeCode();
        if (StringUtils.isBlank(protocolReviewTypeCode)) {
            // If the user didn't select a review type, i.e. he/she choose the "select:" option,
            // then the Protocol Review Type Code will be "blank".
            isValid = false;
            GlobalVariables.getMessageMap().putError(Constants.PROTOCOL_SUBMIT_ACTION_PROPERTY_KEY + ".protocolReviewTypeCode",
                    KeyConstants.ERROR_PROTOCOL_REVIEW_TYPE_NOT_SELECTED);
        }
        else if (isReviewTypeInvalid(protocolReviewTypeCode)) {
            isValid = false;
            this.reportError(Constants.PROTOCOL_SUBMIT_ACTION_PROPERTY_KEY + ".protocolReviewTypeCode",
                    KeyConstants.ERROR_PROTOCOL_REVIEW_TYPE_INVALID, new String[] { protocolReviewTypeCode });
        }
        return isValid;
    }

//TODO: Not sure if following will be needed for IACUC.    
//    /**
//     * Validate the checklist. There must be at least one check list item selected if the review type is exempt or expedited.
//     */
//    private boolean validateCheckLists(IacucProtocolSubmitAction submitAction) {
//        String protocolReviewTypeCode = submitAction.getProtocolReviewTypeCode();
//        if (StringUtils.equals(protocolReviewTypeCode, IacucProtocolReviewType.EXEMPT_STUDIES_REVIEW_TYPE_CODE)) {
//            List<ExemptStudiesCheckListItem> checkList = submitAction.getExemptStudiesCheckList();
//            for (ExemptStudiesCheckListItem item : checkList) {
//                if (item.getChecked()) {
//                    return true;
//                }
//            }
//            reportError(Constants.PROTOCOL_SUBMIT_ACTION_PROPERTY_KEY, KeyConstants.ERROR_PROTOCOL_AT_LEAST_ONE_CHECKLIST_ITEM);
//            return false;
//        }
//        else if (StringUtils.equals(protocolReviewTypeCode, IacucProtocolReviewType.EXPEDITED_REVIEW_TYPE_CODE)) {
//            List<ExpeditedReviewCheckListItem> checkList = submitAction.getExpeditedReviewCheckList();
//            for (ExpeditedReviewCheckListItem item : checkList) {
//                if (item.getChecked()) {
//                    return true;
//                }
//            }
//            reportError(Constants.PROTOCOL_SUBMIT_ACTION_PROPERTY_KEY, KeyConstants.ERROR_PROTOCOL_AT_LEAST_ONE_CHECKLIST_ITEM);
//            return false;
//        }
//        return true;
//    }


//TODO: Must do following for IACUC work.    
    /**
     * Validate the reviewers.
     */
    private boolean validateReviewers(IacucProtocolSubmitAction submitAction) {
        boolean isValid = true;
//        List<ProtocolReviewerBean> reviewers = submitAction.getReviewers();
//
//        for (int i = 0; i < reviewers.size(); i++) {
//            ProtocolReviewerBean reviewer = reviewers.get(i);
//            if (!isReviewerValid(reviewer, i)) {
//                isValid = false;
//            }
//        }
        return isValid;
    }


//TODO: Must do following for IACUC work.    
    /**
     * 
     * This method checks to make sure that the reviewers list submitted is actually the same as that made available for that
     * protocol, committee and schedule, i.e. no spoofing of hidden input fields has taken place.
     * 
     * @param submitAction
     * @return
     */
    public boolean checkNoSpoofing(IacucProtocolSubmitAction submitAction) {
        boolean isValid = true;
//        List<ProtocolReviewerBean> submittedReviewers = submitAction.getReviewers();
//        if (null != submittedReviewers && submittedReviewers.size() > 0) {
//            if (StringUtils.isBlank(submitAction.getCommitteeId()) || StringUtils.isBlank(submitAction.getScheduleId())) {
//                isValid = false;
//            }
//            else {
//                List<CommitteeMembership> actualReviewers = submitAction.getProtocol().filterOutProtocolPersonnel(
//                        getCommitteeService().getAvailableMembers(submitAction.getCommitteeId(), submitAction.getScheduleId()));
//                for (int i = 0; i < submittedReviewers.size(); i++) {
//                    ProtocolReviewerBean reviewer = submittedReviewers.get(i);
//                    if (!isReviewerInList(reviewer, actualReviewers, i)) {
//                        isValid = false;
//                    }
//                }
//            }
//        }
        return isValid;
    }


//TODO: Must do following for IACUC work.    
//    private boolean isReviewerInList(ProtocolReviewerBean reviewer, List<CommitteeMembership> actualReviewers, int reviewerIndex) {
//        boolean valid = false;
//        for (CommitteeMembership member : actualReviewers) {
//            if (!StringUtils.isBlank(member.getPersonId())) {
//                if (StringUtils.equals(reviewer.getPersonId(), member.getPersonId())) {
//                    valid = true;
//                    break;
//                }
//            }
//            else {
//                if (StringUtils.equals(reviewer.getPersonId(), member.getRolodexId().toString())) {
//                    valid = true;
//                    break;
//                }
//            }
//        }
//
//        if (!valid) {
//            String parameterName = Constants.PROTOCOL_SUBMIT_ACTION_PROPERTY_KEY + ".reviewer[" + reviewerIndex
//                    + "].reviewerUnavailable";
//            this.reportError(parameterName, KeyConstants.ERROR_PROTOCOL_REVIEWER_NOT_AVAILABLE, reviewer.getFullName());
//        }
//
//        return valid;
//    }


//TODO: Must do following for IACUC work.    
//    /**
//     * This method tests if the fields for a given reviewer have legal values.
//     * 
//     * @param reviewer
//     * @param reviewerIndex - the index of the reviewer in the list of reviewers that was sent to the client
//     */
//    private boolean isReviewerValid(ProtocolReviewerBean reviewer, int reviewerIndex) {
//        boolean isValid = true;
//        String reviewerTypeCode = reviewer.getReviewerTypeCode();
//
//        String parameterName = Constants.PROTOCOL_SUBMIT_ACTION_PROPERTY_KEY + ".reviewer[" + reviewerIndex + "].reviewerTypeCode";
//
//        // test if type code is valid
//        if (!StringUtils.isBlank(reviewerTypeCode) && isReviewerTypeInvalid(reviewerTypeCode)) {
//            isValid = false;
//            this.reportError(parameterName, KeyConstants.ERROR_PROTOCOL_REVIEWER_TYPE_INVALID, reviewer.getFullName());
//        }
//
//        return isValid;
//    }

//TODO: Must do following for IACUC work.    
    private boolean isValidSubmReviewType(IacucProtocolSubmitAction submitAction) {
        boolean valid = true;
        if (StringUtils.isNotBlank(submitAction.getSubmissionTypeCode())
                && StringUtils.isNotBlank(submitAction.getProtocolReviewTypeCode())) {
//            Map<String, String> fieldValues = new HashMap<String, String>();
//            fieldValues.put("submissionTypeCode", submitAction.getSubmissionTypeCode());
//            List<ValidProtoSubRevType> validProtoSubRevTypes = (List<ValidProtoSubRevType>) getBusinessObjectService()
//                    .findMatching(ValidProtoSubRevType.class, fieldValues);
//            if (!validProtoSubRevTypes.isEmpty()) {
//                List<String> reviewTypes = new ArrayList<String>();
//                for (ValidProtoSubRevType validProtoSubRevType : validProtoSubRevTypes) {
//                    reviewTypes.add(validProtoSubRevType.getProtocolReviewTypeCode());
//                }
//                if (!reviewTypes.contains(submitAction.getProtocolReviewTypeCode())
//                        && !isReviewTypeInvalid(submitAction.getProtocolReviewTypeCode())) {
//                    GlobalVariables.getMessageMap().putError(
//                            Constants.PROTOCOL_SUBMIT_ACTION_PROPERTY_KEY + ".protocolReviewTypeCode",
//                            KeyConstants.INVALID_SUBMISSION_REVIEW_TYPE,
//                            new String[] {
//                                    ((IacucProtocolSubmissionType) getBo(IacucProtocolSubmissionType.class, "submissionTypeCode",
//                                            submitAction.getSubmissionTypeCode())).getDescription(),
//                                    ((IacucProtocolReviewType) getBo(IacucProtocolReviewType.class, "reviewTypeCode",
//                                            submitAction.getProtocolReviewTypeCode())).getDescription() });
//                    valid = false;
//                }
//
//            }
        }
        return valid;
    }

//TODO: Must do following for IACUC work.    
    private boolean isValidSubmTypeQual(IacucProtocolSubmitAction submitAction) {
        boolean valid = true;
        if (StringUtils.isNotBlank(submitAction.getSubmissionTypeCode())) {
            Map<String, String> fieldValues = new HashMap<String, String>();
            fieldValues.put("submissionTypeCode", submitAction.getSubmissionTypeCode());
//            List<ValidProtoSubTypeQual> validProtoSubTypeQuals = (List<ValidProtoSubTypeQual>) getBusinessObjectService()
//                    .findMatching(ValidProtoSubTypeQual.class, fieldValues);
//            if (!validProtoSubTypeQuals.isEmpty()) {
//                List<String> typeQuals = new ArrayList<String>();
//                for (ValidProtoSubTypeQual validProtoSubTypeQual : validProtoSubTypeQuals) {
//                    typeQuals.add(validProtoSubTypeQual.getSubmissionTypeQualCode());
//                }
//                if (StringUtils.isBlank(submitAction.getSubmissionQualifierTypeCode())
//                        || !typeQuals.contains(submitAction.getSubmissionQualifierTypeCode())) {
//                    String desc = "";
//                    ProtocolSubmissionQualifierType typeQual = (ProtocolSubmissionQualifierType) getBo(
//                            ProtocolSubmissionQualifierType.class, "submissionQualifierTypeCode",
//                            submitAction.getSubmissionQualifierTypeCode());
//                    if (typeQual != null) {
//                        desc = typeQual.getDescription();
//                    }
//                    GlobalVariables.getMessageMap().putError(
//                            Constants.PROTOCOL_SUBMIT_ACTION_PROPERTY_KEY + ".submissionQualifierTypeCode",
//                            KeyConstants.INVALID_SUBMISSION_TYPE_QUALIFIER,
//                            new String[] {
//                                    ((IacucProtocolSubmissionType) getBo(IacucProtocolSubmissionType.class, "submissionTypeCode",
//                                            submitAction.getSubmissionTypeCode())).getDescription(), desc });
//                    valid = false;
//                }
//            }
        }
        return valid;
    }

    private boolean isSubmissionTypeInvalid(String submissionTypeCode) {
        return !existsUnique(IacucProtocolSubmissionType.class, "submissionTypeCode", submissionTypeCode);
    }

    private boolean isReviewTypeInvalid(String reviewTypeCode) {
        return !existsUnique(IacucProtocolReviewType.class, "reviewTypeCode", reviewTypeCode);
    }

//TODO: Must do following for IACUC work.    
//    private boolean isReviewerTypeInvalid(String reviewerTypeCode) {
//        return !existsUnique(IacucProtocolReviewerType.class, "reviewerTypeCode", reviewerTypeCode);
//    }

    /**
     * Returns true if exactly one instance of a given business object type exists in the Database; false otherwise.
     * 
     * @param boType
     * @param propertyName the name of the BO field to query
     * @param keyField the field to test against.
     * @return true if one object exists; false if no objects or more than one are found
     */
    private boolean existsUnique(Class<? extends BusinessObject> boType, String propertyName, String keyField) {
        if (keyField != null) {
            BusinessObjectService businessObjectService = KraServiceLocator.getService(BusinessObjectService.class);
            Map<String, String> fieldValues = new HashMap<String, String>();
            fieldValues.put(propertyName, keyField);
            if (businessObjectService.countMatching(boType, fieldValues) == 1) {
                return true;
            }
        }
        return false;
    }

    @SuppressWarnings("unchecked")
    private BusinessObject getBo(Class<? extends BusinessObject> boType, String propertyName, String keyField) {
        Map<String, String> fieldValues = new HashMap<String, String>();
        fieldValues.put(propertyName, keyField);

        List<BusinessObject> results = (List<BusinessObject>) getBusinessObjectService().findMatching(boType, fieldValues);
        if (results.isEmpty()) {
            return null;
        }
        else {
            return results.get(0);
        }
    }

    /**
     * Is it mandatory for the submission to contain the committee and schedule?
     * 
     * @return true if mandatory; otherwise false
     */
    private boolean isMandatory() {
        final String param = this.getParameterService().getParameterValueAsString(IacucProtocolDocument.class,
                Constants.PARAMETER_IRB_COMM_SELECTION_DURING_SUBMISSION);

        return StringUtils.equalsIgnoreCase(MANDATORY, param);
    }

    /**
     * Looks up and returns the ParameterService.
     * 
     * @return the parameter service.
     */
    protected ParameterService getParameterService() {
        if (this.parameterService == null) {
            this.parameterService = KraServiceLocator.getService(ParameterService.class);
        }
        return this.parameterService;
    }

    private CommitteeService getCommitteeService() {
        if (null == this.committeeService) {
            this.committeeService = KraServiceLocator.getService(CommitteeService.class);
        }
        return this.committeeService;
    }

    /**
     * 
     * This method can be used in production for injecting a real committee service, and in testing it can be used for setting a
     * mock service.
     * 
     * @param committeeService
     */
    public void setCommitteeService(CommitteeService committeeService) {
        this.committeeService = committeeService;
    }

}
