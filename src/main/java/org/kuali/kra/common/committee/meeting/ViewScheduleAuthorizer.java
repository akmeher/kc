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
package org.kuali.kra.common.committee.meeting;

import org.kuali.kra.common.committee.bo.Committee;
import org.kuali.kra.common.committee.bo.CommonCommitteeSchedule;
import org.kuali.kra.common.committee.document.authorization.CommitteeScheduleTask;
import org.kuali.kra.common.committee.document.authorization.CommitteeTask;
import org.kuali.kra.common.committee.document.authorizer.CommitteeAuthorizer;

public abstract class ViewScheduleAuthorizer extends CommitteeAuthorizer {

    /**
     * @see org.kuali.kra.protocol.document.authorizer.CommitteeAuthorizer#isAuthorized(java.lang.String, org.kuali.kra.protocol.document.authorization.CommitteeTask)
     */
    public boolean isAuthorized(String username, CommitteeTask task) {
        boolean hasPermission = true;
        Committee committee = task.getCommittee();
        if (task instanceof CommitteeScheduleTask) {
//            hasPermission = hasPermission(username,((CommitteeScheduleTask)task).getCommitteeSchedule(),PermissionConstants.VIEW_IACUC_SCHEDULE);
            hasPermission = hasPermission(username,((CommitteeScheduleTask)task).getCommitteeSchedule(), getPermissionNameForViewScheduleHook());
            // now check if this schedule is flagged as available by admin
            hasPermission = hasPermission && ((CommitteeScheduleTask)task).getCommitteeSchedule().isAvailableToReviewers();
        } else {
            hasPermission = hasPermission(username, committee, getPermissionNameForViewScheduleHook());
        }        
        return hasPermission;
    }

    protected abstract String getPermissionNameForViewScheduleHook();

    /**
     * Does the given user has the permission for this committee?
     * @param username the unique username of the user
     * @param committee the committee
     * @param permissionName the name of the permission
     * @return true if the person has the permission; otherwise false
     */
    protected final boolean hasPermission(String userId, CommonCommitteeSchedule committeeSchedule, String permissionName) {
        return kraAuthorizationService.hasPermission(userId, committeeSchedule, permissionName);
    }
    

}
