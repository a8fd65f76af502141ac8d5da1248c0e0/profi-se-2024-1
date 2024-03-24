INSERT INTO DEVELOPER (ID, NAME, LAW_OGRN, LAW_ADDRESS, ADDITIONAL_INFO) VALUES
 (1, 'TEST', 'TEST', 'TEST', '');

INSERT INTO BUYER (ID, TYPE) VALUES
         (1, 'LEGAL'),
         (2, 'PHYSICAL'),
         (3, 'LEGAL'),
         (4, 'PHYSICAL'),
         (5, 'LEGAL'),
         (6, 'PHYSICAL');

INSERT INTO BUYER_BANK_ADDRESS (ID, ADDRESS_INFO, B_ID) VALUES
        (1, '1', 1),
        (2, '2', 2),
        (3, '3', 3),
        (4, '4', 4),
        (5, '5', 5),
        (6, '6', 6);

INSERT INTO DEVELOPER_BANK_ADDRESS (ID, ADDRESS_INFO, D_ID) VALUES
        (1, '1', 1);


INSERT INTO HOUSING (ID, ADDRESS_CITY, ADDRESS_STREET, ADDRESS_HOUSE, ADDRESS_ADDITIONAL, D_ID) VALUES
    (1, 'TEST', 'TEST', 'TEST', 'TEST', 1),
    (2, 'TEST', 'TEST', 'TEST', 'TEST', 1),
    (3, 'TEST', 'TEST', 'TEST', 'TEST', 1),
    (4, 'TEST', 'TEST', 'TEST', 'TEST', 1),
    (5, 'TEST', 'TEST', 'TEST', 'TEST', 1),
    (6, 'TEST', 'TEST', 'TEST', 'TEST', 1);

INSERT INTO CONTRACT (ID, B_ID, D_ID, H_ID, SUM, CONTRACT_PLAN_OPEN_DATE) VALUES
    (1, 1, 1, 1, 1000, '21.03.2025'),
    (2, 2, 1, 2, 1000, '21.03.2023'),
    (3, 3, 1, 3, 1000, '21.03.2023'),
    (4, 4, 1, 4, 1000, '21.03.2023'),
    (5, 5, 1, 5, 1000, '21.03.2023'),
    (6, 6, 1, 6, 1000, '21.03.2023');

INSERT INTO CONTRACT_STATUS (ID, STATUS, CREATED_AT, C_ID) VALUES
    (1, 'ACTIVE', '21.03.2024', 1),
    (2, 'ACTIVE', '21.03.2024', 2),
    (3, 'ACTIVE', '21.03.2024', 3),
    (4, 'ACTIVE', '21.03.2024', 4),
    (5, 'ACTIVE', '21.03.2024', 5),
    (6, 'ACTIVE', '21.03.2024', 6);

INSERT INTO ESCROW (id, c_id, escrow_amount, from_bank_address, target_bank_address) VALUES
    (1, 1, 1000, 1, 1),
    (2, 2, 1000, 1, 2),
    (3, 3, 1000, 1, 3),
    (4, 4, 1000, 1, 4),
    (5, 5, 1000, 1, 5),
    (6, 6, 1000, 1, 6)