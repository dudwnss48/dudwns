-- �������̵� ���޹޾Ƽ� �� ������ ������ ��ȯ�ϴ� �Լ�(Ŀ�̼��� ���t��)
CREATE OR REPLACE FUNCTION  GET_ANNUAL_SALARY
    (i_emp_id IN NUMBER) -- �������̵� �Ű������� ���޹޴´�.
    RETURN NUMBER        -- ���Լ��� ��ȯ���� ���ڰ��̴�.
    
    IS
        v_salary            employees.salary%TYPE;          -- �޿�
        v_comm              employees.commission_pct%TYPE;  -- Ŀ�̼�
        v_annual_salary     employees.salary%TYPE;          -- ����
    BEGIN
        -- �������̵� �ش��ϴ� ������ �޿��� Ŀ�̼��� ��ȸ�ؼ� V_SALARY�� V_COMM�� �����Ѵ�.
        SELECT SALARY, NVL(COMMISSION_PCT,0)
        INTO v_salary, v_comm
        FRom employees
        where employee_id = i_emp_id;
        
        -- Ŀ�̼��� �ݿ��� ������ ����ؼ� ������ �����Ѵ�.
        v_annual_salary := v_annual_salary * 12 + trunc(v_salary*v_comm);
        
        -- ������ ����� ���� ��ȯ�Ѵ�.
        return v_annual_salary;
    
    END;