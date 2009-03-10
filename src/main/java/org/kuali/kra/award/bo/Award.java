/*
 * Copyright 2006-2008 The Kuali Foundation
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
package org.kuali.kra.award.bo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.axis.utils.StringUtils;
import org.kuali.core.util.KualiDecimal;
import org.kuali.kra.award.document.AwardDocument;
import org.kuali.kra.award.paymentreports.paymentschedule.AwardPaymentSchedule;
import org.kuali.kra.award.paymentreports.specialapproval.approvedequipment.AwardApprovedEquipment;
import org.kuali.kra.award.paymentreports.specialapproval.foreigntravel.AwardApprovedForeignTravel;
import org.kuali.kra.bo.KraPersistableBusinessObjectBase;
import org.kuali.kra.bo.ScienceKeyword;
import org.kuali.kra.bo.Sponsor;
import org.kuali.kra.document.KeywordsManager;
import org.kuali.kra.document.SpecialReviewHandler;
import org.kuali.kra.infrastructure.Constants;

/**
 * 
 * This class is Award Business Object.
 * It implements ProcessKeywords to process all operations related to AwardScenceKeywords.
 */
public class Award extends KraPersistableBusinessObjectBase implements KeywordsManager<AwardScienceKeyword>,SpecialReviewHandler<AwardSpecialReview>{
    public static final String AWARD_NAMESPACE_CODE = "KC-AWARD";
    
    private static final String ONE = "1";
    private static final String AWARD_TITLE = "Award";
    private static final String YES_FLAG = "Y";
    
    private static final long serialVersionUID = 3797220122448310165L;
    private Long awardId;
    private AwardDocument awardDocument;
    private String awardNumber;
    private Integer sequenceNumber;
    private String sponsorCode;
    private Integer statusCode;
    private Integer templateCode;
    private String accountNumber;
    private String approvedEquipmentIndicator;
    private String approvedForeignTripIndicator;
    private String subContractIndicator;
    private Date awardEffectiveDate;
    private Date awardExecutionDate;
    private Date beginDate;
    private String costSharingIndicator;
    private String indirectCostIndicator;
    private String modificationNumber;
    private String nsfCode;
    private String paymentScheduleIndicator;
    private String scienceCodeIndicator;
    private String specialReviewIndicator;
    private String sponsorAwardNumber;
    private String transferSponsorIndicator;
    private Integer accountTypeCode;
    private Integer activityTypeCode;
    private Integer awardTypeCode;
    private String primeSponsorCode;
    private Integer basisOfPaymentCode;
    private String cfdaNumber;
    private Integer competingRenewalProposalDue;
    private String documentFundingId;
    private Integer finalInvoiceDue;
    private Integer invoiceNumberOfCopies;
    private Integer methodOfPaymentCode;
    private Integer nonCompetingContProposalDue;
    private Integer paymentInvoiceFrequencyCode;
    private KualiDecimal preAwardAuthorizedAmount;
    private Date preAwardEffectiveDate;
    private KualiDecimal preAwardInstitutionalAuthorizedAmount;
    private Date preAwardInstitutionalEffectiveDate;
    private String procurementPriorityCode;
    private String proposalNumber;
    private KualiDecimal specialEbRateOffCampus;
    private KualiDecimal specialEbRateOnCampus;
    private String subPlanFlag;
    private String title;
    
    private Sponsor sponsor;
    private Sponsor primeSponsor;

    private List<AwardComment> awardComments;
//    private Map<Integer, AwardComment> commentMap;
    private Map<String, AwardComment> commentMap;
    private List<AwardCostShare> awardCostShares;
    private List<AwardFandaRate> awardFandaRate;
    private List<AwardReportTerm> awardReportTerms;
    private List<AwardSponsorTerm> awardSponsorTerms;

    private List<AwardApprovedSubaward> awardApprovedSubawards;
    
    private List<AwardScienceKeyword> keywords;
    private List<AwardSpecialReview> specialReviews;
    private List<AwardApprovedEquipment> approvedEquipmentItems;
    private List<AwardApprovedForeignTravel> approvedForeignTravelTrips;
    private List<AwardPaymentSchedule> paymentScheduleItems;

    /**
     * 
     * Constructs an Award BO.
     */
    public Award() {
        super();
        initializeAwardWithDefaultValues();
        initializeCollections();
    }
    
    /**
     * 
     * This method sets the default values for initial persistence as part of skeleton.
     * As various panels are developed; corresponding field initializations should be removed from
     * this method.  
     */
    private void initializeAwardWithDefaultValues(){
        setAwardNumber(ONE);
        setSequenceNumber(1);
        setApprovedEquipmentIndicator(YES_FLAG);
        setApprovedForeignTripIndicator(YES_FLAG);
        setSubContractIndicator(YES_FLAG);
        setCostSharingIndicator(YES_FLAG);
        setIdcIndicator(YES_FLAG);
        setPaymentScheduleIndicator(YES_FLAG);
        setScienceCodeIndicator(YES_FLAG);
        setSpecialReviewIndicator(YES_FLAG);
        setTransferSponsorIndicator(YES_FLAG);
        setAwardTypeCode(1);
    }
    
    /**
    *
    * @return
    */
    private Map<String, AwardComment> getCommentMap(){
        if(commentMap == null){
            commentMap = new HashMap<String, AwardComment>();
            for(AwardComment ac : awardComments){
                commentMap.put(ac.getCommentType().getCommentTypeCode(), ac);
            }
        }
        return commentMap;
    }
    
    /**
     *
     * @return
     */
    public Long getAwardId() {
        return awardId;
    }

    /**
     *
     * @param awardId
     */
    public void setAwardId(Long awardId) {
        this.awardId = awardId;
    }

    
    /**
     *
     * @return
     */
    public String getAwardNumber() {
        return awardNumber;
    }
    
    /**
     *
     * @param awardNumber
     */
    public void setAwardNumber(String awardNumber) {
        this.awardNumber = awardNumber;
    }


    /**
     *
     * @return
     */
    public Integer getSequenceNumber() {
        return sequenceNumber;
    }

    /**
     *
     * @param sequenceNumber
     */
    public void setSequenceNumber(Integer sequenceNumber) {
        this.sequenceNumber = sequenceNumber;
    }

    
    /**
     *
     * @return
     */
    public String getSponsorCode() {
        return sponsorCode;
    }

    /**
     *
     * @param sponsorCode
     */
    public void setSponsorCode(String sponsorCode) {
        this.sponsorCode = sponsorCode;
    }


    /**
     *
     * @return
     */
    public Integer getStatusCode() {
        return statusCode;
    }

    /**
     *
     * @param statusCode
     */
    public void setStatusCode(Integer statusCode) {
        this.statusCode = statusCode;
    }


    /**
     *
     * @return
     */
    public Integer getTemplateCode() {
        return templateCode;
    }

    /**
     *
     * @param templateCode
     */
    public void setTemplateCode(Integer templateCode) {
        this.templateCode = templateCode;
    }


    /**
     *
     * @return
     */
    public String getAccountNumber() {
        return accountNumber;
    }

    /**
     *
     * @param accountNumber
     */
    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    /**
     * 
     * @return
     */
    public List<AwardApprovedEquipment> getApprovedEquipmentItems() {
        return approvedEquipmentItems;
    }
    
    /**
     * @return
     */
    public int getApprovedEquipmentItemCount() {
        return approvedEquipmentItems.size();
    }
    
    /**
     * @return
     */
    public int getApprovedForeignTravelTripCount() {
        return approvedForeignTravelTrips.size();
    }
    
    /**
     * @return
     */
    public List<AwardApprovedForeignTravel> getApprovedForeignTravelTrips() {
        return approvedForeignTravelTrips;
    }
    
    /**
     * 
     */
    public void setApprovedEquipmentItems(List<AwardApprovedEquipment> awardApprovedEquipmentItems) {
       this.approvedEquipmentItems = awardApprovedEquipmentItems;
    }

    /**
     * 
     */
    public void setApprovedForeignTravelTrips(List<AwardApprovedForeignTravel> approvedForeignTravelTrips) {
       this.approvedForeignTravelTrips = approvedForeignTravelTrips;
    }
    
    /**
     *
     * @return
     */
    public String getApprovedEquipmentIndicator() {
        return approvedEquipmentIndicator;
    }

    /**
     *
     * @param approvedEquipmentIndicator
     */
    public void setApprovedEquipmentIndicator(String approvedEquipmentIndicator) {
        this.approvedEquipmentIndicator = approvedEquipmentIndicator;
    }


    /**
     *
     * @return
     */
    public String getApprovedForeignTripIndicator() {
        return approvedForeignTripIndicator;
    }

    /**
     *
     * @param approvedForeignTripIndicator
     */
    public void setApprovedForeignTripIndicator(String approvedForeignTripIndicator) {
        this.approvedForeignTripIndicator = approvedForeignTripIndicator;
    }


    /**
     *
     * @return
     */
    public String getSubContractIndicator() {
        return subContractIndicator;
    }

    /**
     *
     * @param subContractIndicator
     */
    public void setSubContractIndicator(String subContractIndicator) {
        this.subContractIndicator = subContractIndicator;
    }


    /**
     *
     * @return
     */
    public Date getAwardEffectiveDate() {
        return awardEffectiveDate;
    }

    /**
     *
     * @param awardEffectiveDate
     */
    public void setAwardEffectiveDate(Date awardEffectiveDate) {
        this.awardEffectiveDate = awardEffectiveDate;
    }


    /**
     *
     * @return
     */
    public Date getAwardExecutionDate() {
        return awardExecutionDate;
    }

    /**
     *
     * @param awardExecutionDate
     */
    public void setAwardExecutionDate(Date awardExecutionDate) {
        this.awardExecutionDate = awardExecutionDate;
    }


    /**
     *
     * @return
     */
    public Date getBeginDate() {
        return beginDate;
    }

    /**
     *
     * @param beginDate
     */
    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }


    /**
     *
     * @return
     */
    public String getCostSharingIndicator() {
        return costSharingIndicator;
    }

    /**
     *
     * @param costSharingIndicator
     */
    public void setCostSharingIndicator(String costSharingIndicator) {
        this.costSharingIndicator = costSharingIndicator;
    }


    /**
     * 
     * For ease of use in JSP and tag files; the getter method uses acronym instead of full meaning.
     * idcIndicator is an acronym. Its full meaning is Indirect Cost Indicator 
     * @return
     */
    public String getIdcIndicator() {
        return indirectCostIndicator;
    }

    /**
     * 
     * For ease of use in JSP and tag files; the setter method uses acronym instead of full meaning.
     * idcIndicator is an acronym. Its full meaning is Indirect Cost Indicator
     * @param indirectCostIndicator
     */
    public void setIdcIndicator(String indirectCostIndicator) {
        this.indirectCostIndicator = indirectCostIndicator;
    }


    /**
     *
     * @return
     */
    public String getModificationNumber() {
        return modificationNumber;
    }

    /**
     *
     * @param modificationNumber
     */
    public void setModificationNumber(String modificationNumber) {
        this.modificationNumber = modificationNumber;
    }


    /**
     * NSFCode is an acronym. Its full meaning is National Science Foundation.
     * @return
     */
    public String getNsfCode() {
        return nsfCode;
    }

    /**
     * NSFCode is an acronym. Its full meaning is National Science Foundation.
     * @param nsfCode
     */
    public void setNsfCode(String nsfCode) {
        this.nsfCode = nsfCode;
    }


    /**
     *
     * @return
     */
    public String getPaymentScheduleIndicator() {
        return paymentScheduleIndicator;
    }

    /**
     *
     * @param paymentScheduleIndicator
     */
    public void setPaymentScheduleIndicator(String paymentScheduleIndicator) {
        this.paymentScheduleIndicator = paymentScheduleIndicator;
    }


    /**
     *
     * @return
     */
    public String getScienceCodeIndicator() {
        return scienceCodeIndicator;
    }

    /**
     *
     * @param scienceCodeIndicator
     */
    public void setScienceCodeIndicator(String scienceCodeIndicator) {
        this.scienceCodeIndicator = scienceCodeIndicator;
    }


    /**
     *
     * @return
     */
    public String getSpecialReviewIndicator() {
        return specialReviewIndicator;
    }

    /**
     *
     * @param specialReviewIndicator
     */
    public void setSpecialReviewIndicator(String specialReviewIndicator) {
        this.specialReviewIndicator = specialReviewIndicator;
    }


    /**\
     *
     * @return
     */
    public String getSponsorAwardNumber() {
        return sponsorAwardNumber;
    }

    /**
     *
     * @param sponsorAwardNumber
     */
    public void setSponsorAwardNumber(String sponsorAwardNumber) {
        this.sponsorAwardNumber = sponsorAwardNumber;
    }


    /**
     *
     * @return
     */
    public String getTransferSponsorIndicator() {
        return transferSponsorIndicator;
    }

    /**
     * 
     * @param transferSponsorIndicator
     */
    public void setTransferSponsorIndicator(String transferSponsorIndicator) {
        this.transferSponsorIndicator = transferSponsorIndicator;
    }


    /**
     *
     * @return
     */
    public Integer getAccountTypeCode() {
        return accountTypeCode;
    }

    /**
     *
     * @param accountTypeCode
     */
    public void setAccountTypeCode(Integer accountTypeCode) {
        this.accountTypeCode = accountTypeCode;
    }


    /**
     * 
     * @return
     */
    public Integer getActivityTypeCode() {
        return activityTypeCode;
    }

    /**
     *
     * @param activityTypeCode
     */
    public void setActivityTypeCode(Integer activityTypeCode) {
        this.activityTypeCode = activityTypeCode;
    }


    /**
     *
     * @return
     */
    public Integer getAwardTypeCode() {
        return awardTypeCode;
    }

    /**
     *
     * @param awardTypeCode
     */
    public void setAwardTypeCode(Integer awardTypeCode) {
        this.awardTypeCode = awardTypeCode;
    }


    /**
     *
     * @return
     */
    public String getPrimeSponsorCode() {
        return primeSponsorCode;
    }

    /**
     *
     * @param primeSponsorCode
     */
    public void setPrimeSponsorCode(String primeSponsorCode) {
        this.primeSponsorCode = primeSponsorCode;
    }


    /**
     *
     * @return
     */
    public Integer getBasisOfPaymentCode() {
        return basisOfPaymentCode;
    }

    /**
     *
     * @param basisOfPaymentCode
     */
    public void setBasisOfPaymentCode(Integer basisOfPaymentCode) {
            this.basisOfPaymentCode = basisOfPaymentCode;    
    }


    /**
     * 
     * cfdaNumber is an acronym. Its full meaning is Catalog of Federal Domestic Assistance
     * @return
     */
    public String getCfdaNumber() {
        return cfdaNumber;
    }

    /**
     * 
     * cfdaNumber is an acronym. Its full meaning is Catalog of Federal Domestic Assistance
     * @param cfdaNumber
     */
    public void setCfdaNumber(String cfdaNumber) {
        this.cfdaNumber = cfdaNumber;
    }


    /**
     *
     * @return
     */
    public Integer getCompetingRenewalProposalDue() {
        return competingRenewalProposalDue;
    }

    /**
     *
     * @param competingRenewalProposalDue
     */
    public void setCompetingRenewalProposalDue(Integer competingRenewalProposalDue) {
        this.competingRenewalProposalDue = competingRenewalProposalDue;
    }


    /**
     * 
     * @return
     */
    public String getDocumentFundingId() {
        return documentFundingId;
    }

    /**
     * 
     * This method...
     * @param documentFundingId
     */
    public void setDocumentFundingId(String documentFundingId) {
        this.documentFundingId = documentFundingId;
    }


    /**
     *
     * @return
     */
    public Integer getFinalInvoiceDue() {
        return finalInvoiceDue;
    }

    /**
     *
     * @param finalInvoiceDue
     */
    public void setFinalInvoiceDue(Integer finalInvoiceDue) {
        this.finalInvoiceDue = finalInvoiceDue;
    }


    /**
     *
     * @return
     */
    public Integer getInvoiceNumberOfCopies() {
        return invoiceNumberOfCopies;
    }

    /**
     *
     * @param invoiceNumberOfCopies
     */
    public void setInvoiceNumberOfCopies(Integer invoiceNumberOfCopies) {
        this.invoiceNumberOfCopies = invoiceNumberOfCopies;
    }


    /**
     *
     * @return
     */
    public Integer getMethodOfPaymentCode() {
        return methodOfPaymentCode;
    }

    /**
     *
     * @param methodOfPaymentCode
     */
    public void setMethodOfPaymentCode(Integer methodOfPaymentCode) {
            this.methodOfPaymentCode = methodOfPaymentCode;
    }


    /**
     *
     * @return
     */
    public Integer getNonCompetingContProposalDue() {
        return nonCompetingContProposalDue;
    }

    /**
     *
     * @param nonCompetingContProposalDue
     */
    public void setNonCompetingContProposalDue(Integer nonCompetingContProposalDue) {
        this.nonCompetingContProposalDue = nonCompetingContProposalDue;
    }


    /**
     *
     * @return
     */
    public Integer getPaymentInvoiceFrequencyCode() {
        return paymentInvoiceFrequencyCode;
    }

    /**
     *
     * @param paymentInvoiceFrequencyCode
     */
    public void setPaymentInvoiceFrequencyCode(Integer paymentInvoiceFrequencyCode) {
        this.paymentInvoiceFrequencyCode = paymentInvoiceFrequencyCode;
    }


    /**
     *
     * @return
     */
    public KualiDecimal getPreAwardAuthorizedAmount() {
        return preAwardAuthorizedAmount;
    }

    /**
     *
     * @param preAwardAuthorizedAmount
     */
    public void setPreAwardAuthorizedAmount(KualiDecimal preAwardAuthorizedAmount) {
        this.preAwardAuthorizedAmount = preAwardAuthorizedAmount;
    }


    /**
     *
     * @return
     */
    public Date getPreAwardEffectiveDate() {
        return preAwardEffectiveDate;
    }

    /**
     *
     * @param preAwardEffectiveDate
     */
    public void setPreAwardEffectiveDate(Date preAwardEffectiveDate) {
        this.preAwardEffectiveDate = preAwardEffectiveDate;
    }


    /**
     *
     * @return
     */
    public String getProcurementPriorityCode() {
        return procurementPriorityCode;
    }

    /**
     *
     * @param procurementPriorityCode
     */
    public void setProcurementPriorityCode(String procurementPriorityCode) {
        this.procurementPriorityCode = procurementPriorityCode;
    }


    /**
     *
     * @return
     */
    public String getProposalNumber() {
        return proposalNumber;
    }

    /**
     *
     * @param proposalNumber
     */
    public void setProposalNumber(String proposalNumber) {
        this.proposalNumber = proposalNumber;
    }


    /**
     *
     * @return
     */
    public KualiDecimal getSpecialEbRateOffCampus() {
        return specialEbRateOffCampus;
    }

    /**
     *
     * @param specialEbRateOffCampus
     */
    public void setSpecialEbRateOffCampus(KualiDecimal specialEbRateOffCampus) {
        this.specialEbRateOffCampus = specialEbRateOffCampus;
    }


    /**
     *
     * @return
     */
    public KualiDecimal getSpecialEbRateOnCampus() {
        return specialEbRateOnCampus;
    }

    /**
     *
     * @param specialEbRateOnCampus
     */
    public void setSpecialEbRateOnCampus(KualiDecimal specialEbRateOnCampus) {
        this.specialEbRateOnCampus = specialEbRateOnCampus;
    }


    /**
     *
     * @return
     */
    public String getSubPlanFlag() {
        return subPlanFlag;
    }

    /**
     *
     * @param subPlanFlag
     */
    public void setSubPlanFlag(String subPlanFlag) {
        this.subPlanFlag = subPlanFlag;
    }


    /**
     *
     * @return
     */
    public String getTitle() {
        return title;
    }

    /**
     *
     * @param title
     */
    public void setTitle(String title) {
        this.title = title;
    }
    

    /**
     * 
     * @see org.kuali.core.bo.BusinessObjectBase#toStringMapper()
     */
    @Override    
    protected LinkedHashMap<String,Object> toStringMapper() {        
        LinkedHashMap<String,Object> hashMap = new LinkedHashMap<String,Object>();        
        hashMap.put("awardId", getAwardId());
        hashMap.put("awardNumber", getAwardNumber());
        hashMap.put("sequenceNumber", getSequenceNumber());
        hashMap.put("sponsorCode", getSponsorCode());
        hashMap.put("statusCode", getStatusCode());
        hashMap.put("templateCode", getTemplateCode());
        hashMap.put("accountNumber", getAccountNumber());
        hashMap.put("approvedEquipmentIndicator", getApprovedEquipmentIndicator());
        hashMap.put("approvedForeignTripIndicator", getApprovedForeignTripIndicator());
        hashMap.put("subContractIndicator", getSubContractIndicator());
        hashMap.put("awardEffectiveDate", getAwardEffectiveDate());
        hashMap.put("awardExecutionDate", getAwardExecutionDate());
        hashMap.put("beginDate", getBeginDate());
        hashMap.put("costSharingIndicator", getCostSharingIndicator());
        hashMap.put("indirectCostIndicator", getIdcIndicator());
        hashMap.put("modificationNumber", getModificationNumber());
        hashMap.put("nsfCode", getNsfCode());
        hashMap.put("paymentScheduleIndicator", getPaymentScheduleIndicator());
        hashMap.put("scienceCodeIndicator", getScienceCodeIndicator());
        hashMap.put("specialReviewIndicator", getSpecialReviewIndicator());
        hashMap.put("sponsorAwardNumber", getSponsorAwardNumber());
        hashMap.put("transferSponsorIndicator", getTransferSponsorIndicator());
        hashMap.put("accountTypeCode", getAccountTypeCode());
        hashMap.put("activityTypeCode", getActivityTypeCode());
        hashMap.put("awardTypeCode", getAwardTypeCode());
        hashMap.put("primeSponsorCode", getPrimeSponsorCode());
        hashMap.put("basisOfPaymentCode", getBasisOfPaymentCode());
        hashMap.put("cfdaNumber", getCfdaNumber());
        hashMap.put("competingRenewalProposalDue", getCompetingRenewalProposalDue());
        hashMap.put("documentFundingId", getDocumentFundingId());
        hashMap.put("finalInvoiceDue", getFinalInvoiceDue());
        hashMap.put("invoiceNumberOfCopies", getInvoiceNumberOfCopies());
        hashMap.put("methodOfPaymentCode", getMethodOfPaymentCode());
        hashMap.put("nonCompetingContProposalDue", getNonCompetingContProposalDue());
        hashMap.put("paymentInvoiceFrequencyCode", getPaymentInvoiceFrequencyCode());
        hashMap.put("preAwardAuthorizedAmount", getPreAwardAuthorizedAmount());
        hashMap.put("preAwardEffectiveDate", getPreAwardEffectiveDate());
        hashMap.put("preAwardInstitutionalAuthorizedAmount", getPreAwardInstitutionalAuthorizedAmount());
        hashMap.put("preAwardInstitutionalEffectiveDate", getPreAwardInstitutionalEffectiveDate());
        hashMap.put("procurementPriorityCode", getProcurementPriorityCode());
        hashMap.put("proposalNumber", getProposalNumber());        
        hashMap.put("specialEbRateOffCampus", getSpecialEbRateOffCampus());
        hashMap.put("specialEbRateOnCampus", getSpecialEbRateOnCampus());
        hashMap.put("subPlanFlag", getSubPlanFlag());
        hashMap.put("title", getTitle());
        hashMap.put("awardCostShares", getAwardCostShares());
        hashMap.put("awardComments", getAwardComments());
        return hashMap;
    }    

    /**
     * This method...
     * @return
     */
    public AwardDocument getAwardDocument() {
        return awardDocument;
    }

    /**
     * This method...
     * @param awardDocument
     */
    public void setAwardDocument(AwardDocument awardDocument) {
        this.awardDocument = awardDocument;
    }

    /**
     * This method...
     * @return
     */
    public List<AwardComment> getAwardComments() {
        return awardComments;
    }

    /**
     * This method...
     * @param awardComments
     */
    public void setAwardComments(List<AwardComment> awardComments) {
        this.awardComments = awardComments;
    }

    /**
     * This method...
     * @return
     */
    public List<AwardCostShare> getAwardCostShares() {
        return awardCostShares;
    }

    /**
     * This method...
     * @param awardCostShares
     */
    public void setAwardCostShares(List<AwardCostShare> awardCostShares) {
        this.awardCostShares = awardCostShares;
    }
    
    /**
     * This method...
     * @return
     */
    public List<AwardApprovedSubaward> getAwardApprovedSubawards() {
        return awardApprovedSubawards;
    }

    /**
     * This method...
     * @param awardApprovedSubawards
     */
    public void setAwardApprovedSubawards(List<AwardApprovedSubaward> awardApprovedSubawards) {
        this.awardApprovedSubawards = awardApprovedSubawards;
    }

    /**
    *
    * Get the award Cost Share Comments.  If the comment has not been set...... initialize and return new Comment.
    */
    public AwardComment getAwardCostShareComment(){
        AwardCommentFactory awardCommentFactory = new AwardCommentFactory();  //create Factory class
        AwardComment awardComment = getCommentMap().get(Constants.COST_SHARE_COMMENT_TYPE_CODE);
        if(awardComment == null){
            awardComment = awardCommentFactory.createCostShareComment(this);  //if null initialize in factory class
            add(awardComment);  //add the new CostShareComment to the awardComments list.
            commentMap.put(awardComment.getCommentType().getCommentTypeCode(), awardComment);  //add to Map
        }
        return awardComment;
    }
    
    /**
    *
    * Get the award PreAward Sponsor Authorizations comments.  If the comment has not been set...... initialize and return new Comment.
    */
    public AwardComment getawardPreAwardSponsorAuthorizationComment(){
        AwardCommentFactory awardCommentFactory = new AwardCommentFactory();  //create Factory class
        AwardComment awardComment = getCommentMap().get(Constants.PREAWARD_SPONSOR_AUTHORIZATION_COMMENT_TYPE_CODE);
        if(awardComment == null){
            awardComment = awardCommentFactory.createPreAwardSponsorAuthorizationComment(this);  //if null initialize in factory class
            add(awardComment);  //add the new CostShareComment to the awardComments list.
            commentMap.put(awardComment.getCommentType().getCommentTypeCode(), awardComment);  //add to Map
        }
        return awardComment;
    }
    
    /**
    *
    * Get the award PreAward Institutional Authorizations comments.  If the comment has not been set...... initialize and return new Comment.
    */
    public AwardComment getawardPreAwardInstitutionalAuthorizationComment(){
        AwardCommentFactory awardCommentFactory = new AwardCommentFactory();  //create Factory class
        AwardComment awardComment = getCommentMap().get(Constants.PREAWARD_INSTITUTIONAL_AUTHORIZATION_COMMENT_TYPE_CODE);
        if(awardComment == null){
            awardComment = awardCommentFactory.createPreAwardInstitutionalAuthorizationComment(this);  //if null initialize in factory class
            add(awardComment);  //add the new CostShareComment to the awardComments list.
            commentMap.put(awardComment.getCommentType().getCommentTypeCode(), awardComment);  //add to Map
        }
        return awardComment;
    }
    
    /**
    *
    * Get the award F & A Rates Comments.  If the comment has not been set...... initialize and return new Comment.
    */
    public AwardComment getAwardFandaRateComment(){
        AwardCommentFactory awardCommentFactory = new AwardCommentFactory();  //create Factory class
        AwardComment awardComment = getCommentMap().get(Constants.FANDA_RATE_COMMENT_TYPE_CODE);
        if(awardComment == null){
            awardComment = awardCommentFactory.createFandaRateComment(this);  //if null initialize in factory class
            awardComments.add(awardComment);  //add the new CostShareComment to the awardComments list.
            commentMap.put(awardComment.getCommentType().getCommentTypeCode(), awardComment);  //add to Map
        }
        return awardComment;
    }
    
    /**
    *
    * Get the award AwardPaymentAndInvoiceRequirementsComments.  If the comment has not been set...... initialize and return new Comment.
    */
    public AwardComment getAwardPaymentAndInvoiceRequirementsComments(){
        AwardCommentFactory awardCommentFactory = new AwardCommentFactory();  //create Factory class
        AwardComment awardComment = getCommentMap().get(Constants.PAYMENT_AND_INVOICES_COMMENT_TYPE_CODE);
        if(awardComment == null){
            awardComment = awardCommentFactory.createPaymentAndInvoiceComment(this);  //if null initialize in factory class
            awardComments.add(awardComment);  //add the new Payment And Invoice to the awardComments list.
            commentMap.put(awardComment.getCommentType().getCommentTypeCode(), awardComment);  //add to Map
        }
        return awardComment;
    }
    
    /**
    *
    * Get the award Benefits Rate comments.  If the comment has not been set...... initialize and return new Comment.
    */
    public AwardComment getAwardBenefitsRateComment(){
        AwardCommentFactory awardCommentFactory = new AwardCommentFactory();  //create Factory class
        AwardComment awardComment = getCommentMap().get(Constants.BENEFITS_RATES_COMMENT_TYPE_CODE);
        if(awardComment == null){
            awardComment = awardCommentFactory.createBenefitsRateComment(this);  //if null initialize in factory class
            add(awardComment);
            commentMap.put(awardComment.getCommentType().getCommentTypeCode(), awardComment);  //add to Map
        }
        return awardComment;
    }
    
    /**
     * This method calls getTotalAmount to calculate the total of all Commitment Amounts.
     * @return
     */
     public KualiDecimal getTotalCostShareCommitmentAmount() {
        return getTotalAmount(awardCostShares);
    }
     
     /**
      * This method calculates the total Cost Share Met amount for all Award Cost Shares.
      * @param valuableItems
      * @return The total value
      */
     public KualiDecimal getTotalCostShareMetAmount() {
         KualiDecimal returnVal = new KualiDecimal(0.00);
         for(AwardCostShare awardCostShare : awardCostShares) {
             KualiDecimal amount = awardCostShare.getCostShareMet() != null ? awardCostShare.getCostShareMet() : new KualiDecimal(0.00);
             returnVal = returnVal.add(amount);
         }
         return returnVal;
     }
    
    /**
     * This method totals Approved SubAward amounts
     * @return
     */
    public KualiDecimal getTotalApprovedSubawardAmount() {
        return getTotalAmount(awardApprovedSubawards);
    }
    
     /**
     * This method totals Approved Equipment amounts
     * @return
     */
    public KualiDecimal getTotalApprovedEquipmentAmount(){
        return getTotalAmount(approvedEquipmentItems);
    }
    
    /**
     * This method Approved Foreign Travel trip amounts
     * @return
     */
    public KualiDecimal getTotalApprovedApprovedForeignTravelAmount() {
        return getTotalAmount(approvedForeignTravelTrips);
    }
    
    /**
     * This method...
     * @return
     */
    public List<AwardFandaRate> getAwardFandaRate() {
        return awardFandaRate;
    }

    /**
     * This method...
     * @param awardFandaRate
     */
    public void setAwardFandaRate(List<AwardFandaRate> awardFandaRate) {
        this.awardFandaRate = awardFandaRate;
    }
    
    /**
     * This method...
     * @return
     */
    public List<AwardReportTerm> getAwardReportTerms() {
        return awardReportTerms;
    }

    /**
     * This method...
     * @param awardReportTerms
     */
    public void setAwardReportTerms(List<AwardReportTerm> awardReportTerms) {
        this.awardReportTerms = awardReportTerms;
    }

    /**
     * Gets the keywords attribute. 
     * @return Returns the keywords.
     */
    public List<AwardScienceKeyword> getKeywords() {
        return keywords;
    }

    /**
     * Sets the keywords attribute value.
     * @param keywords The keywords to set.
     */
    public void setKeywords(List<AwardScienceKeyword> keywords) {
        this.keywords = keywords;
    }
    /**
     * Add selected science keyword to award science keywords list.
     * @see org.kuali.kra.document.KeywordsManager#addKeyword(org.kuali.kra.bo.ScienceKeyword)
     */
    public void addKeyword(ScienceKeyword scienceKeyword) {
        AwardScienceKeyword awardScienceKeyword = new AwardScienceKeyword(getAwardId(), scienceKeyword);
        getKeywords().add(awardScienceKeyword);
    }

    /**
     * It returns the ScienceKeyword object from keywords list
     * @see org.kuali.kra.document.KeywordsManager#getKeyword(int)
     */
    public AwardScienceKeyword getKeyword(int index) {
        return getKeywords().get(index);
    }

    /**
     * Sets the awardSpecialReviews attribute value.
     * @param awardSpecialReviews The awardSpecialReviews to set.
     */
    public void setSpecialReviews(List<AwardSpecialReview> awardSpecialReviews) {
        this.specialReviews = awardSpecialReviews;
    }

    /**
     * Add AwardSpecialReview to the AwardSpecialReview list
     * @see org.kuali.kra.document.SpecialReviewHandler#addSpecialReview(java.lang.Object)
     */
    public void addSpecialReview(AwardSpecialReview specialReview) {
        specialReview.setAward(this);
        getSpecialReviews().add(specialReview);
    }

    /**
     * Get AwardSpecialReview from special review list
     * @see org.kuali.kra.document.SpecialReviewHandler#getSpecialReview(int)
     */
    public AwardSpecialReview getSpecialReview(int index) {
        return getSpecialReviews().get(index);
    }

    /**
     * Get special review list
     * @see org.kuali.kra.document.SpecialReviewHandler#getSpecialReviews()
     */
    public List<AwardSpecialReview> getSpecialReviews() {
        return specialReviews;
    }

    /**
     * Add an
     * @param newAwardApprovedEquipment
     */
    public void add(AwardApprovedEquipment approvedEquipmentItem) {
        approvedEquipmentItems.add(0, approvedEquipmentItem);
        approvedEquipmentItem.setAward(this);
    }
    
    /**
     * Add an
     * @param newAwardPaymentSchedule
     */
    public void add(AwardPaymentSchedule paymentScheduleItem) {
        paymentScheduleItems.add(0, paymentScheduleItem);
        paymentScheduleItem.setAward(this);
    }
    
    protected void initializeCollections() {
        setAwardCostShares(new ArrayList<AwardCostShare>());
        setAwardComments(new ArrayList<AwardComment>());
        awardApprovedSubawards = new ArrayList<AwardApprovedSubaward>();
        setAwardFandaRate(new ArrayList<AwardFandaRate>());
        setAwardReportTerms(new ArrayList<AwardReportTerm>());
        keywords = new ArrayList<AwardScienceKeyword>();
        specialReviews = new ArrayList<AwardSpecialReview>();
        approvedEquipmentItems = new ArrayList<AwardApprovedEquipment>();
        approvedForeignTravelTrips = new ArrayList<AwardApprovedForeignTravel>();
        setAwardSponsorTerms(new ArrayList<AwardSponsorTerm>());
        paymentScheduleItems = new ArrayList<AwardPaymentSchedule>();
    }

    /**
     * This method...
     * @return
     */
    public KualiDecimal getPreAwardInstitutionalAuthorizedAmount() {
        return preAwardInstitutionalAuthorizedAmount;
    }

    /**
     * This method...
     * @param preAwardInstitutionalAuthorizedAmount
     */
    public void setPreAwardInstitutionalAuthorizedAmount(KualiDecimal preAwardInstitutionalAuthorizedAmount) {
        this.preAwardInstitutionalAuthorizedAmount = preAwardInstitutionalAuthorizedAmount;
    }

    /**
     * This method...
     * @return
     */
    public Date getPreAwardInstitutionalEffectiveDate() {
        return preAwardInstitutionalEffectiveDate;
    }

    /**
     * This method...
     * @param preAwardInstitutionalEffectiveDate
     */
    public void setPreAwardInstitutionalEffectiveDate(Date preAwardInstitutionalEffectiveDate) {
        this.preAwardInstitutionalEffectiveDate = preAwardInstitutionalEffectiveDate;
    }
    
    /**
     * This method...
     * @param awardCostShare
     */
    public void add(AwardCostShare awardCostShare) {
        awardCostShares.add(awardCostShare);
        awardCostShare.setAward(this);
    }
    
    /**
     * This method...
     * @param awardApprovedSubaward
     */
    public void add(AwardApprovedSubaward awardApprovedSubaward) {
        awardApprovedSubawards.add(awardApprovedSubaward);
        awardApprovedSubaward.setAward(this);
    }
    
    /**
     * This method...
     * @param awardComment
     */
    public void add(AwardComment awardComment) {
        awardComments.add(awardComment);
        awardComment.setAward(this);
    }
    
    /**
     * This method...
     * @param awardSponsorTerm
     */
    public void add(AwardSponsorTerm awardSponsorTerm) {
        awardSponsorTerms.add(awardSponsorTerm);
        awardSponsorTerm.setAward(this);
    }
    
    /**
     * This method calculates the total value of a list of ValuableItems
     * @param valuableItems
     * @return The total value
     */
    KualiDecimal getTotalAmount(List<? extends ValuableItem> valuableItems) {
        KualiDecimal returnVal = new KualiDecimal(0.00);
        for(ValuableItem item : valuableItems) {
            KualiDecimal amount = item.getAmount() != null ? item.getAmount() : new KualiDecimal(0.00);
            returnVal = returnVal.add(amount);
        }
        return returnVal;
    }

    /**
     * Gets the awardSponsorTerms attribute. 
     * @return Returns the awardSponsorTerms.
     */
    public List<AwardSponsorTerm> getAwardSponsorTerms() {
        return awardSponsorTerms;
    }

    /**
     * Sets the awardSponsorTerms attribute value.
     * @param awardSponsorTerms The awardSponsorTerms to set.
     */
    public void setAwardSponsorTerms(List<AwardSponsorTerm> awardSponsorTerms) {
        this.awardSponsorTerms = awardSponsorTerms;
    }
    
    /**
     * This method violates our policy of not calling a service in a getter.
     * This will only call the service once to set a sponsor when a sponsor code exists, 
     * but no sponsor was fetched
     * 
     * Seems like a persistence design issue to me. Why wouldn't Sponsor:Award be a 1:M 
     * relationship handled automagically by the persistence framework? 
     * 
     * @return
     */
    
    public Sponsor getSponsor() {
        if(sponsor == null && !StringUtils.isEmpty(sponsorCode)) {
            this.refreshReferenceObject("sponsor");
        }
        return sponsor;
    }

    public void setSponsor(Sponsor sponsor) {
        this.sponsor = sponsor;
        this.sponsorCode = sponsor != null ? sponsor.getSponsorCode() : null;
    }
    
    public String getSponsorName() {
        if (getSponsor() != null) {
            return getSponsor().getSponsorName();
        }
        return null;
    }

    /**
     * This method adds an approved foreign travel trip
     * @param approvedForeignTravelTrip
     */
    public void add(AwardApprovedForeignTravel approvedForeignTravelTrip) {
        approvedForeignTravelTrips.add(approvedForeignTravelTrip);
        approvedForeignTravelTrip.setAward(this);
    }

    /**
     * Gets the paymentScheduleItems attribute. 
     * @return Returns the paymentScheduleItems.
     */
    public List<AwardPaymentSchedule> getPaymentScheduleItems() {
        return paymentScheduleItems;
    }

    /**
     * Sets the paymentScheduleItems attribute value.
     * @param paymentScheduleItems The paymentScheduleItems to set.
     */
    public void setPaymentScheduleItems(List<AwardPaymentSchedule> paymentScheduleItems) {
        this.paymentScheduleItems = paymentScheduleItems;
    }

    public Sponsor getPrimeSponsor() {
        return primeSponsor;
    }

    public void setPrimeSponsor(Sponsor primeSponsor) {
        this.primeSponsor = primeSponsor;
    }
    
}