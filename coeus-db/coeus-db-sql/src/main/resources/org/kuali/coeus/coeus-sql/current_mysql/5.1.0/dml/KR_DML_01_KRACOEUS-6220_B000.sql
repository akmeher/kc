DELIMITER /
UPDATE KRCR_PARM_T SET PARM_TYP_CD='HELP' WHERE NMSPC_CD='KC-PROTOCOL' AND PARM_NM='protocolMedusaHelp'
/

UPDATE KRCR_PARM_T SET PARM_TYP_CD='HELP' WHERE NMSPC_CD='KC-IACUC' AND PARM_NM='protocolMedusaHelp'
/
DELIMITER ;