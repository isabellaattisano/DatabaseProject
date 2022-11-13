-- Random Accounts 

INSERT into customer VALUES(seqID.nextVal, 'customer', 'one', 'customerone@gmail.com', '0123456789');
INSERT into customer VALUES(seqID.nextVal, 'customer', 'two', 'customertwo@gmail.com', '0123456789');

-------------------------------------------------------------------------------------------
--BELLA ACCOUNT 

--create account 

--add address / payment 

--add / remove items to cart

--see all product reviews 

--add items to favorites 

--get all items currently in cart / cart price 

--place order

--get order history 

--add reviews 

--delete account

-------------------------------------------------------------------------------------------

--KAYLEIGH ACCOUNT 

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

-- GENERAL USE CASES 

-- see all product reviews 

-- how we can filter products 

-- inventory 
