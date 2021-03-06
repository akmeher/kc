DELIMITER /
CREATE TABLE NEGOTIATION  ( 
	NEGOTIATION_ID               	DECIMAL(22) NOT NULL,
	DOCUMENT_NUMBER              	VARCHAR(40) NULL,
	NEGOTATION_STATUS_ID         	DECIMAL(22) NOT NULL,
	NEGOTIATION_AGREEMENT_TYPE_ID	DECIMAL(22) NOT NULL,
	NEGOTIATION_ASSC_TYPE_ID     	DECIMAL(22) NOT NULL,
	NEGOTIATOR_PERSON_ID         	VARCHAR(40) NOT NULL,
	NEGOTIATOR_FULL_NAME			VARCHAR(90) NOT NULL,
	NEGOTIATION_START_DATE       	DATE NULL,
	NEGOTIATION_END_DATE         	DATE NULL,
	ANTICIPATED_AWARD_DATE       	DATE NULL,
	DOCUMENT_FOLDER              	VARCHAR(255) NULL,
	UPDATE_TIMESTAMP     	DATE NOT NULL,
	UPDATE_USER          	VARCHAR(60) NOT NULL,
	VER_NBR              	DECIMAL(8,0) NOT NULL,
	OBJ_ID               	VARCHAR(36) NOT NULL,
	ASSOCIATED_DOCUMENT_ID	VARCHAR(25),
	CONSTRAINT NEGOTIATION_PK1 PRIMARY KEY(NEGOTIATION_ID)
	
) ENGINE InnoDB CHARACTER SET utf8 COLLATE utf8_bin
/
DELIMITER ;
