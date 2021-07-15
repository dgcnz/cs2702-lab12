CREATE TABLE employees2 (
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
PARTITION BY RANGE (date_part('year', hire_date));

CREATE TABLE hirelow PARTITION OF employees2
FOR VALUES FROM (MINVALUE) TO (1995);

CREATE TABLE hiremid PARTITION OF employees2
FOR VALUES FROM (1995) TO (1998);

CREATE TABLE hirehigh PARTITION OF employees2
FOR VALUES FROM (1998) TO (MAXVALUE);

CREATE INDEX hirelow_ix ON hirelow (hire_date);

CREATE INDEX hiremid_ix ON hiremid (hire_date);

CREATE INDEX hirehigh_ix ON hirehigh (hire_date);

