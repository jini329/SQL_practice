SELECT A.NAME AS EMPLOYEE
FROM EMPLOYEE A
LEFT JOIN EMPLOYEE B
ON A.MANAGERID = B.ID
WHERE A.MANAGERID IS NOT NULL
AND A.SALARY > B.SALARY
;