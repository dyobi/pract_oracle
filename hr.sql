SELECT * FROM employees;

SELECT * FROM departments;

SELECT first_name || ' ' || last_name AS "사원의 이름", hire_date AS "입사일", department_id AS "부서번호" FROM employees WHERE employee_id = 105;

SELECT employee_id, department_id FROM employees WHERE employee_id >= 120 OR department_id = 90;

SELECT employee_id AS "사원 아이디", first_name AS "이름", department_id AS "부서번호" FROM employees WHERE (employee_id >= 120 OR department_id = 90) AND salary <= 11000;

SET TIMING ON
SELECT DISTINCT department_id FROM employees ORDER BY department_id ASC;

SET TIMING ON
SELECT first_name || ' ' || last_name AS "성명", department_id AS "부서 아이디", salary AS "급여" FROM employees WHERE department_id = 90 OR department_id = 80 OR department_id = 50 ORDER BY department_id ASC;

SET TIMING ON
SELECT first_name, department_id, salary FROM employees WHERE department_id IN (50, 80, 90);

SELECT first_name || ' ' || last_name AS "성명", salary AS "급여" FROM employees WHERE salary BETWEEN 5000 AND 10000 ORDER BY salary ASC;

SELECT first_name FROM employees WHERE first_name LIKE 'A%';

SELECT first_name FROM employees WHERE first_name LIKE '%n%';

SELECT first_name, hire_date FROM employees WHERE hire_date LIKE '17%';

SELECT first_name AS "name", hire_date AS "date" FROM employees WHERE hire_date BETWEEN '01-JAN-03' AND '31-DEC-03';
SELECT first_name AS "name", hire_date AS "date" FROM employees WHERE hire_date LIKE '%03';
SELECT first_name AS "name", hire_date AS "date" FROM employees WHERE hire_date LIKE '__-___-03';
SELECT first_name AS "name", hire_date AS "date" FROM employees WHERE hire_date LIKE '__-APR-__';

SELECT sysdate FROM dual;

DESC dual;

SELECT '나는 우리반  비담이라는' FROM dual;

SELECT DISTINCT first_name AS "이름", NVL(commission_pct, 0) AS "커미션" FROM employees ORDER BY NVL(commission_pct, 0) ASC;

SELECT DISTINCT first_name AS "이름", NVL(TO_CHAR(commission_pct), '없어') AS "커미션" FROM employees;

SELECT DISTINCT first_name AS "이름", commission_pct AS "커미션" FROM employees WHERE commission_pct IS NULL;

SELECT DISTINCT first_name AS "이름", commission_pct AS "커미션" FROM employees WHERE commission_pct IS NOT NULL ORDER BY commission_pct ASC;

SELECT employee_id AS "아이디", first_name AS "이름" FROM employees WHERE employee_id != 105 ORDER BY employee_id ASC;
SELECT employee_id AS "아이디", first_name AS "이름" FROM employees WHERE employee_id <> 105 ORDER BY employee_id ASC;


SELECT first_name AS "이름", salary AS "급여", department_id AS "부서 아이디" FROM employees WHERE department_id IN(50, 80) ORDER BY department_id ASC;
SELECT first_name AS "이름", salary AS "급여", department_id AS "부서 아이디", hire_date AS "입사일" FROM employees WHERE hire_date >= '01-JAN-03' AND salary BETWEEN 1300 AND 20000 ORDER BY hire_date ASC;
SELECT first_name AS "이름", salary AS "급여", hire_date AS "입사일" FROM employees WHERE first_name LIKE '%m' ORDER BY hire_date ASC;
SELECT first_name AS "이름", salary AS "급여", hire_date AS "입사일" FROM employees WHERE first_name LIKE '___m%' ORDER BY hire_date ASC;
SELECT first_name AS "이름", salary AS "급여", hire_date AS "입사일" FROM employees WHERE LOWER(first_name) = 'nancy';
SELECT first_name AS "이름", salary AS "급여", hire_date AS "입사일" FROM employees WHERE LENGTH(first_name) <= 5;

SELECT first_name AS "이름", salary AS "급여" FROM employees ORDER BY salary ASC;

SELECT first_name AS "이름", employee_id AS "사번아이디", salary AS "급여" FROM employees ORDER BY salary DESC, employee_id ASC;
SELECT first_name AS "이름", employee_id AS "사번아이디", salary AS "급여" FROM employees ORDER BY "급여" DESC, "사번아이디" ASC;
SELECT first_name AS "이름", employee_id AS "사번아이디", salary AS "급여" FROM employees ORDER BY 3 DESC, 2 ASC;
SELECT first_name AS "이름", employee_id AS "사번아이디", salary*12 AS "급여" FROM employees ORDER BY salary*12 DESC, 2 ASC;

SELECT last_name AS "성", first_name AS "이름", employee_id AS "사번아이디", salary AS "급여" FROM employees WHERE UPPER(last_name) = 'KING';

SELECT first_name AS "이름", last_name AS "성", salary AS "급여", hire_date FROM employees WHERE SUBSTR(hire_date, 8, 2) = '05';

SELECT lpad('ondal', 10, '*') FROM dual;
SELECT rpad('ondal', 10, '*') FROM dual;

SELECT REPLACE('2021-06-07', '-', '/') FROM dual;
SELECT TRANSLATE('2021-06-07', '-', '/') FROM dual;

SELECT REPLACE('2021-06-07', '-0', 'pp') FROM dual;
SELECT TRANSLATE('2021-06-07', '-0', 'ab') FROM dual;

SELECT email FROM employees;

SELECT email FROM employees WHERE TRANSLATE(email, '0123456789', '__________') <> email;


-- 반올림 소수 이하 두째 자리에서 반올림 ex) 36.754 -> 36.8
SELECT ROUND(36.754, 1) FROM dual;
SELECT ROUND(36.754, -1) FROM dual;
SELECT ROUND(7534.22, -2) FROM dual;
-- 절삭 ex) 36.754 -> 36.7
SELECT TRUNC(36.754, 1) FROM dual;

-- 만난지 100일
SELECT sysdate AS "현재 날짜", sysdate + 100 - 1 AS "만난지 100일" FROM dual;
-- 근속상 (날짜 반올림)
SELECT ROUND(sysdate, 'mon') FROM dual;
SELECT ROUND(TO_DATE('16NOV21'), 'mon') FROM dual;
SELECT ROUND(TO_DATE('12 APR 2021', 'dd mm yyyy'), 'mon') FROM dual;
SELECT ROUND(sysdate, 'year') FROM dual;
-- 정확한 날짜 계산 함수
SELECT ADD_MONTHS(sysdate, 6) FROM dual; -- 월을 더함
SELECT MONTHS_BETWEEN(sysdate, TO_DATE('12APR19')) FROM dual; -- 둘사이 개월수 (recent, old)

SELECT first_name AS "이름", TRUNC(MONTHS_BETWEEN(sysdate, hire_date)) AS "근무개월수" FROM employees; -- 지금까지 근무월수
SELECT first_name AS "이름", TRUNC(MONTHS_BETWEEN(sysdate, hire_date)/12, 1) AS "근무년수" FROM employees; -- 지금까지 근무년수

SELECT first_name AS "이름", hire_date AS "입사일", salary AS "급여", TRUNC(MONTHS_BETWEEN(sysdate, hire_date)/12) || '년' AS "근무연차" FROM employees WHERE TRUNC(MONTHS_BETWEEN(sysdate, hire_date)/12) >= 15;

SELECT TO_CHAR(sysdate, 'yyyy/mm/dd') AS "날짜" FROM dual; -- 출력은 문자형태로 가능하지만 db에는 RR/mm/dd로 저장되어있음
SELECT first_name AS "이름", hire_date AS "입사일" FROM employees WHERE TO_CHAR(hire_date, 'yy') = '05';


SELECT SUM(salary) AS "총액" FROM employees;
SELECT AVG(salary) AS "급여평균" FROM employees;
SELECT COUNT(*) AS "총 사원수" FROM employees;
SELECT AVG(commission_pct) FROM employees; -- commission percent의 null은 제외하고 계산됨
SELECT SUM(commission_pct) FROM employees;
SELECT SUM(salary) AS "급여합", MIN(salary) AS "최소급여", MAX(salary) AS "최대급여", ROUND(AVG(salary)) AS "급여평균", COUNT(*) AS "직원수", COUNT(manager_id) AS "매니저있는 직원", COUNT(DISTINCT department_id) AS "직원부서 수" FROM employees;

SELECT COUNT(manager_id) AS "매니저있는 직원", COUNT(DISTINCT department_id) AS "직원부서 수" FROM employees;

SELECT department_id AS "부서아이디", AVG(salary) FROM employees GROUP BY department_id ORDER BY department_id ASC;

SELECT department_id AS "부서아이디", manager_id AS "매니저아이디", ROUND(AVG(salary)) AS "평균급여" FROM employees GROUP BY department_id, manager_id ORDER BY department_id, manager_id ASC;

SELECT department_id AS "부서아이디", manager_id AS "매니저아이디", ROUND(AVG(salary)) AS "평균급여" FROM employees GROUP BY department_id, manager_id ORDER BY department_id, manager_id ASC;

SELECT department_id AS "부서아이디", MIN(salary) AS "최소급여" FROM employees WHERE salary*12 <= 50000000 GROUP BY department_id ORDER BY department_id ASC;

SELECT department_id AS "부서아이디", MIN(salary) AS "최소급여" FROM employees WHERE SUBSTR(job_id, 1, 2) <> 'IT' GROUP BY department_id ORDER BY department_id ASC;
SELECT department_id AS "부서아이디", MIN(salary) AS "최소급여" FROM employees WHERE job_id NOT LIKE 'IT%' GROUP BY department_id ORDER BY department_id ASC;

SELECT department_id AS "부서아이디", MIN(salary) AS "최소급여" FROM employees WHERE department_id >= 30 GROUP BY department_id ORDER BY department_id ASC;
-- 조건에서 일반조건, 그룹조건
SELECT department_id AS "부서아이디", MIN(salary) AS "최소급여", AVG(salary) AS "평균급여" FROM employees WHERE department_id >= 30 GROUP BY department_id HAVING AVG(salary) <= 10000 ORDER BY department_id ASC;

SELECT COUNT(*) AS "직원수", ROUND(AVG(salary)) AS "평균급여" FROM employees GROUP BY department_id HAVING COUNT(*) >= 20 ORDER BY department_id;

-- db가 되려면 공유 데이터 / 통합 데이터 / 저장 데이터 / 운영 데이터

SELECT COUNT(*) AS "직원수" FROM employees GROUP BY department_id HAVING COUNT(*) >= 3 ORDER BY department_id ASC;
SELECT department_id AS "부서아이디", AVG(salary) AS "평균급여" FROM employees WHERE department_id IN (30, 90) AND salary BETWEEN 5000 AND 20000 GROUP BY department_id HAVING AVG(salary) >= 3500 ORDER BY department_id ASC;
SELECT MAX(salary) AS "최대급여", MIN(salary) AS "최소급여", ROUND(AVG(salary)) AS "평균급여", SUM(salary) AS "급여합계", COUNT(*) AS "인원수" FROM employees GROUP BY department_id ORDER BY department_id ASC;
SELECT ROUND(AVG(salary)) AS "평균급여", MAX(salary) AS "최대급여" FROM employees GROUP BY department_id HAVING SUM(salary) >= 20000 ORDER BY department_id ASC;
SELECT SUBSTR(hire_date, 8, 2) AS "입사년도", COUNT(*) AS "직원수" FROM employees GROUP BY SUBSTR(hire_date, 8, 2) HAVING COUNT(*) >=8 ORDER BY 1 ASC;

-- cartesian product error -> n:m방식
SELECT employees.first_name, employees.salary, departments.department_name FROM employees, departments;

-- To use JOIN in order to figure cartesian product out
-- FK 는 PK를 갖다가 씀(참조한다 references)

-- equi join (pk 와 fk가 동등) -> null 제외
SELECT e.first_name, e.salary, d.department_name FROM employees e, departments d WHERE e.department_id = d.department_id;

SELECT l.city AS "도시명", d.department_name AS "부서명", COUNT(*) AS "인원수" FROM employees e, departments d, locations l WHERE e.department_id = d.department_id AND d.location_id = l.location_id AND SUBSTR(e.hire_date, 8, 2) < '07' GROUP BY l.city, d.department_name ORDER BY 1, 3 DESC;

-- outer join (기본 equi join으로 출발)
SELECT e.first_name AS "이름", e.salary AS "급여", d.department_name AS "부서명" FROM employees e, departments d WHERE e.department_id = d.department_id(+);
SELECT e.first_name AS "이름", e.salary AS "급여", d.department_name AS "부서명" FROM employees e, departments d WHERE e.department_id(+) = d.department_id;

-- 두개의 테이블을 outer join 할수 없으므로 ansi1999로 작성해야함 (양쪽다 + 불가해서) 
SELECT e.first_name AS "이름", e.salary AS "급여", d.department_name AS "부서명" FROM employees e LEFT OUTER JOIN departments d ON (e.department_id = d.department_id);
SELECT e.first_name AS "이름", e.salary AS "급여", d.department_name AS "부서명" FROM employees e RIGHT OUTER JOIN departments d ON (e.department_id = d.department_id);
SELECT e.first_name AS "이름", e.salary AS "급여", d.department_name AS "부서명" FROM employees e FULL OUTER JOIN departments d ON (e.department_id = d.department_id);

-- UNION 합집합 (ansi1999의 full outer join과 같음)
SELECT e.first_name AS "이름", e.salary AS "급여", d.department_name AS "부서명" FROM employees e, departments d WHERE e.department_id = d.department_id(+)
UNION
SELECT e.first_name AS "이름", e.salary AS "급여", d.department_name AS "부서명" FROM employees e, departments d WHERE e.department_id(+) = d.department_id;
--


-- ORACLE 방식
SELECT e.employee_id AS "사번", e.first_name AS "이름", e.last_name AS "성", e.hire_date AS "입사일", NVL(d.department_name, '그런부서없어') AS "부서명" FROM employees e, departments d WHERE e.department_id = d.department_id(+) AND SUBSTR(e.hire_date, 8, 2) LIKE '07' ORDER BY e.last_name ASC;

-- ANSI1999 방식
SELECT e.employee_id AS "사번", e.first_name AS "이름", e.last_name AS "성", e.hire_date AS "입사일", NVL(d.department_name, '그런부서없어') AS "부서명" FROM employees e LEFT OUTER JOIN departments d ON (e.department_id = d.department_id) WHERE SUBSTR(e.hire_date, 8, 2) LIKE '07' ORDER BY e.last_name ASC;

-- self join (같은 테이블에서 참조가 있을때)
SELECT e.employee_id AS "사번", e.first_name AS "이름", d.first_name AS "매니저이름" FROM employees e JOIN employees d ON (e.manager_id = d.employee_id(+)) ORDER BY e.employee_id ASC;
SELECT e.employee_id AS "사번", e.first_name AS "이름", d.first_name AS "매니저이름" FROM employees e FULL JOIN employees d ON (e.manager_id = d.employee_id) ORDER BY e.employee_id ASC;

SELECT e.employee_id AS "사번", e.first_name AS "이름", d.first_name AS "매니저이름" FROM employees e, employees d WHERE e.manager_id = d.employee_id
UNION 
SELECT e.employee_id AS "사번", e.first_name AS "이름", '매니저없어!!!' AS "매니저이름" FROM employees e WHERE e.manager_id IS NULL ORDER BY "사번" ASC;

SELECT e.employee_id AS "사번", e.first_name AS "이름", e.job_id AS "잡아이디" FROM employees e 
MINUS SELECT e.employee_id AS "사번", e.first_name AS "이름", e.job_id AS "잡아이디" FROM employees e WHERE LOWER(e.job_id) LIKE '%clerk%' ORDER BY "사번" ASC;

--
@sal.sql
--

DROP TABLE salgrade;
CREATE TABLE salgrade (
    grade number(5) NOT NULL,
    lsal number(8),
    hsal number(8),
    CONSTRAINT salgrade_grade_pk PRIMARY KEY(grade)
);
INSERT INTO salgrade(grade, lsal, hsal) VALUES (1, 500, 2999);
INSERT INTO salgrade(grade, lsal, hsal) VALUES (2, 3000, 3799);
INSERT INTO salgrade(grade, lsal, hsal) VALUES (3, 3800, 5199);
INSERT INTO salgrade(grade, lsal, hsal) VALUES (4, 5200, 9999);
INSERT INTO salgrade(grade, lsal, hsal) VALUES (5, 10000, 50000);
COMMIT;

SELECT * FROM salgrade;
SELECT * FROM TAB;

--

SELECT grade FROM salgrade WHERE lsal <= 5199 AND hsal >=5199;
SELECT grade FROM salgrade WHERE lsal <= 3500 AND hsal >= 3500;

-- non-equi join
SELECT e.first_name AS "이름", e.salary AS "급여", s.grade AS "등급" FROM employees e INNER JOIN salgrade s ON (e.salary BETWEEN lsal AND hsal) ORDER BY e.salary DESC, e.first_name ASC;

SELECT e.department_id AS "부서명", ROUND(AVG(salary)) AS "평균급여" FROM employees e GROUP BY e.department_id HAVING department_id = 100;
SELECT e.department_id AS "부서명", ROUND(AVG(salary)) AS "평균급여" FROM employees e GROUP BY e.department_id HAVING e.department_id = (SELECT department_id FROM employees WHERE LOWER(first_name) = 'nancy');

SELECT e.department_id AS "부서아이디", d.department_name AS "부서명" FROM employees e, departments d WHERE e.department_id = d.department_id AND e.salary = 8200;
SELECT department_id AS "부서아이디", department_name AS "부서명" FROM departments WHERE department_id IN (SELECT department_id FROM employees WHERE salary = 8200);



SELECT e.first_name AS "이름", e.salary AS "급여", e.hire_date AS "입사일" FROM employees e WHERE e.department_id IN (SELECT department_id FROM departments WHERE department_name = 'IT') ORDER BY 1 ASC;
SELECT e.first_name AS "이름", e.department_id AS "부서아이디" FROM employees e WHERE department_id IN (SELECT department_id FROM employees WHERE first_name = 'Alexander') ORDER BY 1 ASC;
SELECT e.first_name AS "이름", e.department_id AS "부서아이디", e.salary AS "급여" FROM employees e WHERE salary > (SELECT AVG(salary) FROM employees WHERE department_id = 90) ORDER BY 2 ASC;

SELECT e.first_name AS "이름", e.salary AS "급여", e.department_id AS "부서아이디", d.department_name AS "부서명" FROM employees e, departments d 
WHERE e.department_id = d.department_id 
AND e.salary > (SELECT AVG(e.salary) FROM employees e, departments d, locations l WHERE e.department_id = d.department_id AND d.location_id = l.location_id AND l.city = 'Seattle') 
AND e.salary < (SELECT MAX(salary) FROM employees WHERE department_id = 30);

SELECT e.first_name AS "이름", e.salary AS "급여", e.hire_date AS "입사일", e.department_id AS "부서아이디", d.department_name AS "부서명" FROM employees e JOIN departments d ON (e.department_id = d.department_id) WHERE d.department_name = 'IT' ORDER BY 1 ASC;

-- pair wise error (부서중복 제거)
SELECT first_name AS "이름", department_id AS "부서아이디", salary AS "급여" FROM employees 
WHERE (department_id, salary) IN (SELECT department_id, MIN(salary) FROM employees GROUP BY department_id) ORDER BY department_id ASC;

SELECT e.first_name AS "이름", d.department_name AS "부서명", e.salary AS "급여" FROM employees e JOIN departments d ON (e.department_id = d.department_id)
WHERE (e.department_id, e.salary) IN (SELECT department_id, MAX(salary) FROM employees GROUP BY department_id) ORDER BY e.first_name ASC;

-- select 절에 subquery 있는것을 scalar subquery라고 함
SELECT e.first_name AS "이름", e.department_id AS "부서id", NVL((SELECT MIN(salary) FROM employees GROUP BY department_id HAVING e.department_id = department_id), e.salary) AS "부서최소급여" FROM employees e ORDER BY e.department_id ASC;

-- from 절에 subquery 사용하는것 -> inline view
SELECT e.first_name AS "이름", e.salary AS "급여", e.averageSalary AS "평균급여" FROM (SELECT a.first_name, a.salary, a.department_id, AVG(salary) AS "averageSalary" FROM employees a WHERE a.department_id = e.department_id) e ORDER BY e.department_id, e.salary ASC;


SELECT e.first_name AS "이름", e.salary AS "급여", a.averageSalary AS "평균급여" FROM employees e JOIN (SELECT ROUND(AVG(salary)) AS averageSalary, department_id FROM employees GROUP BY department_id) a ON (e.department_id = a.department_id) WHERE e.salary > a.averageSalary ORDER BY e.department_id, e.salary ASC;

SELECT e.first_name AS "이름", e.salary AS "급여" FROM (SELECT first_name, salary FROM employees ORDER BY salary DESC, first_name ASC) e;

SELECT a.first_name AS "이름", e.salary AS "급여" FROM employees a JOIN (SELECT employee_id, salary FROM employees ORDER BY salary DESC, first_name ASC) e ON (e.employee_id = a.employee_id);

SELECT ROWNUM, a.first_name AS "이름", e.salary AS "급여" FROM employees a JOIN (SELECT employee_id, salary FROM employees ORDER BY salary DESC, first_name ASC) e ON (e.employee_id = a.employee_id);

SELECT a.first_name AS "이름", e.salary AS "급여" FROM employees a JOIN (SELECT employee_id, salary FROM employees ORDER BY salary DESC, first_name ASC) e ON (e.employee_id = a.employee_id) WHERE ROWNUM <= 7;

SELECT first_name AS "이름", commission_pct AS "커미션" FROM (SELECT * FROM employees WHERE commission_pct IS NOT NULL ORDER BY commission_pct DESC) WHERE ROWNUM <= 3;
SELECT first_name AS "이름", commission_pct AS "커미션" FROM (SELECT * FROM employees ORDER BY commission_pct DESC NULLS LAST) WHERE ROWNUM <= 3;

SELECT department_id AS "부서아이디", ROUND(AVG(salary)) AS "평균급여" FROM employees GROUP BY department_id HAVING AVG(salary) < (SELECT AVG(salary) FROM employees GROUP BY department_id HAVING department_id = 80) ORDER BY 1;

DROP TABLE employees_dpt80;
CREATE TABLE employees_dpt80 AS (SELECT employee_id, salary FROM employees WHERE department_id = 80);
SELECT * FROM employees_dpt80;

DROP TABLE emergency_contact;
CREATE TABLE emergency_contact AS (SELECT department_id, first_name, phone_number FROM employees);
SELECT * FROM emergency_contact;

-- 컬럼 > ALL : 최대값보다 크면
-- 컬럼 >= ALL : 최대값보다 크거다 같으면
-- 컬럼 < ALL : 최소값보다 작으면
-- 컬럼 <= ALL : 최소값보다 작거나 같으면
SELECT * FROM employees WHERE salary > (SELECT MAX(salary) FROM employees WHERE department_id = 80);
SELECT * FROM employees WHERE salary > ALL(SELECT salary FROM employees WHERE department_id = 80) ORDER BY salary DESC;

-- 컬럼 > ANY : 최소다값보다 크면
-- 컬럼 >= ANY : 최소다값보다 크거다 같으면
-- 컬럼 < ANY : 최대값보다 작으면
-- 컬럼 <= ANY : 최대값보다 작거나 같으면
-- 컬럼 = ANY : IN과 같은 효과
-- 컬럼 != ANY : NOT IN과 같은 효과
SELECT * FROM employees WHERE salary <= ANY(SELECT salary FROM employees WHERE department_id = 80) ORDER BY salary DESC;
SELECT * FROM employees WHERE salary >= ANY(SELECT salary FROM employees WHERE department_id = 80) ORDER BY salary DESC;

--


DROP TABLE sawon;
CREATE TABLE sawon (
    emp_id number(5) NOT NULL,
    emp_name varchar2(20),
    emp_hiredate date default sysdate,
    emp_address varchar2(20),
    CONSTRAINT sawon_pk PRIMARY KEY(emp_id)
);
INSERT INTO sawon(emp_id, emp_name, emp_address) VALUES (1, 'kim', 'seoul');
INSERT INTO sawon(emp_id, emp_name, emp_address) VALUES (2, 'park', 'suwon');
INSERT INTO sawon(emp_id, emp_name, emp_address) VALUES (3, 'jun', 'gyeonggi');
INSERT INTO sawon(emp_id, emp_name, emp_address) VALUES (4, 'kim', 'california');
INSERT INTO sawon(emp_id, emp_name, emp_address) VALUES (5, 'yoon', 'ohio');
COMMIT;

SELECT * FROM sawon;

INSERT INTO sawon (emp_id, emp_name, emp_address) VALUES (6, 'kang', '');

INSERT INTO sawon (emp_id, emp_name, emp_address) VALUES (7, 'jang', 'new york');

SAVEPOINT here;

INSERT INTO sawon (emp_id, emp_name, emp_address) VALUES (8, 'yeong', 'homeless');

ROLLBACK TO here;
COMMIT;


-- 3항연산자 -> decode(대상칼럼, 조건, yes, no)
SELECT e.first_name AS "이름", j.job_title AS "직책", DECODE(LOWER(j.job_title), '%manager%', e.salary * 1.1, e.salary * 1.5) AS "인상된급여" FROM employees e, jobs j WHERE e.job_id(+) = j.job_id;

-- substr(column, 1, 7) 첫번째부터 / substr(column, -7) 뒤서부터

SELECT e.first_name AS "이름", j.job_title AS "직책", e.job_id AS "잡아이디", e.salary AS "급여", DECODE(SUBSTR(e.job_id, 1, 2), 'AD', e.salary*1.1, 'FI', e.salary*1.15, 'PU', e.salary*1.2, e.salary) AS "인상된급여" FROM employees e, jobs j WHERE e.job_id(+) = j.job_id;

-- case - when - then - when - then - else - end
SELECT e.first_name AS "이름", j.job_title AS "직책", e.job_id AS "잡아이디", e.salary AS "급여", CASE WHEN j.job_title LIKE '%Manager' THEN e.salary*1.1 WHEN j.job_title LIKE '%Accountant' THEN e.salary*1.2 ELSE e.salary*1.3 END AS "인상된급여" FROM employees e, jobs j WHERE e.job_id(+) = j.job_id;


-- Deletes a table
DROP TABLE table_name;
-- Deletes all datas but the table remains
DELETE FROM table_name;
-- DROP 된 table 살리기
FLASHBACK TABLE emergency_contact TO BEFORE DROP;
-- Delete a table completely
DROP TABLE emergency_contact purge;


-- 제약조건
-- primary key : 중복x nullx (pk)
-- foreign key : 중복o nullo (fk)
-- unique : 중복x null은 무관 (uk)
-- not null : null만 아니면됨 (nn)
-- check : price > 0 (ck)
DROP TABLE memidtable;
DROP TABLE memtable;
CREATE TABLE memidtable (
    memid number(6) CONSTRAINT memidtable_memid_pk PRIMARY KEY,
    memname varchar2(20)
);
CREATE TABLE memtable (
    memname varchar2(20) CONSTRAINT memtable_memname_pk PRIMARY KEY,
    memtel varchar2(20) CONSTRAINT memtable_memtel_uk UNIQUE,
    memhobby varchar2(30) CONSTRAINT memtable_memhobby_nn NOT NULL,
    membi number(5) CONSTRAINT memtable_membi_ck CHECK (membi>1000),
    memid number(6) CONSTRAINT memtable_memid_fk REFERENCES memidtable(memid)
);

-- 제약조건 방식 2가지
-- 1, column level 방식 : 칼럼명에 이어서
-- 2, table level 방식 : 제약조건을 뒤부분에 모아서
-- 예외 : not null : column level 방식

-- 제약조건 사용법
-- constraint 제약조건이름(테이블명_칼럼명_제약조건약어) 제약조건종류(5개중하나)


