create or replace view OSP$BUDGET_DETAILS as 
	select PROPOSAL_NUMBER,VERSION_NUMBER,BUDGET_PERIOD,LINE_ITEM_NUMBER,BUDGET_CATEGORY_CODE,COST_ELEMENT,
	LINE_ITEM_DESCRIPTION,BASED_ON_LINE_ITEM,LINE_ITEM_SEQUENCE,START_DATE,END_DATE,
	LINE_ITEM_COST,COST_SHARING_AMOUNT,UNDERRECOVERY_AMOUNT,ON_OFF_CAMPUS_FLAG,APPLY_IN_RATE_FLAG,
	BUDGET_JUSTIFICATION,UPDATE_TIMESTAMP,UPDATE_USER,QUANTITY
	from BUDGET_DETAILS;