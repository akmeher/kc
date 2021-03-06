CREATE OR REPLACE PROCEDURE GET_S2S_SUB_DETAILS_FOR_POLL (
    AV_STATUS IN  VARCHAR2,AV_STOP_POLL_INTERVAL NUMBER,
    CUR_GENERIC IN OUT RESULT_SETS.CUR_GENERIC )

IS
BEGIN

  OPEN CUR_GENERIC FOR
    SELECT
		SUB.PROPOSAL_NUMBER,
 		SUB.SUBMISSION_NUMBER,
 		SUB.COMMENTS,
 		SUB.GG_TRACKING_ID,
 		SUB.AGENCY_TRACKING_ID,
 		SUB.RECEIVED_DATE,
 		SUB.LAST_MODIFIED_DATE,
		SUB.STATUS,
 		SUB.UPDATE_TIMESTAMP,
 		SUB.UPDATE_USER,
 		SUB.LAST_NOTIFIED_DATE
    FROM
		OSP$S2S_APP_SUBMISSION SUB
    WHERE
      SUB.STATUS in (  SELECT column_value
  	  			 	   FROM TABLE (CAST (FN_PARSE_STRING(av_status) AS pr_result_Table))) and
	  SUB.SUBMISSION_NUMBER = (SELECT MAX(SUBMISSION_NUMBER)
	  						  		  FROM OSP$S2S_APP_SUBMISSION
									  WHERE	  PROPOSAL_NUMBER = SUB.PROPOSAL_NUMBER)
			-- if stop poll interval is null, take appr. 6 months (4320 hrs) as default to stop polling
     and nvl(AV_STOP_POLL_INTERVAL,4320)>=(to_number(SYSDATE-nvl(SUB.LAST_MODIFIED_DATE,SUB.RECEIVED_DATE))*24);
END;
/

