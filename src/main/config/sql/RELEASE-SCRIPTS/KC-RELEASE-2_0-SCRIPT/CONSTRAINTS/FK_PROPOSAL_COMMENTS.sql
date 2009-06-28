-- Foreign Key Constraint(s)
ALTER TABLE PROPOSAL_COMMENTS 
ADD CONSTRAINT FK_PROPOSAL_COMMENTS_CODE 
FOREIGN KEY (COMMENT_TYPE_CODE) 
REFERENCES COMMENT_TYPE (COMMENT_TYPE_CODE);

ALTER TABLE PROPOSAL_COMMENTS 
ADD CONSTRAINT FK_PROPOSAL_COMMENTS 
FOREIGN KEY (PROPOSAL_ID) 
REFERENCES PROPOSAL (PROPOSAL_ID);

