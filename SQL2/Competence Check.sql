drop table regions CASCADE CONSTRAINTS;
drop table countries CASCADE CONSTRAINTS;
drop table locations CASCADE CONSTRAINTS;
drop table departments CASCADE CONSTRAINTS;
drop table jobs CASCADE CONSTRAINTS;
drop table employees CASCADE CONSTRAINTS;
drop table job_history CASCADE CONSTRAINTS;

create table regions
(
    region_id   Number(11)
        constraint regions_primary_key primary key,
    region_name varchar2(25)
);

create table countries
(
    country_id   char(2)
        constraint countries_primary_key primary key,
    country_name varchar2(40),
    region_id    number(11) constraint countries_regions_foreign_key references  regions(region_id)
);

create table locations
(
    location_id number(4) constraint location_primary_key primary key,
    street_address varchar2(40),
    postal_code varchar2(12),
    city varchar2(30),
    state_provice varchar2(25),
    country_id char(2) constraint locations_countries_foreign_key references countries(country_id)
);

create table departments(
    department_id number(4) constraint  department_primary_key primary key,
    department_name varchar2(30),
    manager_id number(6),
    location_id number(4) constraint  departments_locations_foreign_key references locations(location_id)
);

create table jobs(
    job_id varchar2(20) constraint jobs_primary_key primary key ,
    job_title varchar2(35),
    min_salary number(6),
    max_salary number(6)
);

create table employees(
    employee_id number(6) constraint employee_primary_key primary key,
    first_name varchar2(20),
    last_name varchar2(20),
    email varchar2(25),
    phone_number varchar2(20),
    hire_date date,
    job_id varchar2(10) constraint employees_job_foreign_key references jobs(job_id),
    salary decimal(8,2),
    commission_pct decimal(2,2),
    manager_id number(6) constraint employees_manager_foreign_key references employees(employee_id),
    department_id number(4) constraint employees_department_foreign_key references departments(department_id)
    );

create table job_history(
    employee_id number(6)  constraint job_history_employee references employees(employee_id),
    start_date date constraint job_history_primary_key primary key,
    end_date date,
    job_id varchar2(10) constraint  job_history_job_foreign_key references jobs(job_id),
    departemnt_id number(4) constraint job_history_department_foreign_key references departments(department_id)
);

-- Regions
INSERT INTO regions VALUES (1, 'Europe');
INSERT INTO regions VALUES (2, 'Americas');

-- Countries
INSERT INTO countries VALUES (10, 'Germany', 1);
INSERT INTO countries VALUES (20, 'USA', 2);

-- Locations (Note: location_id is VARCHAR2(4), country_id is CHAR(2))
INSERT INTO locations VALUES ('1001', 'Main Street 5', '10115', 'Berlin', 'Berlin', '10');
INSERT INTO locations VALUES ('1002', '5th Avenue', '10001', 'New York', 'NY', '20');

-- Departments
INSERT INTO departments VALUES (100, 'Sales', NULL, 1001);
INSERT INTO departments VALUES (200, 'HR', NULL, 1002);

-- Jobs
INSERT INTO jobs VALUES ('SA_REP', 'Sales Representative', 3000, 8000);
INSERT INTO jobs VALUES ('HR_MAN', 'HR Manager', 4000, 9000);

-- Employees
INSERT INTO employees VALUES (1, 'Alice', 'Smith', 'asmith@example.com', '123-4567', DATE '2020-01-15', 'SA_REP', 5000.00, NULL, NULL, 100);
INSERT INTO employees VALUES (2, 'Bob', 'Johnson', 'bjohnson@example.com', '234-5678', DATE '2021-03-01', 'HR_MAN', 6000.00, NULL, 1, 200);

-- Job History
INSERT INTO job_history VALUES (1, DATE '2019-01-01', DATE '2020-01-14', 'HR_MAN', 200);


