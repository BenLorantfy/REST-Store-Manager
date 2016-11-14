
DROP DATABASE IF EXISTS melvin;

CREATE DATABASE melvin;

USE melvin;

CREATE TABLE Customer (
	custID INTEGER AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50),
	lastName VARCHAR(50),
    phoneNumber VARCHAR(12)
);

CREATE TABLE Product (
	prodID INTEGER AUTO_INCREMENT PRIMARY KEY,
    prodName VARCHAR(100),
	price DECIMAL(7,2),
    prodWeight DECIMAL(6,3),
	inStock BOOL
);

CREATE TABLE Order1 (
	orderID INTEGER AUTO_INCREMENT PRIMARY KEY,
    custID INTEGER,
	poNumber VARCHAR(30),
    orderDate DATE
);

CREATE TABLE Cart (
	orderID INTEGER,
    prodID INTEGER,
	PRIMARY KEY (orderID, prodID),
	quantity INTEGER
);

ALTER TABLE Order1 ADD CONSTRAINT FOREIGN KEY (custID) REFERENCES Customer (custID);
ALTER TABLE Cart ADD CONSTRAINT FOREIGN KEY (orderID) REFERENCES Order1 (orderID);
ALTER TABLE Cart ADD CONSTRAINT FOREIGN KEY (prodID) REFERENCES Product (prodID);

INSERT INTO Customer VALUES (NULL, 'Joe', 'Bzolay', '555-555-1212');
INSERT INTO Customer VALUES (NULL, 'Nancy', 'Finklbaum', '555-235-4578');
INSERT INTO Customer VALUES (NULL, 'Henry', 'Svitzinski', '555-326-8456');

INSERT INTO Product VALUES (NULL, 'Grapple Grommet', 0.02, 0.005, TRUE);
INSERT INTO Product VALUES (NULL, 'Wandoozals', 2.35, 0.532, TRUE);
INSERT INTO Product VALUES (NULL, 'Kardoofals', 8.75, 5.650, FALSE);

INSERT INTO Order1 VALUES (NULL, 1, 'GRAP-09-2011-001', '2011-09-15');
INSERT INTO Order1 VALUES (NULL, 1, 'GRAP-09-2011-056', '2011-09-30');
INSERT INTO Order1 VALUES (NULL, 3, NULL, '2011-10-05');

INSERT INTO Cart VALUES (1, 1, 500);
INSERT INTO Cart VALUES (1, 2, 1000);
INSERT INTO Cart VALUES (2, 3, 10);
INSERT INTO Cart VALUES (3, 1, 75);
INSERT INTO Cart VALUES (3, 2, 15);
INSERT INTO Cart VALUES (3, 3, 5);