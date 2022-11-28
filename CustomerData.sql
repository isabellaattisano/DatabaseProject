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

-------------------------------------------------------------------------------------------

-- Random Accounts 

INSERT into customer VALUES(seqID.nextVal, 'customer', 'one', 'customerone@gmail.com', '0123456789');
INSERT into customer VALUES(seqID.nextVal, 'customer', 'two', 'customertwo@gmail.com', '0123456789');
INSERT into customer VALUES(seqID.nextVal, 'Mary', 'Smith', 'Mary234@icloud.com', '1923347659');

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
-- Create account with ID 5

INSERT INTO customer VALUES(seqID.nextVal, 'Kayleigh', 'DiNatale', 'kwd@villanova.edu', '9141234567');
INSERT INTO customer VALUES(seqID.nextVal, 'Regan', 'DiNatale', 'rdin@ohiostate.edu', '9178342938');

-- Add addresses to Kayleigh's account
-- select * from address where accountid = 8
INSERT INTO address VALUES(8, '123 Green St', 'Philadelphia', 'PA', '10456');
INSERT INTO address VALUES(8, '50 Highbrook Rd', 'Binghamton', 'NY', '45231');


-- View Kayleigh's address options
SELECT Street ||' '|| City ||' '|| State ||' '|| Zip as Addresses 
FROM address 
WHERE accountID = 8;

-- ADD payments to Kayleigh's account
INSERT INTO payment VALUES(8, 2, 2028, '5555444433332222', '123');
INSERT INTO payment VALUES(8, 1, 2021, '1234567891234567', '423');

select * from payment where accountid = 8
-- View Kayleigh's payment options
select expMonth ||'/'|| expYear AS Expiration_Date, '************'||''||SUBSTR(cardnumber, 12, 4) AS Card_Number 
FROM payment 
WHERE accountID = 8;

-- Add items to cart
-- Insert 1 square neck blouse in size medium to cart
INSERT INTO cart_items VALUES(5, 1, 'medium', 1, 19.95);
INSERT INTO cart_items VALUES(5, 3, 'medium', 1, 49.95);
INSERT INTO cart_items VALUES(5, 4, 'medium', 3, 25);

--fix total price input 
Update cart_items set price = 75 where cartid = 5 and productid = 4

Update cart_items set pquantity = 2 where cartid = 5 and productid = 4
Update cart_items set price = 50 where cartid = 5 and productid = 4

select * from cart
select * from cart_items where cartid = 5
--delete kayleighs cart it will then cause trigger which will store cart as an invoice and items of cart as an invoice
delete from cart where cartid = 8
select * from invoice where accountid = 8
select * from invoice_products where invoiceid = 7

--Select statement to show items in Kayleigh's Cart
select Pname, ProductID Psize, Pquantity, Price from cart_items NATURAL JOIN product where cartID = 8;

--Cart total price, number of items, number of different types of products
select SUM(Price) as Total_Price, SUM(pquantity) as Total_Quantity_of_Items, COUNT( DISTINCT ProductID) as Product_Variety 
FROM cart_items NATURAL JOIN product 
where CartID = 5;

-- Remove item from Kayleigh's cart
DELETE FROM cart_items where cartid = 8 AND productID = 3;

-- Add to favorites
INSERT INTO favorites VALUES(8, 2);
INSERT INTO favorites VALUES(8, 5);

-- Shows Kayleigh's favorited items
SELECT pname, ptype, productid, price FROM favorites NATURAL JOIN product WHERE accountid = 8;

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

