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

-- Random Accounts 

INSERT into customer VALUES(seqID.nextVal, 'customer', 'one', 'customerone@gmail.com', '0123456789');
INSERT into customer VALUES(seqID.nextVal, 'customer', 'two', 'customertwo@gmail.com', '0123456789');
INSERT into customer VALUES(seqID.nextVal, 'Mary', 'Smith', 'Mary234@icloud.com', '1923347659');

--Sarah's Account
INSERT into customer VALUES(seqID.nextVal, 'Sarah', 'Jones', 'Sjones@me.com', '3274828342');

--Sarah's cards
INSERT into payment Values(4, 4, 2025, '1111222233334444', '012');
INSERT into payment Values(4, 9, 2032, '1234123412341234', '914');

--View Sarah's payment options
select expMonth ||'/'|| expYear AS Expiration_Date, '************'||''||SUBSTR(cardnumber, 12, 4) AS Card_Number 
FROM payment 
WHERE accountID = 4;

--View How many forms of payment Sarah has
select count(cardnumber) as Number_of_payments from payment where accountid = 4

--Sarah's addresses
INSERT into address Values(4, '398 Brick Road', 'Tampa', 'FL', '25013');
INSERT into address Values(4, '511 Greenwich Ave', 'New York', 'NY', '82315');

-- View Sarah's addresses
SELECT Street ||' '|| City ||' '|| State ||' '|| Zip as Addresses 
FROM address 
WHERE accountID = 4;

-- Add items to cart 
INSERT into cart_items Values(4, 6, 'small', 1, 14.95);
INSERT into cart_items Values(4, 1, 'medium', 2, 19.95);

-- View cart items
select * from cart_items where cartid = 4;

-- Purchase cart items 
update cart set cartid = 4 where cartid = 4;

--View invoice
select * from invoice where accountid = 4
select * from invoice_products where invoiceid = 1


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

INSERT into invoice Values(seqInvoice.nextVal, 3, 100);
INSERT into invoice Values(seqInvoice.nextVal, 3, 500);
INSERT into invoice_products Values(1, 1, 'large', 4);
INSERT into invoice_products Values(2, 2, 'small', 1);


--get order history 

select * from invoice where accountid = 3;

--add reviews 

--delete account

Delete from customer where accountid = 105;

--invoice history should still be there 

select ird.fname, ird.lname, ird.invoiceid from invoice_record_deleted_account ird;
select * from invoice;
-------------------------------------------------------------------------------------------

-- KAYLEIGH ACCOUNT 
-- Create accounts with ID 6, 7
INSERT INTO customer VALUES(seqID.nextVal, 'Kayleigh', 'DiNatale', 'kwd@villanova.edu', '9141234567');
INSERT INTO customer VALUES(seqID.nextVal, 'Regan', 'DiNatale', 'rdin@ohiostate.edu', '9178342938');

-- Add addresses to Kayleigh's account
INSERT INTO address VALUES(6, '123 Green St', 'Philadelphia', 'PA', '10456');
INSERT INTO address VALUES(6, '50 Highbrook Rd', 'Binghamton', 'NY', '45231');


-- View Kayleigh's address options
SELECT Street ||' '|| City ||' '|| State ||' '|| Zip as Addresses 
FROM address 
WHERE accountID = 6;

-- ADD payments to Kayleigh's account
INSERT INTO payment VALUES(6, 2, 2028, '5555444433332222', '123');
INSERT INTO payment VALUES(6, 1, 2021, '1234567891234567', '423');

-- View Kayleigh's payment options
select expMonth ||'/'|| expYear AS Expiration_Date, '************'||''||SUBSTR(cardnumber, 12, 4) AS Card_Number 
FROM payment 
WHERE accountID = 6;

-- Add items to cart
INSERT INTO cart_items VALUES(6, 1, 'medium', 1, 19.95);
INSERT INTO cart_items VALUES(6, 3, 'medium', 1, 49.95);
INSERT INTO cart_items VALUES(6, 4, 'medium', 3, 25);

-- View Kayleigh's current cart
select * from cart_items where cartid = 6;

--fix total price input 
Update cart_items set price = 75 where cartid = 6 and productid = 4;

-- Change quantity, change price
Update cart_items set pquantity = 2 where cartid = 6 and productid = 4;
Update cart_items set price = 50 where cartid = 6 and productid = 4;

select * from cart_items where cartid = 6

--Update kayleigh cart to cause purchase and store in invoice
Update cart set cartid = 6 where cartid = 6;

-- Check trigger worked for kayleigh's invoice
select * from invoice where accountid = 6

--Check invoice products purchased
select * from invoice_products where invoiceid = 1

select * from product
--Create a review for Kayleigh
INSERT into reviews Values(6, 14, 20, 5, 9, 4, 'True to Size', 'Yes');

--Check Kayleigh's reviews
select age, feet ||' foot '|| inches as height, rating ||''|| ' out of 5' as Overall_Rating, sizedesc, recommend from reviews where accountid = 6;

--Check all reviews for a product
select age, feet ||' foot '|| inches as height, rating ||''|| ' out of 5' as Overall_Rating, sizedesc, recommend from reviews where productid = 14;

--Select statement to show items in Kayleigh's Cart
select Pname, ProductID Psize, Pquantity, Price from cart_items NATURAL JOIN product where cartID = 6;

--Cart total price, number of items, number of different types of products
select SUM(Price) as Total_Price, SUM(pquantity) as Total_Quantity_of_Items, COUNT( DISTINCT ProductID) as Product_Variety 
FROM cart_items NATURAL JOIN product 
where CartID = 6;

-- Remove item from Kayleigh's cart
DELETE FROM cart_items where cartid = 6 AND productID = 3;

-- Add to favorites
INSERT INTO favorites VALUES(6, 2);
INSERT INTO favorites VALUES(6, 5);

-- Shows Kayleigh's favorited items
SELECT pname, ptype, productid, price FROM favorites NATURAL JOIN product WHERE accountid = 6;

--Delete Kayleigh's account 
delete from customer where accountid = 5

-------------------------------------------------------------------------------------------

--CAMRYN ACCOUNT 

-------------------------------------------------------------------------------------------

--CAITLIN ACCOUNT 

--create account 

INSERT into customer VALUES(seqID.nextVal, 'Caitlin', 'van Goeverden', 'cvg@gmail.com', '4562348908');
insert into cart_items values(142, 15, 'large', 3);
delete from customer where accountid = 142;
--add address / payment 
INSERT INTO address(accountid, street, city, state, zip) VALUES('121', 'Lancaster', 'Villanova', 'PA', '19085');
INSERT INTO payment(accountid, expmonth, expyear, cardnumber, securitycode) VALUES('121', '02', '23', '1234567890123456', '1234');

