CREATE TABLE IF NOT EXISTS DEVELOPER (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL UNIQUE,
    LAW_OGRN VARCHAR(255) NOT NULL,
    LAW_ADDRESS VARCHAR(255) NOT NULL,
    ADDITIONAL_INFO TEXT
);

CREATE TABLE IF NOT EXISTS DEVELOPER_BANK_ADDRESS (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ADDRESS_INFO VARCHAR(255),
    D_ID INT NOT NULL,
    FOREIGN KEY (D_ID) REFERENCES DEVELOPER(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS BUYER (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    TYPE ENUM('LEGAL', 'PHYSICAL') NOT NULL
);

CREATE TABLE IF NOT EXISTS BUYER_BANK_ADDRESS (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ADDRESS_INFO VARCHAR(255),
    B_ID INT NOT NULL,
    FOREIGN KEY (B_ID) REFERENCES BUYER(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS BUYER_LEGAL (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    LEGAL_NAME VARCHAR(255) NOT NULL,
    LEGAL_ADDRESS VARCHAR(255) NOT NULL,
    OGRN VARCHAR(255) NOT NULL,
    B_ID INT NOT NULL,
    FOREIGN KEY (B_ID) REFERENCES BUYER(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS BUYER_PHYSICAL (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME VARCHAR(255) NOT NULL,
    LAST_NAME VARCHAR(255) NOT NULL,
    FATHER_NAME VARCHAR(255),
    PASSPORT_SERIAL VARCHAR(255) NOT NULL,
    PASSPORT_NUMBER VARCHAR(255) NOT NULL,
    PASSPORT_ADDRESS VARCHAR(255) NOT NULL,
    CONSTRAINT UNIQUE (PASSPORT_SERIAL, PASSPORT_NUMBER),
    B_ID INT NOT NULL,
    FOREIGN KEY (B_ID) REFERENCES BUYER(ID) ON DELETE CASCADE

);

CREATE TABLE IF NOT EXISTS HOUSING (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ADDRESS_CITY VARCHAR(255),
    ADDRESS_STREET VARCHAR(255),
    ADDRESS_HOUSE VARCHAR(255),
    ADDRESS_ADDITIONAL VARCHAR(255),
    D_ID INT NOT NULL,
    FOREIGN KEY (D_ID) REFERENCES DEVELOPER(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS HOUSING_STATUS (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    H_ID INT NOT NULL,
    STATUS ENUM('PLANNING', 'BUILD', 'BUILD_STAY', 'BUILD_FINISH'),
    FOREIGN KEY (H_ID) REFERENCES HOUSING(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS CONTRACT (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    B_ID INT NOT NULL,
    FOREIGN KEY (B_ID) REFERENCES BUYER(ID) ON DELETE CASCADE,
    D_ID INT NOT NULL,
    FOREIGN KEY (D_ID) REFERENCES DEVELOPER(ID) ON DELETE CASCADE,
    H_ID INT NOT NULL,
    FOREIGN KEY (H_ID) REFERENCES HOUSING(ID) ON DELETE CASCADE,
    SUM INT NOT NULL,
    CONTRACT_PLAN_OPEN_DATE DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS CONTRACT_STATUS (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    STATUS ENUM('ACTIVE', 'FINISHED', 'CANCELED'),
    C_ID INT NOT NULL,
    FOREIGN KEY (C_ID) REFERENCES CONTRACT(ID) ON DELETE CASCADE
);

ALTER TABLE CONTRACT_STATUS ADD COLUMN CREATED_AT DATE;

CREATE TABLE IF NOT EXISTS ESCROW (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    C_ID INT NOT NULL,
    FOREIGN KEY (C_ID) REFERENCES CONTRACT(ID) ON DELETE CASCADE,
    ESCROW_AMOUNT INT NOT NULL,
    FROM_BANK_ADDRESS INT NOT NULL,
    TARGET_BANK_ADDRESS INT NOT NULL,

    FOREIGN KEY (FROM_BANK_ADDRESS) REFERENCES BUYER_BANK_ADDRESS(ID) ON DELETE CASCADE,
    FOREIGN KEY (TARGET_BANK_ADDRESS) REFERENCES BUYER_BANK_ADDRESS(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ESCROW_RETURNING (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    E_ID INT NOT NULL,
    CREATED_AT DATE NOT NULL,
    FOREIGN KEY (E_ID) REFERENCES ESCROW(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ESCROW_TRANSFER (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    E_ID INT NOT NULL,
    CREATED_AT DATE NOT NULL,
    FOREIGN KEY (E_ID) REFERENCES ESCROW(ID) ON DELETE CASCADE
);

