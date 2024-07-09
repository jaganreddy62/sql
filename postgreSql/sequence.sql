/*CREATE TABLE cinema (
    seat_id INT PRIMARY KEY,
    free int
);
select * from cinema;
INSERT INTO cinema (seat_id, free) VALUES (1, 1);
INSERT INTO cinema (seat_id, free) VALUES (2, 0);
INSERT INTO cinema (seat_id, free) VALUES (3, 1);
INSERT INTO cinema (seat_id, free) VALUES (4, 1);
INSERT INTO cinema (seat_id, free) VALUES (5, 1);
INSERT INTO cinema (seat_id, free) VALUES (6, 0);
INSERT INTO cinema (seat_id, free) VALUES (7, 1);
INSERT INTO cinema (seat_id, free) VALUES (8, 1);
INSERT INTO cinema (seat_id, free) VALUES (9, 0);
INSERT INTO cinema (seat_id, free) VALUES (10, 1);
INSERT INTO cinema (seat_id, free) VALUES (11, 0);
INSERT INTO cinema (seat_id, free) VALUES (12, 1);
INSERT INTO cinema (seat_id, free) VALUES (13, 0);
INSERT INTO cinema (seat_id, free) VALUES (14, 1);
INSERT INTO cinema (seat_id, free) VALUES (15, 1);
INSERT INTO cinema (seat_id, free) VALUES (16, 0);
INSERT INTO cinema (seat_id, free) VALUES (17, 1);
INSERT INTO cinema (seat_id, free) VALUES (18, 1);
INSERT INTO cinema (seat_id, free) VALUES (19, 1);
INSERT INTO cinema (seat_id, free) VALUES (20, 1);
*/
--METHOD1
WITH T AS (
SELECT SEAT_ID,CASE WHEN (SEAT_ID-LAG(SEAT_ID) OVER() =1) OR (LEAD(SEAT_ID) OVER()-SEAT_ID = 1) THEN 1 ELSE 0
END AS SEQUENCE_FILTER
FROM CINEMA WHERE FREE=1)
SELECT SEAT_ID FROM T WHERE SEQUENCE_FILTER=1
;
--METHOD2
WITH T1 AS (
SELECT ROW_NUMBER() OVER () AS RN ,SEAT_ID FROM CINEMA WHERE FREE =1 ),
T2 AS (
SELECT SEAT_ID-RN AS GRP,SEAT_ID FROM T1
),
T3 AS(
SELECT GRP,COUNT(*) FROM T2 GROUP BY GRP HAVING COUNT(*) >2
	)
	SELECT T2.SEAT_ID,T3.GRP FROM T2 JOIN T3 ON T2.GRP=T3.GRP
; 
--METHOD3
WITH T1 AS(
SELECT A.SEAT_ID AS A_SEAT,B.SEAT_ID AS B_SEAT FROM CINEMA A JOIN CINEMA B ON A.SEAT_ID =B.SEAT_ID+1 AND A.FREE=1 AND B.FREE=1
)
SELECT A_SEAT FROM T1 UNION SELECT B_SEAT FROM T1 ;