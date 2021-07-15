CREATE TABLE employees3 (
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
PARTITION BY RANGE (date_part('year', hire_date), salary);

CREATE TABLE datelow_salarylow PARTITION OF employees3
FOR VALUES FROM (MINVALUE,
MINVALUE) TO (1995, 30000);

CREATE TABLE datelow_salarymid PARTITION OF employees3
FOR VALUES FROM (MINVALUE, 30000) TO (1995, 70000);

CREATE TABLE datelow_salaryhigh PARTITION OF employees3
FOR VALUES FROM (MINVALUE, 70000) TO (1995,
MAXVALUE);

CREATE TABLE datemid_salarylow PARTITION OF employees3
FOR VALUES FROM (1995,
MINVALUE) TO (1998, 30000);

CREATE TABLE datemid_salarymid PARTITION OF employees3
FOR VALUES FROM (1995, 30000) TO (1998, 70000);

CREATE TABLE datemid_salaryhigh PARTITION OF employees3
FOR VALUES FROM (1995, 70000) TO (1998,
MAXVALUE);

CREATE TABLE datehigh_salarylow PARTITION OF employees3
FOR VALUES FROM (1998,
MINVALUE) TO (MAXVALUE, 30000);

CREATE TABLE datehigh_salarymid PARTITION OF employees3
FOR VALUES FROM (1998, 30000) TO (MAXVALUE, 70000);

CREATE TABLE datehigh_salaryhigh PARTITION OF employees3
FOR VALUES FROM (1998, 70000) TO (MAXVALUE,
MAXVALUE);

