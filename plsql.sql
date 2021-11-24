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