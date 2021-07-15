# Lab 12

## P1. PARTITION BY LIST

Script: `p1.sql`

Default:

| Employees           | 50    | 80    | 100   |
|---------------------|-------|-------|-------|
| Planning time (ms)  | 0.111 | 0.583 | 0.163 |
| Execution time (ms) | 0.139 | 0.185 | 0.212 |


With list partition:

| Employees1          | 50    | 80    | 100   |
|---------------------|-------|-------|-------|
| Planning time (ms)  | 0.284 | 0.773 | 0.732 |
| Execution time (ms) | 0.111 | 0.121 | 0.110 |

## P2. PARTITION BY RANGE

Script: `p2.sql`

Query 1:

```sql
SELECT * FROM employees2 WHERE hire_date >= '1995-05-03'::date;
```

Query 2:


```sql
SELECT * FROM employees2 WHERE hire_date >= '1997-05-03'::date;
```

Query 3:

```sql
SELECT * FROM employees2 WHERE hire_date >= '2000-05-03'::date;
```

| Employees           | Q1    | Q2    | Q3    |
|---------------------|-------|-------|-------|
| Planning time (ms)  | 0.186 | 0.175 | 0.161 |
| Execution time (ms) | 0.194 | 0.174 | 0.169 |

| Employees2          | Q1    | Q2    | Q3    |
|---------------------|-------|-------|-------|
| Planning time (ms)  | 0.755 | 0.797 | 0.500 |
| Execution time (ms) | 0.295 | 0.274 | 0.132 |


## P3. Two Attributes

Script doesn't work quite well.

Script: `p3.sql`
