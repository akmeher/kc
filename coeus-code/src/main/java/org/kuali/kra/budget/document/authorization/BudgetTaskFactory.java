/*
 * Copyright 2005-2014 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.osedu.org/licenses/ECL-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.budget.document.authorization;

import org.apache.struts.action.ActionForm;
import org.kuali.coeus.sys.framework.auth.task.Task;
import org.kuali.coeus.sys.framework.auth.task.WebTaskFactoryBase;
import org.kuali.kra.budget.document.BudgetDocument;
import org.kuali.kra.budget.document.BudgetParentDocument;
import org.kuali.kra.budget.web.struts.form.BudgetForm;
import org.kuali.kra.infrastructure.TaskGroupName;

import javax.servlet.http.HttpServletRequest;

/**
 * The Budget Task Factory will create a Budget Task with its
 * task name and the budget document contained within the form.
 */
public class BudgetTaskFactory extends WebTaskFactoryBase {

    private String taskGroupName = TaskGroupName.PROPOSAL_BUDGET;
    @Override
    public Task createTask(ActionForm form, HttpServletRequest request) {
        BudgetForm budgetForm = (BudgetForm) form;
        BudgetDocument budgetDocument = budgetForm.getBudgetDocument();
        BudgetParentDocument parentDocument = budgetDocument.getParentDocument(); 
        if(parentDocument!=null ){
            taskGroupName = budgetDocument.getParentDocument().getTaskGroupName();
        }
        return new BudgetTask(getTaskName(), getTaskGroupName(),budgetDocument);
    }

    @Override
    public String getTaskGroupName() {
        return taskGroupName;
    }
}
