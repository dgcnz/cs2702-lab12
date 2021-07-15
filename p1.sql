CREATE TABLE employees1 (
    employee_id integer,
    first_name varchar(20),
    last_name varchar(25) NOT NULL,
    email varchar(25) NOT NULL,
    phone_number varchar(20),
    hire_date timestamp NOT NULL,
    job_id varchar(10) NOT NULL,
    salary numeric(8, 2),
    commission_pct numeric(2, 2),
    manager_id integer,
    department_id integer,
    CONSTRAINT emp_salary_min CHECK (salary > 0)
)
PARTITION BY LIST (department_id);

CREATE TABLE dep50 PARTITION OF employees1
FOR VALUES IN (50);

CREATE TABLE dep80 PARTITION OF employees1
FOR VALUES IN (80);

CREATE TABLE dep100 PARTITION OF employees1
FOR VALUES IN (100);

