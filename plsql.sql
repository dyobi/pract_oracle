-- sequel (항공사 상표랑 동일한이름 structured english query language) -> sql
-- PL/SQL : procedure language / structured query language
-- => (sql + 절차적 프로그래밍)
-- PL/SQL 종류 : procedure , function, trigger

-- ### pl/sql 작성 방법
-- 1) pl/sql block는 declare, begin, exception, end로 구성
-- 2) declare, exception 은 생략 가능
-- 3) 이름이 없는 경우는 익명 블록이다
-- 4) 변수 선언은 declare절에서 하되
-- 5) procedure 안에서 사용할 변수는 IS 에 기술한다
-- 6) begin ~ end; 의 블록단위로 실행하며 이 블록안에 처리 문장등이 들어간다
-- 7) 각각의 문장의 종료는 세미콜론(;)
-- 8) 주석은 한문장인 경우 -- 기호 이며 여러줄 주석은 자바와 같다
-- 9) end의 끝에 세미콜론(;)을 사용, 이것은 블록-end를 의미한다
-- 10) 블록의 실행을 위해 문장끝에 /를 입력한다
-- 11) 검색관련 select 에서는 결과는 한행이 반환되어야 하며 into 변수가 요구된다
-- 12) 검색관련 select 여러줄 처리가 가능하게 하려면 cursor를 사용하면된다

--------------------------------------------------

SET SERVEROUTPUT ON
DECLARE
    aa   NUMBER;
    irum VARCHAR2(20) := 'hong';
BEGIN
    aa := 95;
    dbms_output.put_line(aa);   -- Like System.out.println()
    dbms_output.put_line(irum);
END;

--------------------------------------------------

-- ### AVG salary function

CREATE OR REPLACE FUNCTION avgsal_dpt_func (
    v_department_id IN employees.department_id%TYPE
) RETURN employees.salary%TYPE IS
    v_avg_salary employees.salary%TYPE;
BEGIN
    SELECT
        AVG(salary)
    INTO v_avg_salary
    FROM
        employees
    WHERE
        department_id = v_department_id;

    RETURN v_avg_salary;
END;
/

-- 실행
VARIABLE res NUMBER
EXECUTE :res := avgsal_dpt_func(80)
PRINT res

--------------------------------------------------

-- ### 사원수, 부서테이블의 행수 조회

CREATE OR REPLACE PROCEDURE soo_count
(v_emp_cnt OUT NUMBER, v_dpt_cnt OUT NUMBER)
IS
BEGIN
SELECT COUNT(*) INTO v_emp_cnt FROM employees;
SELECT COUNT(*) INTO v_dpt_cnt FROM departments;
END;
/

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE print_soo_count
IS
v_emp_cnt NUMBER;
v_dpt_cnt NUMBER;
BEGIN
soo_count(v_emp_cnt, v_dpt_cnt);
dbms_output.put_line('사원수는 ' || v_emp_cnt || ' 명 입니다.');
dbms_output.put_line('부서수는 ' || v_dpt_cnt || ' 개 입니다.');
END;
/

EXECUTE print_soo_count();

--------------------------------------------------

-- ### sawon table의 1번 사원을 삭제하는 프로그램

CREATE OR REPLACE PROCEDURE delete_ppl
IS
BEGIN
DELETE FROM sawon WHERE emp_id = 1;
END;
/

EXECUTE delete_ppl;

--------------------------------------------------

-- ### employees 사원 중 사원 아이디가 120 이상인 사원의 급여를 10% 인상하시오
-- (110, 20%), (130, 15%)도 되야함

CREATE OR REPLACE PROCEDURE sal_increase
(v_id IN employees.employee_id%TYPE, v_per IN NUMBER)
IS
BEGIN
UPDATE employees SET salary = salary * (1 + v_per / 100) WHERE employee_id >= v_id;
COMMIT;
END;
/

--------------------------------------------------

-- ### 지역아이디를 입력받아 해당 지역아이디의 모든 컬럼내용을 조회 출력하시오

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE retrieve_regions
(v_region_id IN regions.region_id%TYPE)
IS
v_temp regions %ROWTYPE;
BEGIN
SELECT * INTO v_temp FROM regions WHERE region_id = v_region_id;
dbms_output.put_line('지역아이디 = ' || v_temp.region_id || chr(10) || '지역명 = ' || v_temp.region_name);
END;
/

EXECUTE retrieve_regions(1);

--------------------------------------------------

-- ### 부서아아디와 사원명을 입력받아 부서아이디, 사원명, 급여를 조회출력하는 프로시져를 작성하시오

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE print_emp
(v_dpt_id IN employees.department_id%TYPE, v_emp_name IN employees.first_name%TYPE)
IS
v_temp employees%ROWTYPE;
BEGIN
SELECT * INTO v_temp FROM employees WHERE LOWER(first_name) = LOWER(v_emp_name) AND department_id = v_dpt_id;
dbms_output.put_line('부서아이디 : ' || v_temp.department_id || ', 사원명 : ' || v_temp.first_name || ', 급여 : ' || v_temp.salary);
END;
/

EXECUTE print_emp(90, 'steven')

--------------------------------------------------

-- ### 사원아이디를 입력받아 급여가 5000 이상이면 A, 그렇지않으면 B를 출력하는 프로시져를 작성하시오
-- (출력은 사원아이디, 급여, 등급)

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE a_or_b
(v_emp_id IN employees.employee_id%TYPE)
IS
v_salary employees.salary%TYPE;
v_grade VARCHAR2(2);
BEGIN
SELECT salary INTO v_salary FROM employees WHERE employee_id = v_emp_id;
IF (v_salary >= 15000) THEN v_grade := 'A';
ELSIF (v_salary BETWEEN 10000 AND 14999) THEN v_grade := 'B';
ELSIF (v_salary BETWEEN 5000 AND 9999) THEN v_grade := 'C';
ELSE v_grade := 'D';
END IF;
dbms_output.put_line('사원아이디 : ' || v_emp_id);
dbms_output.put_line('급여 : ' || v_salary);
dbms_output.put_line('등급 : ' || v_grade);
END;
/

EXECUTE a_or_b(128)

--------------------------------------------------

-- ### 1부터 100까지 더하는 프로그램
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE add_100_forloop
IS
v_res NUMBER(5) := 0;
BEGIN
FOR i IN 1..100 LOOP
v_res := v_res + i;
END LOOP;
dbms_output.put_line(v_res);
END;
/

EXECUTE add_100_forloop()

--------------------------------------------------

-- ### sawon table 에서 이름을 입력받아 해당 이름 데이터를 삭제하는 프로시져 작성하시오
-- 삭제한 후 삭제한 결과에 대한 comment도 출력하시오

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE del_user_by_name
(v_name IN sawon.emp_name%TYPE)
IS
v_res VARCHAR2(30);
BEGIN
DELETE FROM sawon WHERE emp_name = v_name;
IF SQL%NOTFOUND THEN v_res := '없어';
ELSE v_res := TO_CHAR(SQL%ROWCOUNT) || '명';
END IF;
dbms_output.put_line('삭제인원은 ' || v_res || ' 입니다');
END;
/

EXECUTE del_user_by_name('joooon')

--------------------------------------------------

-- ### 급여를 입력하여 해당 급여보다 많은 급여를 받는 사원의 이름, 급여, 입사일을 출력하고
-- 몇명인지 인원수도 출럭하는 프로시져를 작성하시오 (cursor 사용)

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE more_than_mine
(v_salary_in IN employees.salary%TYPE)
IS
v_first_name employees.first_name%TYPE;
v_salary employees.salary%TYPE;
v_hire_date employees.hire_date%TYPE;
v_cnt NUMBER(4) := 0;
CURSOR salary_gt IS (SELECT first_name, salary, hire_date FROM employees WHERE salary > v_salary_in);
BEGIN
OPEN salary_gt;
LOOP
FETCH salary_gt INTO v_first_name, v_salary, v_hire_date;
EXIT WHEN salary_gt%NOTFOUND;
dbms_output.put_line('이름 : ' || v_first_name || ' / 급여 : ' || v_salary || ' / 입사일 : ' || v_hire_date);
v_cnt := v_cnt + 1;
END LOOP;
dbms_output.put_line('총 ' || TO_CHAR(v_cnt) || ' 명');
END;
/

EXECUTE more_than_mine(10000)

--------------------------------------------------

-- ### 판매테이블에서 단가, 수량컬럼 중 수량이 변경되면 금액 테이블에 단가*수량이 자동으로 적용되는 trigger 프로그램을 작성하시오

CREATE OR REPLACE TRIGGER cal_trigger
AFTER UPDATE OF soo ON products_table
FOR EACH ROW
BEGIN
UPDATE gold_table
SET gold = :OLD.dan * :NEW.soo
WHERE id = :OLD.id;
END;
/

UPDATE products_table SET soo=70 WHERE id = 1;
SELECT * FROM gold_table;

--------------------------------------------------

-- ### 토요일과 일요일에는 작업하지 못하도록 trigger 프로그램을 작성하시오
-- 토, 일요일에 products_table에 변화가 발생하면 '누구냐넌' 출력

SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER no_working
BEFORE UPDATE OR INSERT OR DELETE ON products_table
BEGIN
IF (LOWER(TO_CHAR(SYSDATE, 'day')) IN ('saturday', 'sunday')) THEN
raise_application_error(-20000, 'Who are you?');
ELSE dbms_output.put_line('Have a good time');
END IF;
END;
/

--------------------------------------------------




