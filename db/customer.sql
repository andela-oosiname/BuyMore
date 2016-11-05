CREATE SCHEMA IF NOT EXISTS buymore_test;
USE buymore_test;

DROP TABLE IF EXISTS `customers`;

create table customers (
  id INT NOT NULL AUTO_INCREMENT COMMENT 'Customer ID',
  firstname TEXT NOT NULL COMMENT 'The Customer first name',
  lastname TEXT NOT NULL COMMENT 'The Customer last name',
  email TEXT  NOT NULL COMMENT 'The Customer email address',
  password TEXT  NOT NULL COMMENT 'The customer password. The Password must contain minimum 7 characters',
  PRIMARY KEY (`ID`)
);
SET AUTOCOMMIT=1;
