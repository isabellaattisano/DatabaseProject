--HELPFUL STATEMENTS

--delete from customer;
select * from customer;
--delete from product;
select * from product;
--delete from address;
select * from address;
--delete from payment;
select * from payment;
--delete from cart_items;
select * from cart_items; 
--delete from invoice;
select * from invoice;
--delete from invoice_record_deleted_account;
select * from invoice_record_deleted_account;
--delete from invoice_products
select * from invoice_products

-------------------------------------------------------------------------------------------
--BELLA ACCOUNT 

--create account 

INSERT into customer VALUES(seqID.nextVal, 'Isabella', 'Attisano', 'iattisan@villanova.edu', '0123456789');
--add address / payment 

--add / remove items to cart


--see all product reviews 

--add items to favorites / get all favorited items 

--get all items currently in cart / cart price 

--place order

INSERT into invoice Values(seqInvoice.nextVal, 1, 100);
INSERT into invoice Values(seqInvoice.nextVal, 1, 500);
INSERT into invoice_products Values(1, 1, 'large', 4);
INSERT into invoice_products Values(2, 2, 'small', 1);


--get order history 

select * from invoice where accountid = 1;

--add reviews 

--delete account

Delete from customer where accountid = 1;

--invoice history should still be there 

select ird.fname, ird.lname, ird.invoiceid from invoice_record_deleted_account ird;
select * from invoice;
-------------------------------------------------------------------------------------------

-- KAYLEIGH ACCOUNT 
-- Create accounts with ID 6, 7
INSERT INTO customer VALUES(seqID.nextVal, 'Kayleigh', 'DiNatale', 'kwd@villanova.edu', '9141234567');

-- Add addresses to Kayleigh's account
INSERT INTO address VALUES(2, '123 Green St', 'Philadelphia', 'PA', '10456');
INSERT INTO address VALUES(2, '50 Highbrook Rd', 'Binghamton', 'NY', '45231');


-- View Kayleigh's address options
SELECT Street ||' '|| City ||' '|| State ||' '|| Zip as Addresses 
FROM address 
WHERE accountID = 2;

-- ADD payments to Kayleigh's account
INSERT INTO payment VALUES(2, 2, 2028, '5555444433332222', '123');
INSERT INTO payment VALUES(2, 1, 2021, '1234567891234567', '423');

-- View Kayleigh's payment options
select expMonth ||'/'|| expYear AS Expiration_Date, '************'||''||SUBSTR(cardnumber, 12, 4) AS Card_Number 
FROM payment 
WHERE accountID = 2;

-- Add items to cart
INSERT INTO cart_items VALUES(2, 1, 'medium', 1, 19.95);
INSERT INTO cart_items VALUES(2, 3, 'medium', 1, 49.95);
INSERT INTO cart_items VALUES(2, 4, 'medium', 3, 25);

-- View Kayleigh's current cart
select * from cart_items where cartid = 2;

-- Change quantity
Update cart_items set pquantity = 2 where cartid = 2 and productid = 4;

--Update kayleigh cart to cause purchase and store in invoice
Update cart set cartid = 2 where cartid = 2;

-- Check trigger worked for kayleigh's invoice
select * from invoice where accountid = 2

--Check invoice products purchased
select * from invoice_products where invoiceid = 3

select * from product
--Create a review for Kayleigh
INSERT into reviews Values(2, 14, 20, 5, 9, 4, 'True to Size', 'Yes');

--Check Kayleigh's reviews
select age, feet ||' foot '|| inches as height, rating ||''|| ' out of 5' as Overall_Rating, sizedesc, recommend from reviews where accountid = 2;

--Check all reviews for a product
select age, feet ||' foot '|| inches as height, rating ||''|| ' out of 5' as Overall_Rating, sizedesc, recommend from reviews where productid = 14;

--Cart total price, number of items, number of different types of products
select SUM(Price) as Total_Price, SUM(pquantity) as Total_Quantity_of_Items, COUNT( DISTINCT ProductID) as Product_Variety 
FROM cart_items NATURAL JOIN product 
where CartID = 2;

--Add to cart
INSERT into cart_items Values(2, 10, 'onesize', 4, 12.99);

--Add Review
select * from cart_items
INSERT into Reviews Values(2, 10, 20, 5, 9, 1, 'One Size', 'No');
INSERT into Reviews Values(2, 42, 20, 5, 9, 5, 'One Size', 'Yes');

-- Remove item from Kayleigh's cart
DELETE FROM cart_items where cartid = 2 AND productID = 10;

-- Add to favorites
INSERT INTO favorites VALUES(2, 2);
INSERT INTO favorites VALUES(2, 5);

-- Shows Kayleigh's favorited items
SELECT pname, ptype, productid, price FROM favorites NATURAL JOIN product WHERE accountid = 2;

--Delete Kayleigh's account 
delete from customer where accountid = 2

-------------------------------------------------------------------------------------------

--CAMRYN ACCOUNT 

-------------------------------------------------------------------------------------------

--CAITLIN ACCOUNT 

--create account 
select * from customer
INSERT into customer VALUES(seqID.nextVal, 'Caitlin', 'van Goeverden', 'cvg@gmail.com', '4562348908');
insert into cart_items values(3, 15, 'large', 3);
delete from customer where accountid = 3;
--add address / payment 
INSERT INTO address(accountid, street, city, state, zip) VALUES('121', 'Lancaster', 'Villanova', 'PA', '19085');
INSERT INTO payment(accountid, expmonth, expyear, cardnumber, securitycode) VALUES('121', '02', '23', '1234567890123456', '1234');

-------------------------------------------------------------------------------------------
--RANDOM ACCOUNTS
-- Random Accounts 

INSERT into customer VALUES(seqID.nextVal, 'customer', 'one', 'customerone@gmail.com', '0123456789');
INSERT into customer VALUES(seqID.nextVal, 'customer', 'two', 'customertwo@gmail.com', '0123456789');
INSERT into customer VALUES(seqID.nextVal, 'Mary', 'Smith', 'Mary234@icloud.com', '1923347659');
INSERT INTO customer VALUES(seqID.nextVal, 'Regan', 'DiNatale', 'rdin@ohiostate.edu', '9178342938');

--Sarah's Account
INSERT into customer VALUES(seqID.nextVal, 'Sarah', 'Jones', 'Sjones@me.com', '3274828342');

--Sarah's cards
INSERT into payment Values(8, 4, 2025, '1111222233334444', '012');
INSERT into payment Values(8, 9, 2032, '1234123412341234', '914');

--View Sarah's payment options
select expMonth ||'/'|| expYear AS Expiration_Date, '************'||''||SUBSTR(cardnumber, 12, 4) AS Card_Number 
FROM payment 
WHERE accountID = 8;

--View How many forms of payment Sarah has
select count(cardnumber) as Number_of_payments from payment where accountid = 8

--Sarah's addresses
INSERT into address Values(8, '398 Brick Road', 'Tampa', 'FL', '25013');
INSERT into address Values(8, '511 Greenwich Ave', 'New York', 'NY', '82315');

-- View Sarah's addresses
SELECT Street ||' '|| City ||' '|| State ||' '|| Zip as Addresses 
FROM address 
WHERE accountID = 8;

-- Add items to cart 
INSERT into cart_items Values(8, 6, 'small', 1, 14.95);
INSERT into cart_items Values(8, 1, 'medium', 2, 19.95);

-- View cart items
select * from cart_items where cartid = 8;

-- Purchase cart items 
update cart set cartid = 8 where cartid = 8;

--View invoice
select * from invoice where accountid = 8
select * from invoice_products where invoiceid = 5

