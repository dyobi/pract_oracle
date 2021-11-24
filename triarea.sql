-- ### 삼각형의 넓이를 구하는 함수를 만들어보자
CREATE OR REPLACE FUNCTION triarea (
    v_v IN NUMBER,
    v_h IN NUMBER
)  -- int 밑변, int높이를 받아서
 RETURN NUMBER  -- 넓이를 반환하는데 자료형이 숫자
 IS
    v_area NUMBER;
BEGIN
    v_area := v_v * v_h / 2; -- equal => :=
    RETURN v_area;
END;
/
-- user defined function
-- ###

-- 실행 1
--SELECT '삼각형의 넓이는 ' || triArea(100, 20) FROM dual;

-- 실행 2
--VARIABLE RESULT NUMBER
--EXECUTE :RESULT := triArea(100, 20)
--PRINT RESULT

