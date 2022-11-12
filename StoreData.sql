--CREATE PRODUCTS 
INSERT into product VALUES(seqProduct.nextVal, 'Square Neck Blouse', 'tops', 19.95);
INSERT into product VALUES(seqproduct.nextVal, 'Oversized Sweater', 'tops', 49.95);
INSERT into product VALUES(seqproduct.nextVal, 'High-Waisted Pants', 'bottoms', 49.95);
INSERT into product VALUES(seqproduct.nextVal, 'Plaid Mini Skirt', 'bottoms', 25.00);
INSERT into product VALUES(seqproduct.nextVal, 'Jacket', 'outerwear', 49.95);
INSERT into product VALUES(seqproduct.nextVal, '4pck Scrunchies', 'accessories', 14.95);

INSERT into product VALUES(seqproduct.nextVal, 'Pumpkin Spice', 'candles', 10.99);
INSERT into product VALUES(seqproduct.nextVal, 'Glitter Pink', 'phone case', 16.99);
INSERT into product VALUES(seqproduct.nextVal, 'Monopoly', 'board games', 25.95);
INSERT into product VALUES(seqproduct.nextVal, 'Grey Mug LARGE', 'mugs', 12.99);
INSERT into product VALUES(seqproduct.nextVal, 'Stay Fine and Drink Wine', 'posters', 9.99);

-------------------------------------------------------------------------------------------
--CREATE CUSTOMER ACCOUNT

INSERT into customer VALUES(seqID.nextVal, 'customer', 'one', 'customerone@gmail.com', '0123456789');
INSERT into customer VALUES(seqID.nextVal, 'customer', 'two', 'customertwo@gmail.com', '0123456789');
INSERT into customer VALUES(seqID.nextVal, 'Caitlin', 'van Goeverden', 'cvg@gmail.com', '4562348908');
INSERT into customer VALUES(seqID.nextVal, 'Caitlin2', 'van Goeverden2', 'cvg2@gmail.com', '2562348908');
-------------------------------------------------------------------------------------------

-- ADD ADDRESS
INSERT INTO address(accountid, street, city, state, zip) VALUES('121', 'Lancaster', 'Villanova', 'PA', '19085');
-------------------------------------------------------------------------------------------

-- ADD PAYMENT
INSERT INTO payment(accountid, expmonth, expyear, cardnumber, securitycode) VALUES('121', '02', '23', '1234567890123456', '1234');
-------------------------------------------------------------------------------------------


--ADD ITEMS TO CART

INSERT into cart_items VALUES(1, 1, 'small', 1);
INSERT into cart_items VALUES(1, 2, 'large', 2);
INSERT into cart_items VALUES(2, 3, 'medium', 3);
INSERT into cart_items VALUES(2, 6, 'onesize', 4);
INSERT into cart_items VALUES(121, 165, 'onesize', 2);

-------------------------------------------------------------------------------------------
-- REMOVE from cart

DELETE FROM cart_items
where productid ='165'
and cartid='121';

-------------------------------------------------------------------------------------------
-- DELETE CUSTOMERS
DELETE FROM customer
where fname ='Caitlin2';

-------------------------------------------------------------------------------------------
-- VIEW CARTs

--select cv.cartid, cv.totalprice, ci.productid from cart_view cv JOIN cart_items ci on cv.cartid = ci.cartid;


-------------------------------------------------------------------------------------------
--Select Statement indicating product storage Quantity
SELECT ptype, count(ptype) as Quantity
from product
group by ptype;

-------------------------------------------------------------------------------------------
select * from customer;
select * from product;
select * from address;
select * from payment;
select * from cart_items; 
