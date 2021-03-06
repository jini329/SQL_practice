SELECT MAX(SALARY) AS SECONDHIGHESTSALARY
FROM (
    SELECT RANK() OVER (ORDER BY SALARY DESC) AS RNK, SALARY
    FROM EMPLOYEE
) A
WHERE A.RNK = 2
;
