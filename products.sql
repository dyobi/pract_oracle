DROP TABLE products_table;

CREATE TABLE products_table (
id NUMBER(3),
dan NUMBER(5),
soo NUMBER(5)
);

INSERT INTO products_table VALUES (1, 1000, 200);
INSERT INTO products_table VALUES (2, 500, 50);

COMMIT;

DROP TABLE gold_table;

CREATE TABLE gold_table (
id NUMBER(3),
gold NUMBER(10)
);

INSERT INTO gold_table VALUES (1, 200000);
INSERT INTO gold_table VALUES (2, 25000);

COMMIT;