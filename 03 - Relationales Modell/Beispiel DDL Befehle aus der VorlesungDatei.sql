CREATE TABLE B (b1 INTEGER,
				b2 INTEGER,
				PRIMARY KEY(b1, b2));

CREATE TABLE A (a1 VARCHAR(1),
				a2 VARCHAR(1),
				a3 VARCHAR(1),
				a4 VARCHAR(1),
				a5 INTEGER,
				a6 INTEGER,
				PRIMARY KEY(a1, a2),
				UNIQUE(a3, a4),
				FOREIGN KEY (a5, a6) REFERENCES B(b1, b2));

FROM A;
FROM B;

-- insert records into B
INSERT INTO B VALUES (1,2);
INSERT INTO B VALUES (2,3);
INSERT INTO B VALUES (6,7);

-- insert records into A
INSERT INTO A VALUES ('x','y','z','u',1,2);
INSERT INTO A VALUES ('y','z','x','v',1,2);
INSERT INTO A VALUES ('x','x','y','y',2,3);
INSERT INTO A VALUES ('z','z','v','x',4,5); -- fails since referential integrity is not given

-- check NULL
INSERT INTO A VALUES ('z','z','v','x',NULL,NULL);

-- check uniqueness
INSERT INTO A VALUES ('a','a','v','x',1,2);

-- trying to insert NULL key
INSERT INTO B VALUES (NULL,2);
