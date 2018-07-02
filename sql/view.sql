
-------------------------------------------到期提醒视图
CREATE OR REPLACE VIEW ViewExpiration
   AS
   SELECT ROWNUM AS ID,A.* FROM
   (
   SELECT  C.CAR_NO,A.EXDATE,'保养提醒' AS TEXT FROM(
     SELECT MR.CAR_ID,MAX(MR.NEXT_DATE) AS EXDATE
       FROM MAINTAIN_RECORD MR
      GROUP BY MR.CAR_ID) A
    INNER JOIN CAR C ON C.ID=A.CAR_ID
    WHERE (EXDATE-SYSDATE)<=7
      
  UNION 
   SELECT  C.CAR_NO,A.EXDATE,'年检提醒' AS TEXT FROM 
    (SELECT IR.CAR_ID,MAX(IR.EXPIRE_DATE) AS EXDATE
       FROM INSPECTION_RECORD IR
      GROUP BY IR.CAR_ID) A
     INNER JOIN CAR C ON C.ID=A.CAR_ID
     WHERE (EXDATE-SYSDATE)<=7
   
  UNION 
   SELECT  C.CAR_NO,A.EXDATE,'保险提醒' AS TEXT FROM 
    (SELECT IR.CAR_ID,MAX(IR.EXPIRE_DATE) AS EXDATE
       FROM INSURANCE_RECORD IR
      GROUP BY IR.CAR_ID) A
     INNER JOIN CAR C ON C.ID=A.CAR_ID
     WHERE (EXDATE-SYSDATE)<=7
  ) A;
 

-------------------------------------------车辆费用对比视图
CREATE OR REPLACE VIEW ViewCostContrast
AS
SELECT ROWNUM AS ID,B.* FROM
(
SELECT C.CAR_NO,NVL(SUM(A.CAR_COST),0) AS CAR_COST
FROM
(
--统计维修金额
SELECT C.ID,NVL(SUM(RR.REPAIR_COST),0) AS CAR_COST
  FROM CAR C
  LEFT JOIN REPAIR_RECORD RR ON C.ID=RR.CAR_ID
  GROUP BY C.ID
  
  UNION
  
--统计加油金额  
SELECT C.ID,NVL(SUM(RR.TOTAL_AMOUNT),0) AS CAR_COST
  FROM CAR C
  LEFT JOIN REFUELING_RECORD RR ON C.ID=RR.CAR_ID
  GROUP BY C.ID
  
--统计规费金额
  UNION

SELECT C.ID,NVL(SUM(FM.FEES_AMOUNT),0) AS CAR_COST
  FROM CAR C
  LEFT JOIN FEES_MANAGER FM ON C.ID=FM.CAR_ID
  GROUP BY C.ID

  UNION
  
--统计保养金额
SELECT C.ID,NVL(SUM(MR.MAIN_AMOUNT),0) AS CAR_COST
  FROM CAR C
  LEFT JOIN MAINTAIN_RECORD MR ON C.ID=MR.CAR_ID
  GROUP BY C.ID
  
  UNION
  
--统计违章金额
SELECT C.ID,NVL(SUM(PR.FINE),0) AS CAR_COST
  FROM CAR C
  LEFT JOIN PECCANCY_RECORD PR ON C.ID=PR.CAR_ID
  GROUP BY C.ID
  
  UNION
  
--统计事故金额
SELECT C.ID,NVL(SUM(AR.WE_AMOUNT),0) AS CAR_COST
  FROM CAR C
  LEFT JOIN ACCIDENT_RECORD AR ON C.ID=AR.CAR_ID
  GROUP BY C.ID
    
  UNION
  
--统计年检金额
SELECT C.ID,NVL(SUM(IR.INS_AMOUNT),0) AS CAR_COST
  FROM CAR C
  LEFT JOIN INSPECTION_RECORD IR ON C.ID=IR.CAR_ID
  GROUP BY C.ID
  
  UNION
  
--统计保险金额
SELECT C.ID,NVL(SUM(IR.INS_AMOUNT),0) AS CAR_COST
  FROM CAR C
  LEFT JOIN INSURANCE_RECORD IR ON C.ID=IR.CAR_ID
  GROUP BY C.ID
) A
INNER JOIN CAR C ON C.ID=A.ID
GROUP BY C.CAR_NO
) B
ORDER BY B.CAR_COST DESC;


-------------------------------------------单个车辆费用分布视图
CREATE OR REPLACE VIEW ViewCostDistribution
AS
SELECT ROWNUM AS ID,B.* FROM
(
SELECT C.ID AS CID,C.CAR_NO,NVL(A.CAR_COST,0) AS CAR_COST,A.TEXT
FROM
(
--统计维修金额
SELECT RR.CAR_ID,NVL(SUM(RR.REPAIR_COST),0) AS CAR_COST,'维修费用' AS TEXT
  FROM REPAIR_RECORD RR
  GROUP BY RR.CAR_ID
  
  UNION
  
--统计加油金额  
SELECT RR.CAR_ID,NVL(SUM(RR.TOTAL_AMOUNT),0) AS CAR_COST,'加油费用' AS TEXT
  FROM REFUELING_RECORD RR
  GROUP BY RR.CAR_ID
  
--统计规费金额
  UNION

SELECT FM.CAR_ID,NVL(SUM(FM.FEES_AMOUNT),0) AS CAR_COST,'规费费用' AS TEXT
  FROM FEES_MANAGER FM
  GROUP BY FM.CAR_ID

  UNION
  
--统计保养金额
SELECT MR.CAR_ID,NVL(SUM(MR.MAIN_AMOUNT),0) AS CAR_COST,'保养费用' AS TEXT
  FROM MAINTAIN_RECORD MR
  GROUP BY MR.CAR_ID
  
  UNION
  
--统计违章金额
SELECT PR.CAR_ID,NVL(SUM(PR.FINE),0) AS CAR_COST,'违章费用' AS TEXT
  FROM PECCANCY_RECORD PR
  GROUP BY PR.CAR_ID
  
  UNION
  
--统计事故金额
SELECT AR.CAR_ID,NVL(SUM(AR.WE_AMOUNT),0) AS CAR_COST,'事故费用' AS TEXT
  FROM ACCIDENT_RECORD AR
  GROUP BY AR.CAR_ID
    
  UNION
  
--统计年检金额
SELECT IR.CAR_ID,NVL(SUM(IR.INS_AMOUNT),0) AS CAR_COST,'年检费用' AS TEXT
  FROM INSPECTION_RECORD IR
  GROUP BY IR.CAR_ID
  
  UNION
  
--统计保险金额
SELECT IR.CAR_ID,NVL(SUM(IR.INS_AMOUNT),0) AS CAR_COST,'保险费用' AS TEXT
  FROM INSURANCE_RECORD IR
  GROUP BY IR.CAR_ID
) A
INNER JOIN CAR C ON C.ID=A.CAR_ID
) B;