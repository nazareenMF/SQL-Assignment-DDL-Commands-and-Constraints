-- DDL Commands
-- Database Creation

create database employee;
use employee;

-- 1.Create departments table 

CREATE TABLE departments(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- 2. Create location table

CREATE TABLE location (
    location_id INT PRIMARY KEY,
    location VARCHAR(30)
);

-- 3. Create Employees Table

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    gender ENUM('M', 'F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);

-- TABLE ALTERATION
-- ADD 'EMAIL' COLUMN

ALTER TABLE employees 
ADD email varchar(100); 

-- Modify the data type of the "designation" column in the Employees table to support a wider range of values

ALTER TABLE employees 
MODIFY designation VARCHAR(255);

-- Drop the “age” column from the Employees table

ALTER TABLE employees 
DROP COLUMN age;

-- Rename the “hire_date” column to “date_of_joining”

ALTER TABLE employees
RENAME COLUMN hire_date TO date_of_joining;

-- Table renaming
-- Rename the "Departments" table to "Departments_Info"

RENAME TABLE departments to Departments_Info;
-- Rename the "Location" table to "Locations".
RENAME TABLE LOCATION to LOCATIONS;
-- Table Truncation
-- Truncate the Employees table
TRUNCATE TABLE Employees;

-- Database & Table Dropping
-- Drop the Employees table
DROP TABLE employees;
-- Drop “employee” database
DROP DATABASE employee;

-- CONSTRAINTS AND DATABASE RECREATION

DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;
-- Create Departments Table with constraints

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
-- Create Location Table with constraints 

CREATE TABLE location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(30) NOT NULL UNIQUE
);

-- Create Employees Table with constraints

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F'),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10, 2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);

