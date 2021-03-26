-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/1XMmu5
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- EmployeesSQL ERD

CREATE TABLE `Department` (
    `Dept_no` int  NOT NULL ,
    `Dept_name` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `Dept_no`
    )
);

CREATE TABLE `Department_Manager` (
    `Dept_no` int  NOT NULL ,
    `Emp_no` int  NOT NULL 
);

CREATE TABLE `Department_Emp` (
    `Emp_no` int  NOT NULL ,
    `Dept_no` int  NOT NULL 
);

CREATE TABLE `Employees` (
    `Emp_no` int  NOT NULL ,
    `emp_title_id` int  NOT NULL ,
    `birth_date` date  NOT NULL ,
    `first_name` varchar(20)  NOT NULL ,
    `last_name` varchar(20)  NOT NULL ,
    `sex` varchar(1)  NOT NULL ,
    `hire_date` date  NOT NULL ,
    PRIMARY KEY (
        `Emp_no`
    )
);

CREATE TABLE `Titles` (
    `title_id` int  NOT NULL ,
    `title` varchar(30)  NOT NULL 
);

CREATE TABLE `Salary` (
    `Emp_no` int  NOT NULL ,
    `salary` decimal  NOT NULL 
);

ALTER TABLE `Department_Manager` ADD CONSTRAINT `fk_Department_Manager_Dept_no` FOREIGN KEY(`Dept_no`)
REFERENCES `Department` (`Dept_no`);

ALTER TABLE `Department_Manager` ADD CONSTRAINT `fk_Department_Manager_Emp_no` FOREIGN KEY(`Emp_no`)
REFERENCES `Employees` (`Emp_no`);

ALTER TABLE `Department_Emp` ADD CONSTRAINT `fk_Department_Emp_Emp_no` FOREIGN KEY(`Emp_no`)
REFERENCES `Employees` (`Emp_no`);

ALTER TABLE `Department_Emp` ADD CONSTRAINT `fk_Department_Emp_Dept_no` FOREIGN KEY(`Dept_no`)
REFERENCES `Department` (`Dept_no`);

ALTER TABLE `Titles` ADD CONSTRAINT `fk_Titles_title_id` FOREIGN KEY(`title_id`)
REFERENCES `Employees` (`emp_title_id`);

ALTER TABLE `Salary` ADD CONSTRAINT `fk_Salary_Emp_no` FOREIGN KEY(`Emp_no`)
REFERENCES `Employees` (`Emp_no`);

