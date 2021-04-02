-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/1XMmu5
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- EmployeesSQL ERD

CREATE TABLE Titles (
    title_id varchar  NOT NULL ,
    title varchar(30)  NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE Employees (
    emp_no varchar  NOT NULL ,
    emp_title_id varchar  NOT NULL ,
    birth_date date  NOT NULL ,
    first_name varchar(20)  NOT NULL ,
    last_name varchar(20)  NOT NULL ,
    sex varchar(1)  NOT NULL ,
    hire_date date  NOT NULL ,
	FOREIGN KEY (emp_title_id) REFERENCES Titles (title_id),
	PRIMARY KEY (emp_no)
);


CREATE TABLE Department (
    dept_no varchar  NOT NULL ,
    dept_name varchar(50)  NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE Department_Manager (
    dept_no varchar  NOT NULL,
    emp_no varchar  NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Department (dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE Department_Emp (
    emp_no varchar  NOT NULL ,
    dept_no varchar  NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES Department (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);


CREATE TABLE Salary (
    emp_no varchar  NOT NULL ,
    salary decimal  NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
	PRIMARY KEY (emp_no)
);