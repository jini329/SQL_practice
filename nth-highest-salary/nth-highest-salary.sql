CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    /* Write your PL/SQL query statement below */
    
    SELECT MAX(A.SALARY) INTO RESULT
    FROM (
        SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) AS RNK, SALARY
        FROM EMPLOYEE
    ) A
    WHERE A.RNK = N
    ;
    
    RETURN result;
END;