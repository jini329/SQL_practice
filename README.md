# SQL_practice

## leetCode 문제 연습 (Oracle)

### 1. [Consecutive numbers](https://github.com/jini329/SQL_practice/tree/main/consecutive-numbers)
- **LEAD** : 다음 행의 값을 가져옴
- **LAG** : 이전 행의 값을 가져옴

<details>
    <summary>table : T1</summary>
  
  | id | num |
  |----|-----|
  | 1  | 1   |
  | 2  | 1   |
  | 3  | 1   |
  | 4  | 2   |
  | 5  | 1   |
</details>

```sql
SELECT A.NUM
     , LEAD(A.NUM) OVER (ORDER BY A.ID) AS LEAD  -- 다음 값
     , LAG(A.NUM) OVER (ORDER BY A.ID) AS LAG  -- 이전 값
FROM T1
;
```

<details>
    <summary>result</summary>
  
| NUM | LEAD | LAG |
|-----|------|-----|
|  1  |  1  |  -  |
|  1  |  1  |  1  |
|  1  |  2  |  1  |
|  2  |  1  |  1  |
|  1  |  -  |  2  |

</details>

### 2. [N-th highest salary](https://github.com/jini329/SQL_practice/tree/main/nth-highest-salary)
- **RANK()** : 중복 순위 부여, 다음 순위 PASS (일반적인 순위)
- **DENSE_RANK()** : 중복 순위 부여, 다음 순위 부여
- **ROW_NUMBER()** : 중복 관계 없이 순위 부여
- **ROWNUM** : 행 번호

```sql
SELECT NUM
    , RANK() OVER(ORDER BY NUM) AS RANK
    , DENSE_RANK() OVER(ORDER BY NUM) AS DENSE_RANK
    , ROW_NUMBER() OVER(ORDER BY NUM) AS ROW_NUMBER
    , ROWNUM AS IDX
FROM T2;
```

<details>
    <summary>result</summary>
    
| NUM | RANK | DENSE_RANK | ROW_NUMBER | IDX |
|-----|------|------------|------------|-----|
|  1  |  1   |     1      |     1      |  1  |
|  1  |  1   |     1      |     2      |  2  |
|  1  |  1   |     1      |     3      |  3  |
|  2  |  4   |     2      |     4      |  4  |
    
</details>

- **SELECT  col1 INTO var1** : var1 = col1 대입
```sql
CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER; --변수 선언
BEGIN
    
    SELECT MAX(A.SALARY) INTO RESULT -- MAX(A.SALARY) 값을 RESULT 변수에 대입
    FROM (
        SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) AS RNK, SALARY
        FROM EMPLOYEE
    ) A
    WHERE A.RNK = N
    ;
    
    RETURN result;
END;
```
