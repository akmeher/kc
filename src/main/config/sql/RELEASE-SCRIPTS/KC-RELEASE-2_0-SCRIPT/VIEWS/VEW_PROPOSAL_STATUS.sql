-- View for Coeus compatibility 
CREATE OR REPLACE VIEW OSP$PROPOSAL_STATUS AS SELECT 
    PROPOSAL_STATUS_CODE, 
    DESCRIPTION, 
    UPDATE_TIMESTAMP, 
    UPDATE_USER
FROM PROPOSAL_STATUS;

