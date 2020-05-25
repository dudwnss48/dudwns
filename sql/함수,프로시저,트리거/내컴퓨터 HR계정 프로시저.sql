-- 직원 번호를 전달받아서 그 직원의 급여를 인상시키는 프로시저 작성하기
CREATE OR REPLACE PROCEDURE update_salary
(i_emp_id IN number)-- 매개변수
IS
    -- 변수 정의한다.
    -- 변수       변수의 데이터타입
    --           employees의 salary 컬럼의 데이터타입과 동일한 데이터타입으로 변수 선언
    v_emp_salary employees.salary%TYPE; -- 사원의 급여
    v_update_rate number(3, 2);         -- 급여 인상률
BEGIN
    -- SQL 문장, PL/SQL 구문을 작성
    
    -- 전달받은 직원아이디에 해당하는 직원의 급여를 조회한다.
    -- 조회된 직원의 급여를 위해서 선언한 v_emp_salary에 대입한다.
    select salary
    into v_emp_salary
    from employees
    where employee_id = i_emp_id;
    
    -- 직원의 급여에 따라서 인상률을 결정하기
    -- 20000달러 이상 10%, 10000달러 이상 15%, 그외 20% 인상
    IF v_emp_salary >=  20000 THEN v_update_rate := 0.1;
    ELSIF v_emp_salary >= 10000 THEN v_update_rate :=0.15;
    ELSE v_update_rate := 0.2;
    END IF;
    
    -- 급여를 인상시키기
    UPDATE employees
    SET
        salary = salary + trunc(salary*v_update_rate)
    WHERE 
        employee_id = i_emp_id;
        
    -- DB에 영구적으로 반영시키기
    COMMIT;
END;