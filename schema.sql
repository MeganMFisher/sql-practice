PERSON: 

CREATE TABLE: 

CREATE TABLE Person (
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  name VARCHAR(150),
  age INTEGER, 
  height VARCHAR(150),
  city VARCHAR(150),
  favoriteColor VARCHAR(150)
  )

INSERT VALUES INTO TABLE: 

INSERT INTO Person (name, age, height, city, favoriteColor)
VALUES('Megan', 26, '5ft 9in', 'Orem', 'Maroon')


ORDER BY TALLEST HEIGHT: 

SELECT *
FROM Person
ORDER BY height DESC

ORDER BY SHORTEST HEIGHT: 

SELECT *
FROM Person
ORDER BY height ASC

ORDER BY OLDEST: 

SELECT *
FROM Person
ORDER BY age DESC

THOSE OLDER THAN 20: 

SELECT *
FROM Person
WHERE age > 20

THOSE WHO ARE 18: 

SELECT *
FROM Person
WHERE age = 18

THOSE YOUNGER THAN 20 AND OLDER THAN 30: 

SELECT *
FROM Person
WHERE age < 20 OR age > 30

ALL THOSE NOT 27 YEARS OLD: 

SELECT *
FROM Person
WHERE age != 27

FAV COLOR NOT RED: 

SELECT *
FROM Person
WHERE favoriteColor != 'red'

FAV COLOR NOT RED OR BLUE: 

SELECT *
FROM Person
WHERE favoriteColor != 'Red' AND favoriteColor != 'Blue'

FAV COLOR IS ORANGE OR GREEN: 

SELECT *
FROM Person
WHERE favoriteColor = 'Orange' OR favoriteColor = 'Blue'

FAV COLOR IS ORANGE, GREEN, OR BLUE: 

SELECT *
FROM Person
WHERE favoriteColor IN ('Blue', 'Green', 'Orange')

FAV COLOR IS YELLOW OR PURPLE: 

SELECT *
FROM Person
WHERE favoriteColor = 'Yellow' OR favoriteColor = 'Purple'

ORDER:

CREATE ORDERS TABLE: 

CREATE TABLE Orders (
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  productName VARCHAR(150),
  productPrice INTEGER, 
  quantity INTEGER,
  personId INTEGER
  )

ADD ORDERS TO TABLE: 

INSERT INTO Orders(productName, productPrice, quantity, personId)
VALUES('socks', 12, 99, 1),
('bows', 3, 14, 2),
('headbands', 10, 45, 3),
('pants', 24, 18, 4), 
('shirts', 32, 14, 5)

SELECT ALL ORDERS:

SELECT * 
FROM Orders

TOTAL # PRODUCTS ORDERED: 

SELECT SUM(quantity)
  FROM Orders

TOTAL ORDER PRICE: 

SELECT SUM(productPrice)
FROM Orders

TOTAL ORDER PRICE BY PERSONID: 

SELECT SUM(productPrice)
FROM Orders
WHERE personId = 1


ARTISTS:

ADD THREE ARTISTS TO THE TABLE: 

INSERT INTO Artist(Name)
VALUES('Blue'), ('Orange'), ('Red')

TOP 10 IN REVERSE ALPHABETICAL ORDER: 

SELECT * 
FROM Artist
ORDER BY name ASC
LIMIT 10

TOP 5 IN ALPHABETICAL ORDER: 

SELECT * 
FROM Artist
ORDER BY name ASC
LIMIT 5

ARTISTS START WITH THE NAME ‘BLACK’:

SELECT * 
FROM Artist
WHERE name LIKE 'Black%'

ARTISTS THAT CONTAIN THE NAME ‘BLACK:

SELECT * 
FROM Artist
WHERE name LIKE '%Black%'

EMPLOYEE: 

ADD 2 NEW EMPLOYEES:

INSERT INTO Employee(EmployeeId, LastName, FirstName)
VALUES(123, 'JONES', 'BOB'), (354, 'BLACK', 'BEN')

List all Employee first and last names only that live in Calgary:

SELECT FirstName, LastName
FROM Employee
WHERE City = 'Calgary'

Find the first and last name for the youngest employee:

SELECT FirstName, LastName
FROM Employee
ORDER BY BirthDate DESC
LIMIT 1

Find the first and last name for the oldest employee:

SELECT FirstName, LastName, BirthDate
FROM Employee
ORDER BY BirthDate ASC
LIMIT 1

Find everyone that reports to Nancy Edwards:

SELECT *
FROM Employee
WHERE ReportsTo = 2 

Count how many people live in Lethbridge:

SELECT count(*)
FROM Employee
WHERE City = 'Lethbridge'

INVOICE: 

Count how many orders were made from the USA:

SELECT count(*)
FROM Invoice
WHERE BillingCountry = 'USA'

Find the largest order total amount:

SELECT *
FROM Invoice
ORDER BY Total DESC
Limit 1

Find the smallest order total amount:

SELECT *
FROM Invoice
ORDER BY Total ASC
Limit 1

Find all orders bigger than $5:

SELECT *
FROM Invoice
WHERE Total > 5

Count how many orders were smaller than $5:

SELECT count(*)
FROM Invoice
WHERE Total < 5

Count how many orders were in CA, TX, or AZ:

SELECT count(*)
FROM Invoice
WHERE BillingState IN ('CA', 'TX', 'AZ')

Get the average total of the orders:

SELECT AVG(Total)
FROM Invoice

Get the total sum of the orders:

SELECT SUM(Total)
FROM Invoice
