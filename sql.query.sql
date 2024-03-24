SELECT B.ID, C.ID, E.ID, E.ESCROW_AMOUNT FROM DEVELOPER
    INNER JOIN CONTRACT C on DEVELOPER.ID = C.D_ID
    INNER JOIN (SELECT *, ROW_NUMBER() over (PARTITION BY CS.C_ID) AS RN  FROM CONTRACT_STATUS CS ORDER BY CS.CREATED_AT DESC) CS on C.ID = CS.C_ID
    INNER JOIN BUYER B on C.B_ID = B.ID
    INNER JOIN ESCROW E on C.ID = E.C_ID
    WHERE DEVELOPER.NAME = '[NAME]' AND CS.RN = 1 AND CS.STATUS = 'ACTIVE';