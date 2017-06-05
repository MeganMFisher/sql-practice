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

-- Get all Tracknames for playlistId 5

-- Now we want all tracknames and the playlist name that they're on (You'll have to use 2 joins)

-- Get all Tracks that are alternative and show me the track name and the album name (2 joins)



-- PRACTICE NESTED QUERIES

-- Get all invoices where the unit price on the invoice line is greater than $0.99

-- Get all Playlist Tracks where the playlist name is Music

-- Get all Tracknames for playlistId 5

-- Get all tracks where the genre is comedy

-- Get all tracks where the album is Fireball

-- Get all tracks for the artist queen Queen (2 nested subqueries)



-- PRACTICE UPDATING ROWS


-- Find all customers with fax numbers and set those numbers to null

-- Find all customers with no company (null) and set their company to self

-- Find the customer Julia Barnett and change her last name to Thompson

-- Find the customer with this email luisrojas@yahoo.cl and change his support rep to rep 4

-- Find all tracks that are of the genre Metal and that have no composer and set the composer to be 'The darkness around us'


-- GROUP BY


-- Find a count of how many tracks there are per genre

-- Find a count of all Tracks where the Genre is pop

-- Find a list of all artist and how many albums they have


-- USE DISTINCT

-- From the tracks table find a unique list of all composers

-- From the Invoice table find a unique list of all Billing postal codes

-- From the Customer table find a unique list of all companies


-- DELETE ROWS

-- Remove all pop tracks from the tracks table

-- Remove all tracks by Santana

-- Remove all of the rest of the tracks, yes all of them.


-- ECOMMERCE SIMULATION

-- Let's simulate an e-commerce site. We're going to need users, products, and orders.
-- Users need a name and an email. Products need a name and a price Orders need a ref to product. All 3 need primary keys.
-- Add some data to fill up each table (write down your schema since you won't see it on the side). You'll need to insert products before you can link them.
-- Add 2 users, multiple products and multiple orders.
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