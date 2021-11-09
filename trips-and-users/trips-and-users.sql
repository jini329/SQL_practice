-- 취소율 계산
-- cancellation rate = # of canceled (unbanned) / # of total (unbanned)

-- driver / client 모두 ban 당하면 안됨

SELECT AA.REQUEST_AT AS DAY
     , ROUND(SUM(CASE WHEN AA.STATUS = 'completed' 
                    THEN 0 
                    ELSE 1 
                    END) / COUNT(AA.REQUEST_AT)
             , 2) AS "CANCELLATION RATE"
FROM (
        SELECT A.*
            , B.BANNED AS CLIENT_BANNED
            , C.BANNED AS DRIVER_BANNED
        FROM TRIPS A
        LEFT JOIN USERS B
        ON A.CLIENT_ID = B.USERS_ID
        LEFT JOIN USERS C
        ON A.DRIVER_ID = C.USERS_ID
    ) AA
WHERE AA.CLIENT_BANNED = 'No'
AND AA.DRIVER_BANNED = 'No'
AND AA.REQUEST_AT BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY AA.REQUEST_AT
;
