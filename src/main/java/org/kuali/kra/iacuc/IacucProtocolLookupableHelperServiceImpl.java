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
package org.kuali.kra.iacuc;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.BooleanUtils;
import org.apache.commons.lang.StringUtils;
import org.kuali.kra.iacuc.actions.IacucProtocolStatus;
import org.kuali.kra.iacuc.auth.IacucProtocolTask;
import org.kuali.kra.infrastructure.KraServiceLocator;
import org.kuali.kra.infrastructure.TaskName;
import org.kuali.kra.protocol.Protocol;
import org.kuali.kra.protocol.ProtocolLookupableHelperServiceImpl;
import org.kuali.kra.protocol.auth.ProtocolTask;
import org.kuali.rice.kns.lookup.HtmlData;
import org.kuali.rice.krad.bo.BusinessObject;

public class IacucProtocolLookupableHelperServiceImpl extends ProtocolLookupableHelperServiceImpl<IacucProtocol> {

    /**
     * Comment for <code>serialVersionUID</code>
     */
    private static final long serialVersionUID = -4930225152545760432L;
    private static final String[] AMEND_RENEW_PROTOCOL_TASK_CODES = { TaskName.CREATE_IACUC_PROTOCOL_AMENDMENT, 
        TaskName.CREATE_PROTOCOL_RENEWAL };

    private static final String[] REQUEST_PROTOCOL_TASK_CODES = { TaskName.IACUC_PROTOCOL_REQUEST_CLOSE, 
        TaskName.IACUC_PROTOCOL_REQUEST_CLOSE, 
        TaskName.IACUC_PROTOCOL_REQUEST_SUSPENSION, 
        TaskName.IACUC_PROTOCOL_REQUEST_TERMINATE };

    private static final String[] PENDING_PROTOCOL_STATUS_CODES = { IacucProtocolStatus.IN_PROGRESS, 
        IacucProtocolStatus.SUBMITTED_TO_IACUC, 
        IacucProtocolStatus.MINOR_REVISIONS_REQUIRED, 
        IacucProtocolStatus.MAJOR_REVISIONS_REQUIRED, 
        IacucProtocolStatus.WITHDRAWN };

    private static final String[] PENDING_PI_ACTION_PROTOCOL_STATUS_CODES = { IacucProtocolStatus.MINOR_REVISIONS_REQUIRED, 
        IacucProtocolStatus.MAJOR_REVISIONS_REQUIRED,  
        IacucProtocolStatus.EXPIRED };


    @Override
    protected List<? extends BusinessObject> getSearchResultsFilteredByTask(Map<String, String> fieldValues) {
        List<? extends BusinessObject> searchResults = null;
        if (BooleanUtils.toBoolean(fieldValues.get(AMEND_RENEW_PROTOCOL_LOOKUP_ACTION))) {
            searchResults = filterProtocolsByTask(fieldValues, AMEND_RENEW_PROTOCOL_TASK_CODES);
        } else if (BooleanUtils.toBoolean(fieldValues.get(REQUEST_PROTOCOL_ACTION))) {
            searchResults = filterProtocolsByTask(fieldValues, REQUEST_PROTOCOL_TASK_CODES);
        } else if (BooleanUtils.toBoolean(fieldValues.get(PENDING_PROTOCOL_LOOKUP))) {
            searchResults = filterProtocolsByStatus(fieldValues, PENDING_PROTOCOL_STATUS_CODES);
        } else if (BooleanUtils.toBoolean(fieldValues.get(PENDING_PI_ACTION_PROTOCOL_LOOKUP))) {
            searchResults = filterProtocolsByStatus(fieldValues, PENDING_PI_ACTION_PROTOCOL_STATUS_CODES);
        } else if (StringUtils.isNotBlank(fieldValues.get(PROTOCOL_PERSON_ID_LOOKUP))) {
            searchResults = filterProtocolsByPrincipal(fieldValues, PROTOCOL_PERSON_ID_LOOKUP);
        } else {
            searchResults = filterProtocols(fieldValues);
        }
        return searchResults;
    }


    @Override
    protected Map<String, String> removeExtraFilterParameters(Map<String, String> fieldValues) {
        fieldValues.remove(AMEND_RENEW_PROTOCOL_LOOKUP_ACTION);
        fieldValues.remove(REQUEST_PROTOCOL_ACTION);
        fieldValues.remove(PENDING_PROTOCOL_LOOKUP);
        fieldValues.remove(PENDING_PI_ACTION_PROTOCOL_LOOKUP);
        fieldValues.remove(PROTOCOL_PERSON_ID_LOOKUP);
        return fieldValues;
    }


    @Override
    protected List<HtmlData> getCustomActions(BusinessObject businessObject, List pkNames) {
        List<HtmlData> htmlDataList = new ArrayList<HtmlData>();
        if (isParameterTrue(AMEND_RENEW_PROTOCOL_LOOKUP_ACTION)) {
            htmlDataList.add(getPerformActionLink(businessObject, AMEND_RENEW_PROTOCOL_LOOKUP_ACTION));
        } else if (isParameterTrue(REQUEST_PROTOCOL_ACTION)) {
            htmlDataList.add(getPerformActionLink(businessObject, REQUEST_PROTOCOL_ACTION));
        } else {
            htmlDataList.addAll(getEditCopyViewLinks(businessObject, pkNames));
        }
        return htmlDataList;
    }


    @Override
    protected IacucProtocolDao getProtocolDaoHook() {
        return getIacucProtocolDao();
    }

    protected IacucProtocolDao getIacucProtocolDao() {
        return KraServiceLocator.getService(IacucProtocolDao.class);
    }


    @Override
    protected String getDocumentTypeNameHook() {
        return "IacucProtocolDocument";
    }


    @Override
    protected String getHtmlActionHook() {
        return "iacucProtocolProtocol.do";
    }


    @Override
    protected ProtocolTask createNewProtocolTaskInstanceHook(String taskName, Protocol protocol) {
        return new IacucProtocolTask(taskName, (IacucProtocol) protocol);
    }

}
