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
package org.kuali.kra.subaward.document;

import java.util.Map;

import org.kuali.kra.infrastructure.KraServiceLocator;
import org.kuali.kra.maintenance.KraMaintainableImpl;
import org.kuali.kra.subaward.bo.SubAwardAmountReleased;
import org.kuali.rice.core.api.datetime.DateTimeService;
import org.kuali.rice.kns.document.MaintenanceDocument;
import org.kuali.rice.krad.service.DictionaryValidationService;
import org.kuali.rice.krad.util.GlobalVariables;

public class SubAwardInvoiceMaintainableImpl extends KraMaintainableImpl {

    private static final long serialVersionUID = 7243072336736625204L;
    
    private transient DateTimeService dateTimeService;
    private transient DictionaryValidationService dictionaryValidationService;
    
    public SubAwardInvoiceMaintainableImpl() {
        dateTimeService = KraServiceLocator.getService(DateTimeService.class);
        dictionaryValidationService = KraServiceLocator.getService(DictionaryValidationService.class);
    }
    
    @Override
    public void processAfterNew(MaintenanceDocument document, Map<String, String[]> requestParameters) {
        SubAwardAmountReleased invoice = (SubAwardAmountReleased) document.getNoteTarget();
        invoice.setSubAwardId(Long.parseLong(requestParameters.get("subAwardId")[0]));
        invoice.setSubAwardCode(requestParameters.get("subAwardCode")[0]);
        invoice.setSequenceNumber(Integer.parseInt(requestParameters.get("sequenceNumber")[0]));
        invoice.setCreatedDate(getDateTimeService().getCurrentSqlDate());
        invoice.setCreatedBy(GlobalVariables.getUserSession().getPrincipalId());
    }
    
    @Override
    public void prepareForSave() {
        super.prepareForSave();
        SubAwardAmountReleased invoice = (SubAwardAmountReleased) this.getBusinessObject();
        invoice.setDocumentNumber(this.getDocumentNumber());
        if (getDictionaryValidationService().isBusinessObjectValid(invoice)) {
            invoice.populateAttachment();
            getBusinessObjectService().save(invoice);
        } else {
            GlobalVariables.getMessageMap().clearErrorMessages();
        }
    }

    protected DateTimeService getDateTimeService() {
        if (dateTimeService == null) {
            dateTimeService = KraServiceLocator.getService(DateTimeService.class);
        }
        return dateTimeService;
    }

    public void setDateTimeService(DateTimeService dateTimeService) {
        this.dateTimeService = dateTimeService;
    }

    protected DictionaryValidationService getDictionaryValidationService() {
        if (dictionaryValidationService == null) {
            dictionaryValidationService = KraServiceLocator.getService(DictionaryValidationService.class);
        }
        return dictionaryValidationService;
    }

    public void setDictionaryValidationService(DictionaryValidationService dictionaryValidationService) {
        this.dictionaryValidationService = dictionaryValidationService;
    }
    

}