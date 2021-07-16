-- Artist Table
-- Add 3 new artists to the artist table using INSERT. (It’s already created.)
INSERT INTO artist (name)
VALUES('Superorganism'),
('Coco & Clair Clair'),
('Crystal Fighters');
-- Select 5 artists in alphabetical order.
SELECT *  
FROM artist
WHERE artist_id < 6
ORDER by name asc;

-- Employee Table
-- List all employee first and last names only that live in Calgary.
SELECT last_name,first_name 
FROM employee 
WHERE city = 'Calgary';

-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column). 
-- You will need to query the employee table to find the Id for Nancy Edwards

SELECT *
FROM employee
WHERE reports_to = 2;

-- Count how many people live in Lethbridge.
SELECT 
COUNT(*)
FROM employee
WHERE city = 'Lethbridge';

-- Invoice Table
-- Count how many orders were made from the USA.
SELECT 
COUNT (*)
FROM invoice
WHERE billing_country = 'USA';

-- Find the largest order total amount.
SELECT MAX(total)
FROM invoice;
-- Find the smallest order total amount.
SELECT MIN(total)
FROM invoice;
-- Find all orders bigger than $5.

SELECT *
FROM invoice
WHERE total > 5;

-- Count how many orders were smaller than $5.
SELECT 
COUNT (*)
FROM invoice
WHERE total < 5;

-- Get the total sum of the orders.
SELECT SUM(total)
FROM invoice;

-- JOIN Queries (Various tables)
-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.
SELECT *
FROM invoice i
JOIN invoice_line il  
ON i.invoice_id = il.invoice_id
WHERE il.unit_price > 0.99;

-- Get the invoice_date, customer first_name and last_name, and total from all invoices.

SELECT i.total, i.invoice_date, c.first_name, c.last_name
FROM invoice i
JOIN customer c 
ON i.customer_id = c.customer_id;

-- Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers. 
-- Note that support reps are on the employee table.
SELECT c.first_name as customer_first, c.last_name as customer_last, e.first_name as rep_first, e.last_name as rep_last
FROM customer c
JOIN employee e
ON c.support_rep_id = e.employee_id
ORDER by rep_last asc;

-- Get the album title and the artist name from all albums.
SELECT a.title as album_title, art.name as artist_name
FROM album a
JOIN artist art
ON a.artist_id = art.artist_id;

-- Extra Credit¶
-- Artist Table

-- Select 10 artists in reverse alphabetical order.
SELECT *
FROM artist
WHERE artist_id <10
ORDER by name desc;

-- Select all artists that start with the word ‘Black’.
SELECT *
FROM artist
WHERE name 
LIKE'Black%';


-- Select all artists that contain the word ‘Black’.
SELECT *
FROM artist
WHERE name 
LIKE'%Black%';


-- Employee Table

-- Find the birthdate for the youngest employee.
SELECT MAX(birth_date)
FROM employee;

-- Find the birthdate for the oldest employee.
SELECT MIN(birth_date)
FROM employee;

-- Invoice Table

-- Count how many orders were in CA, TX, or AZ (use IN).
SELECT COUNT(*)
FROM invoice
WHERE billing_state 
IN ('CA', 'TX', 'AZ');

-- Get the average total of the orders.
SELECT AVG(total)
FROM invoice;


-- More Join Queries

-- Get all playlist_track track_ids where the playlist name is Music.
SELECT p.name, pl.playlist_track_id
FROM playlist p
JOIN playlist_track pl
ON p.playlist_id = pl.playlist_id
WHERE p.name = 'music';


-- Get all track names for playlist_id 5.
SELECT t.name
FROM track t
JOIN playlist_track
ON t.track_id = playlist_track.track_id
WHERE playlist.playlist_id = 5;


-- Get all track names and the playlist name that they’re on ( 2 joins ).
SELECT t.name, p.name
FROM track t
JOIN playlist_track pt
ON t.track_id = pt.track_id
JOIN playlist p
ON p.playlist_id = pt.playlist_id;

-- Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ).
SELECT t.name, a.title
FROM track t
JOIN genre g
ON t.genre_id = g.genre_id
JOIN album a 
ON a.album_id = t.album_id
WHERE g.name = 'Alternative & Punk';