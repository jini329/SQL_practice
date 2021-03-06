-- SELECT DISTINCT L1.NUM AS CONSECUTIVENUMS
-- FROM LOGS L1
--     , LOGS L2
--     , LOGS L3
-- WHERE L1.ID = L2.ID - 1
--     AND L2.ID = L3.ID-1
--     AND L1.NUM = L2.NUM
--     AND L2.NUM = L3.NUM
-- ;

SELECT DISTINCT AA.NUM AS CONSECUTIVENUMS
FROM (
        SELECT A.ID
            , A.NUM
            , LEAD(A.NUM) OVER(ORDER BY ID) AS BACK -- 앞의 값
            , LAG(A.NUM) OVER(ORDER BY ID) AS FORWARD -- 뒤의 값
        FROM LOGS A
    ) AA
WHERE AA.NUM = AA.BACK
    AND AA.NUM = AA.FORWARD