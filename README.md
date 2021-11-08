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

