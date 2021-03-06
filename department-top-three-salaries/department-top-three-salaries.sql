SELECT AA.DEPARTMENT
    , AA.EMPLOYEE
    , AA.SALARY
FROM (SELECT B.NAME AS DEPARTMENT
    , A.NAME AS EMPLOYEE
    , A.SALARY AS SALARY
    , DENSE_RANK() OVER(PARTITION BY A.DEPARTMENTID ORDER BY A.SALARY DESC) AS RNK
FROM EMPLOYEE A
LEFT JOIN DEPARTMENT B
ON A.DEPARTMENTID = B.ID) AA
WHERE AA.RNK <= 3;
