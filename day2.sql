-- PRACTICE JOINS

-- Get all invoices where the unit price on the invoice line is greater than $0.99

SELECT *
FROM Invoice
JOIN InvoiceLine 
ON InvoiceLine.InvoiceId = Invoice.InvoiceId
WHERE InvoiceLine.UnitPrice > .99

-- Get all invoices and show me their invoice date, customer first and last names, and total

SELECT Invoice.InvoiceDate, Customer.FirstName, Customer.LastName, Invoice.Total
FROM Invoice 
JOIN Customer
ON Invoice.CustomerId = Customer.CustomerId 

-- Get all customers and show me their first name, last name, and support rep first name and last name (support reps are on the Employees table)

SELECT Customer.FirstName, Customer.LastName, Employee.FirstName, Employee.LastName
FROM Employee
JOIN Customer
ON Customer.SupportRepId = Employee.EmployeeId

-- Get all Albums and show me the album title and the artist name

SELECT Album.Title, Artist.Name
FROM Album
JOIN Artist
ON Album.ArtistId = Artist.ArtistId

-- Get all Playlist Tracks where the playlist name is Music

SELECT *
FROM Playlist
JOIN PlaylistTrack
ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
WHERE Name = 'Music'

-- Get all Tracknames for playlistId 5

SELECT *
FROM Track
JOIN PlaylistTrack
ON Track.TrackId = PlaylistTrack.TrackId
WHERE PlaylistTrack.PlaylistId = 5

-- Now we want all tracknames and the playlist name that they're on (You'll have to use 2 joins)

SELECT Playlist.name, Track.name 
FROM Playlist
join PlayListTrack 
ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
join Track 
ON PlaylistTrack.TrackID = Track.TrackId

-- Get all Tracks that are alternative and show me the track name and the album name (2 joins)

SELECT Album.Title, Track.name, Genre.name 
FROM Track
join Album 
ON Track.AlbumId = Album.AlbumId
join Genre 
ON Track.GenreID = Genre.GenreId
where genre.name = 'Alternative'


-- PRACTICE NESTED QUERIES

-- Get all invoices where the unit price on the invoice line is greater than $0.99

SELECT *
FROM Invoice
WHERE InvoiceId in
(SELECT InvoiceId FROM InvoiceLine WHERE InvoiceLine.UnitPrice > .99)

-- Get all Playlist Tracks where the playlist name is Music

SELECT *
FROM PlaylistTrack
WHERE PlaylistID in 
(SELECT PlaylistID FROM Playlist WHERE Playlist.Name = 'Music')

-- Get all Tracknames for playlistId 5

SELECT *
FROM Track
WHERE TrackId in 
(SELECT TrackId FROM PlaylistTrack WHERE PlaylistTrack.PlaylistId = 5)


-- Get all tracks where the genre is comedy

SELECT Track.name
FROM Track
WHERE Track.GenreID in 
(SELECT Genre.GenreId FROM Genre WHERE Genre.name = 'Comedy')

-- Get all tracks where the album is Fireball

SELECT Track.name
FROM Track
WHERE Track.AlbumID in 
(SELECT Album.AlbumId FROM Album WHERE Album.Title = 'Fireball')

-- Get all tracks for the artist queen Queen (2 nested subqueries)

SELECT *
FROM Track
WHERE Track.AlbumID in 
(SELECT Album.AlbumId FROM Album
WHERE Album.ArtistId in
(SELECT Artist.ArtistId FROM Artist 
 WHERE Artist.Name = 'Queen'));


-- PRACTICE UPDATING ROWS


-- Find all customers with fax numbers and set those numbers to null

UPDATE Customer
SET fax = null;

-- Find all customers with no company (null) and set their company to self

UPDATE Customer
SET Company = 'self'
where Company is null;


-- Find the customer Julia Barnett and change her last name to Thompson

UPDATE Customer
SET LastName = 'Thompson'
where FirstName = 'Julia' and LastName = 'Barnett';

-- Find the customer with this email luisrojas@yahoo.cl and change his support rep to rep 4

UPDATE Customer
SET SupportRepId = 4
where Email = 'luisrojas@yahoo.cl';

-- Find all tracks that are of the genre Metal and that have no composer and set the composer to be 'The darkness around us'

UPDATE Track
SET Composer = 'The darkness around us'
WHERE Track.GenreId
	IN(SELECT Genre.GenreId
       FROM Genre
       WHERE Track.GenreId = Genre.GenreId AND Genre.name = 'Metal')
		AND Composer IS null
-- GROUP BY


-- Find a count of how many tracks there are per genre

SELECT Genre.Name, count(*)
FROM Track
JOIN Genre
ON Track.GenreId = Genre.GenreId
GROUP BY Genre.Name;

-- Find a count of all Tracks where the Genre is pop

SELECT Genre.Name, count(*)
FROM Track
JOIN Genre
ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = 'Pop'
GROUP BY Genre.Name

-- Find a list of all artist and how many albums they have

SELECT Artist.Name, count(*)
FROM Artist
JOIN Album
ON Artist.ArtistId = Album.ArtistId
GROUP BY Artist.Name


-- USE DISTINCT

-- From the tracks table find a unique list of all composers

SELECT DISTINCT Composer
FROM Track

-- From the Invoice table find a unique list of all Billing postal codes

SELECT DISTINCT BillingPostalCode
FROM Invoice

-- From the Customer table find a unique list of all companies

SELECT DISTINCT Company
FROM Customer



-- DELETE ROWS

-- Remove all pop tracks from the tracks table

-- DELETE FROM Tracks
-- JOIN Genre
-- ON Track.GenreId = Genre.GenreId
-- WHERE Genre.Name = 'Pop'

-- Remove all tracks by Santana

-- DELETE FROM Track
-- join Album 
-- ON Track.AlbumId = Album.AlbumId
-- join Artist
-- ON Album.ArtistID = Artist.ArtistId
-- where Artist.Name = 'Santana'

-- Remove all of the rest of the tracks, yes all of them.

DELETE FROM Track



-- ECOMMERCE SIMULATION

-- Let's simulate an e-commerce site. We're going to need users, products, and orders.
-- Users need a name and an email. Products need a name and a price Orders need a ref to product. All 3 need primary keys.
-- Add some data to fill up each table (write down your schema since you won't see it on the side). You'll need to insert products before you can link them.
-- Add 2 users, multiple products and multiple orders.

CREATE TABLE users (
  	id INTEGER PRIMARY KEY AUTOINCREMENT,  
  	name VARCHAR(150),
  	email VARCHAR(150)
  )

INSERT INTO users(name, email)
VALUES('Megan', 'Megan@gmail.com'), ('Sara', 'Sara@gmail.com')

CREATE TABLE products (
  	id INTEGER PRIMARY KEY AUTOINCREMENT, 
  	name VARCHAR(150),
  	price INTEGER
  )

INSERT INTO products(name, price)
VALUES('Shoes', 12), ('Socks', 10), ('Shirt', 20), ('Pants', 30)

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    product_id INTEGER REFERENCES products(id)
)

INSERT INTO orders(product_id)
VALUES(1), (2), (3), (4)



-- Run some queries against your data:

-- Get all products for the first order



-- Get all orders



-- Get the total cost of an order (sum the price of all products on an order)




-- ADD FOREIGN KEY TO EXISTING TABLE: 

-- Orders have products, but someone needs to place the order.
-- Add a ref from Orders to Users.
-- Add some users. Update the Orders table to link the a user to each order.
-- Run some queries against your data:

-- Get all orders for a user



-- Get how many orders each user has



-- Black Diamond: Get the total spend on all orders for each user