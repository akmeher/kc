-- Foreign Key Constraint(s)
ALTER TABLE PROPOSAL_UNIT_CREDIT_SPLIT 
ADD CONSTRAINT FK1_PROPOSAL_UNIT_CREDIT_SPLIT 
FOREIGN KEY (PROPOSAL_ID) 
REFERENCES PROPOSAL (PROPOSAL_ID);

ALTER TABLE PROPOSAL_UNIT_CREDIT_SPLIT 
ADD CONSTRAINT FK2_PROPOSAL_UNIT_CREDIT_SPLIT 
FOREIGN KEY (INV_CREDIT_TYPE_CODE) 
REFERENCES INV_CREDIT_TYPE (INV_CREDIT_TYPE_CODE);

