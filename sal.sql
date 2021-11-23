DROP TABLE salgrade;
CREATE TABLE salgrade (
    grade number(5) NOT NULL,
    lsal number(8),
    hsal number(8),
    CONSTRAINT salgrade_grade_pk PRIMARY KEY(grade)
);
INSERT INTO salgrade(grade, lsal, hsal) VALUES (1, 500, 2999);
INSERT INTO salgrade(grade, lsal, hsal) VALUES (2, 3000, 3799);
INSERT INTO salgrade(grade, lsal, hsal) VALUES (3, 3800, 5199);
INSERT INTO salgrade(grade, lsal, hsal) VALUES (4, 5200, 9999);
INSERT INTO salgrade(grade, lsal, hsal) VALUES (5, 10000, 50000);
COMMIT;

SELECT * FROM salgrade;
SELECT * FROM TAB;