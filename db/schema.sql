
CREATE TABLE IF NOT EXISTS accounts (
  uid CHAR(32) PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE KEY,
  verificationCode CHAR(8) NOT NULL,
  verified BOOLEAN NOT NULL DEFAULT FALSE,
  keyA CHAR(64) NOT NULL,
  wrapKeyB CHAR(64) NOT NULL,
  srpData VARCHAR(255) NOT NULL,
  pwdStretchData VARCHAR(255) NOT NULL
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS srpTokens (
  tokenid CHAR(64) PRIMARY KEY,
  tokendata CHAR(64) NOT NULL,
  uid CHAR(32) NOT NULL
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS authTokens (
  tokenid CHAR(64) PRIMARY KEY,
  tokendata CHAR(64) NOT NULL,
  uid CHAR(32) NOT NULL
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS sessionTokens (
  tokenid CHAR(64) PRIMARY KEY,
  tokendata CHAR(64) NOT NULL,
  uid CHAR(32) NOT NULL
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS keyfetchTokens (
  tokenid CHAR(64) PRIMARY KEY,
  tokendata CHAR(64) NOT NULL,
  uid CHAR(32) NOT NULL
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS resetTokens (
  tokenid CHAR(64) PRIMARY KEY,
  tokendata CHAR(64) NOT NULL,
  uid CHAR(32) NOT NULL UNIQUE KEY
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS forgotpwdTokens (
  tokenid CHAR(64) PRIMARY KEY,
  tokendata CHAR(64) NOT NULL,
  uid CHAR(32) NOT NULL UNIQUE KEY,
  resetCode VARCHAR(16) NOT NULL,
  numTries SMALLINT UNSIGNED NOT NULL,
  ttl SMALLINT UNSIGNED NOT NULL
) ENGINE=InnoDB;
