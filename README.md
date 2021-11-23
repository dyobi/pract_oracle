<a href="#">
  <img src="https://media.vlpt.us/images/dongchyeon/post/c9fd008a-5dba-4786-b9ad-9b502727feb4/oracle.png" width="300" height="150" title="header" alt="header">
</a>

# ORACLE SQL PRACTICE

> SQL is a standard language for storing, manipulating and retrieving data in databases

> With Oracle HR sample

<br />

## CREATE TABLE
```shell
SQL> DROP TABLE emergency_contact;
SQL> CREATE TABLE emergency_contact AS (SELECT department_id, first_name, phone_number FROM employees);
```
```shell
SQL> DROP TABLE sawon;
SQL> CREATE TABLE sawon (
      emp_id number(5) NOT NULL,
      emp_name varchar2(20),
      emp_hiredate date default sysdate,
      emp_address varchar2(20),
      CONSTRAINT sawon_pk PRIMARY KEY(emp_id)
     );
```

<br />

## INSERT
```shell
SQL> INSERT INTO sawon(emp_id, emp_name, emp_address) VALUES (1, 'kim', 'seoul');
SQL> INSERT INTO sawon(emp_id, emp_name, emp_address) VALUES (2, 'park', 'ohio');
SQL> INSERT INTO sawon(emp_id, emp_name, emp_address) VALUES (3, 'kim', 'california');
```

<br />

## SELECT
```shell
SQL> SELECT * FROM sawon WHERE emp_address LIKE 's%';
```
<br />

## UPDATE
```shell
SQL> UPDATE sawon SET emp_hiredate = sysdate WHERE emp_id = 1;
```

<br />

## DELETE
```shell
SQL> DELETE FROM sawon WHERE emp_id = 1;
```

<br />

## DROP
> Drop a table
```shell
SQL> DROP TABLE sawon;
```
> Drop a table permanently
```shell
SQL> DROP TABLE sawon PURGE;
```
> Restore a dropped table;
```shell
SQL> FLASHBACK TABLE sawon TO BEFORE DROP;
```
