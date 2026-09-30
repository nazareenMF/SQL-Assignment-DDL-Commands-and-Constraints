# SQL-Assignment-DDL-Commands-and-Constraints
# MySQL Assignment 1 – DDL Commands & Constraints

A complete implementation of **Data Definition Language (DDL)** commands and **Data Integrity Constraints** using **MySQL**. This repository covers database creation, table structure definition, schema alteration, table renaming, data cleanup, and proper constraint enforcement based on relational ER models.

---

## 📌 Database Schema Overview

The database `employee` consists of three interconnected entities:

*   **`departments`**: Stores department information.
*   **`location`**: Stores location details.
*   **`employees`**: Stores employee records linked to departments and locations via Foreign Keys.

### Entity-Relationship Diagram (ERD) Structure

```
+--------------------+            +-------------------+
|    departments     |            |     location      |
+--------------------+            +-------------------+
| department_id (PK) |<----\      | location_id  (PK) |<----\
| department_name    |     |      | location          |     |
+--------------------+     |      +-------------------+     |
                           |                                |
                           |      +-------------------+     |
                           \------|  department_id(FK)|     |
                                  |  location_id  (FK)|-----/
                                  |    employees      |
                                  +-------------------+
                                  | employee_id  (PK) |
                                  | employee_name     |
                                  | gender            |
                                  | age               |
                                  | hire_date         |
                                  | designation       |
                                  | salary            |
                                  +-------------------+
```

---

## 🛠️ Assignment Parts & SQL Scripts

### 1. Table Creation (`CREATE`)
Creates the initial `employee` database and schema relationships.

```sql
CREATE DATABASE employee;
USE employee;

-- Parent Table: Departments
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Parent Table: Location
CREATE TABLE location (
    location_id INT PRIMARY KEY,
    location VARCHAR(30)
);

-- Child Table: Employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    gender ENUM('M', 'F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);
```

---

### 2. Table Alteration (`ALTER`)
Modifies existing structures in the `employees` table.

```sql
-- Add email column
ALTER TABLE employees 
ADD email VARCHAR(100);

-- Modify designation column capacity
ALTER TABLE employees 
MODIFY designation VARCHAR(255);

-- Drop age column
ALTER TABLE employees 
DROP COLUMN age;

-- Rename hire_date column to date_of_joining
ALTER TABLE employees 
RENAME COLUMN  hire_date TO date_of_joining;
```

---

### 3. Table Renaming (`RENAME`)

```sql
RENAME TABLE departments TO departments_info;
RENAME TABLE location TO locations;
```

---

### 4. Table Truncation (`TRUNCATE`)
Clears all record entries in `employees` while maintaining structure.

```sql
TRUNCATE TABLE employees;
```

---

### 5. Database & Table Dropping (`DROP`)

```sql
DROP TABLE employees;
DROP DATABASE employee;
```

---

### 6. Full Schema with Complete Constraints Implementation

Rebuilds the entire database applying primary keys, auto-increments, check constraints, default values, unique values, and foreign keys.

```sql
DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;

-- Departments with UNIQUE and NOT NULL constraints
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- Location with AUTO_INCREMENT, UNIQUE, and NOT NULL constraints
CREATE TABLE location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(30) NOT NULL UNIQUE
);

-- Employees with CHECK, DEFAULT, ENUM, and FOREIGN KEY constraints
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
```

---

## 🚀 How to Run

1. Open **MySQL Workbench** 
2. Connect to your local MySQL server instance.
3. Execute statements sequentially or run the full schema recreation script.

---

## 🔑 Key SQL Concepts Covered

- **DDL Commands**: `CREATE`, `ALTER`, `RENAME`, `TRUNCATE`, `DROP`
- **Data Types**: `INT`, `VARCHAR`, `DECIMAL`, `DATE`, `ENUM`
- **Constraints**: 
  - Primary Key (`PRIMARY KEY`)
  - Foreign Key (`FOREIGN KEY`)
  - Unique Constraint (`UNIQUE`)
  - Not Null (`NOT NULL`)
  - Check Constraint (`CHECK`)
  - Default Constraint (`DEFAULT`)
  - Auto Increment (`AUTO_INCREMENT`)
