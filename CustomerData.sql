-- Random Accounts 

INSERT into customer VALUES(seqID.nextVal, 'customer', 'one', 'customerone@gmail.com', '0123456789');
INSERT into customer VALUES(seqID.nextVal, 'customer', 'two', 'customertwo@gmail.com', '0123456789');

select * from customer
-------------------------------------------------------------------------------------------
--BELLA ACCOUNT 

--create account 

INSERT into customer VALUES(seqID.nextVal, 'Isabella', 'Attisano', 'iattisan@villanova.edu', '0123456789');

--add address / payment 

--add / remove items to cart

-- recently deleted

insert into cart_items VALUES(1, 15, 'small', 3);
delete from cart_items where cartid = 1 and productid = 15;
--select * from cart_items where cartid = 61 and productid = 21;
select * from recently_deleted_items;



--see all product reviews 

--add items to favorites / get all favorited items 

--get all items currently in cart / cart price 

--place order

INSERT into invoice Values(seqInvoice.nextVal, 3, 100);
INSERT into invoice Values(seqInvoice.nextVal, 3, 500);
INSERT into invoice_products Values(1, 1, 'large', 4);
INSERT into invoice_products Values(2, 2, 'small', 1);


--get order history 

select * from invoice where accountid = 3;

--add reviews 

--delete account

Delete from customer where accountid = 3;

--invoice history should still be there 

select ird.fname, ird.lname, ird.invoiceid from invoice_record_deleted_account ird;
select * from invoice;
-------------------------------------------------------------------------------------------

-- KAYLEIGH ACCOUNT 
-- Create account with ID 5

INSERT INTO customer VALUES(seqID.nextVal, 'Kayleigh', 'DiNatale', 'kwd@villanova.edu', '9141234567');

-- Add addresses to Kayleigh's account
-- select * from address
INSERT INTO address VALUES(5, '123 Green St', 'Philadelphia', 'PA', '10456');
INSERT INTO address VALUES(5, '50 Highbrook Rd', 'Binghamton', 'NY', '45231');

-- View Kayleigh's address options
SELECT Street ||' '|| City ||' '|| State ||' '|| Zip as Addresses 
FROM address 
WHERE accountID = 5;

-- ADD payments to Kayleigh's account
INSERT INTO payment VALUES(5, 2, 2028, '5555444433332222', '123');
INSERT INTO payment VALUES(5, 1, 2021, '1234567891234567', '423');

-- View Kayleigh's payment options
select expMonth ||'/'|| expYear AS Expiration_Date, '************'||''||SUBSTR(cardnumber, 12, 4) AS Card_Number 
FROM payment 
WHERE accountID = 5;

-- Add items to cart
-- Insert 1 square neck blouse in size medium to cart
INSERT INTO cart_items VALUES(5, 1, 'medium', 1);
INSERT INTO cart_items VALUES(5, 3, 'medium', 1);

--Select statement to show items in Kayleigh's Cart
select * from cart_items where cartID = 5;

-- Remove item from Kayleigh's cart
DELETE FROM cart_items where cartid = 5 AND productID = 3;

-- View recently deleted items from Kayleigh's cart
SELECT * FROM recently_deleted_items where accountid = 5;

-- Add to favorites
INSERT INTO favorites VALUES(5, 2);
INSERT INTO favorites VALUES(5, 5);

-- Shows Kayleigh's favorited items
SELECT pname, ptype, productid, price FROM favorites NATURAL JOIN product WHERE accountid = 5;

-------------------------------------------------------------------------------------------

--CAMRYN ACCOUNT 

-------------------------------------------------------------------------------------------

--CAITLIN ACCOUNT 

--create account 

INSERT into customer VALUES(seqID.nextVal, 'Caitlin', 'van Goeverden', 'cvg@gmail.com', '4562348908');

--add address / payment 
INSERT INTO address(accountid, street, city, state, zip) VALUES('121', 'Lancaster', 'Villanova', 'PA', '19085');
INSERT INTO payment(accountid, expmonth, expyear, cardnumber, securitycode) VALUES('121', '02', '23', '1234567890123456', '1234');

-------------------------------------------------------------------------------------------
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

-- GENERAL USE CASES 

-- see all product reviews 

-- how we can filter products 

-- inventory 