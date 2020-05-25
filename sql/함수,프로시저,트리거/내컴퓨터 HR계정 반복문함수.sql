-- 사원들의 전체 연봉총액을 계산하기
CREATE OR REPLACE FUNCTION GET_TOTAL_SALARY
RETURN NUMBER

IS 
    v_total_salary number := 0;
    v_salary       employees.salary%TYPE;
    v_comm         employees.commission_pct%type;
    v_annual_salary employees.salary%TYPE;
    
    
    cursor emp_list IS
    select salary, nvl(commission_pct, 0) comm
    from employees;
BEGIN
    -- 커서를 for문에서 실행시킨다.
    -- for 변수명 in커서명 loop
    --  수행문;
    -- end loop;
    FOR emp IN emp_list loop
        v_salary        := emp.salary;
        v_comm          := emp.comm;
        v_annual_salary := v_salary*12 + trunc(v_salary*v_comm)*12;
        v_total_salary  := v_total_salary + v_annual_salary;
        
    end loop;
    
    RETURN v_total_salary;
    
    
END;