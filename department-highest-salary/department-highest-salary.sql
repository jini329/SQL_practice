-- SELECT B.NAME AS DEPARTMENT
--     , A.NAME AS EMPLOYEE
--     , A.SALARY AS SALARY
-- FROM (
--         SELECT A.ID
--             , A.NAME
--             , A.SALARY
--             , A.DEPARTMENTID
--             , MAX(A.SALARY) OVER(PARTITION BY A.DEPARTMENTID) AS MAX_SALARY
--         FROM EMPLOYEE A
--     ) A
-- LEFT JOIN DEPARTMENT B
-- ON A.DEPARTMENTID = B.ID
-- WHERE A.SALARY = A.MAX_SALARY
-- ;


SELECT B.NAME AS DEPARTMENT
    , A.NAME AS EMPLOYEE
    , A.SALARY AS SALARY
FROM EMPLOYEE A
JOIN DEPARTMENT B
ON A.DEPARTMENTID = B.ID
WHERE (A.DEPARTMENTID, A.SALARY) IN (SELECT C.DEPARTMENTID, MAX(C.SALARY) -- tuple 형태로 조건문 추가 가능
                                        FROM EMPLOYEE C
                                        GROUP BY C.DEPARTMENTID
                                     )
;