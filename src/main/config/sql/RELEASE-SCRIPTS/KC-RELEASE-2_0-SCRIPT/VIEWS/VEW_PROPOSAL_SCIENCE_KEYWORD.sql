-- View for Coeus compatibility 
CREATE OR REPLACE VIEW OSP$PROPOSAL_SCIENCE_CODE AS SELECT 
    PROPOSAL_NUMBER, 
    SEQUENCE_NUMBER, 
    SCIENCE_KEYWORD_CODE SCIENCE_CODE, 
    UPDATE_TIMESTAMP, 
    UPDATE_USER
FROM PROPOSAL_SCIENCE_KEYWORD;

