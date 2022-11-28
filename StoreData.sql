--delete from product;
INSERT into product VALUES(seqProduct.nextVal, 'Square Neck Blouse', 'tops', 19.95, 2);
INSERT into product VALUES(seqproduct.nextVal, 'Oversized Sweater', 'tops', 49.95, 2);
INSERT into product VALUES(seqproduct.nextVal, 'High-Waisted Pants', 'bottoms', 49.95, 2);
INSERT into product VALUES(seqproduct.nextVal, 'Plaid Mini Skirt', 'bottoms', 25.00, 2);
INSERT into product VALUES(seqproduct.nextVal, 'Jacket', 'outerwear', 49.95, 2);
INSERT into product VALUES(seqproduct.nextVal, '4pck Scrunchies', 'accessories', 14.95, 2);

INSERT into product VALUES(seqproduct.nextVal, 'Pumpkin Spice', 'candles', 10.99, 2);
INSERT into product VALUES(seqproduct.nextVal, 'Glitter Pink', 'phone cases', 16.99, 2);
INSERT into product VALUES(seqproduct.nextVal, 'Monopoly', 'board games', 25.95, 2);
INSERT into product VALUES(seqproduct.nextVal, 'Grey Mug LARGE', 'mugs', 12.99, 2);
INSERT into product VALUES(seqproduct.nextVal, 'Stay Fine and Drink Wine', 'posters', 9.99, 2);

select * from product

-------------------------------------------------------------------------------------------
-- Update stored quantity

-- Square neck blouse updated to a stored quantity of 30
UPDATE product 
SET squantity = 30
WHERE ProductID = 1;

-- Oversized Sweater updated to a stored quantity of 0
UPDATE product 
SET squantity = 0
WHERE ProductID = 2;

-- Plaid Mini Skirt updated to stored quantity of 100
UPDATE product
SET squantity = 100 
WHERE ProductID = 4;
-- Jacket updated to stored quantity of 15
UPDATE product 
SET squantity = 15
WHERE ProductID = 5;


--Add trigger statement for when a cart is bought decrease squantity

-------------------------------------------------------------------------------------------
--Select statement shows products in stock
SELECT PName, Price, ProductID FROM product WHERE squantity>0; 

-------------------------------------------------------------------------------------------
--Categorize by Price
--Perfect gifts under 30$
SELECT PName, ProductID, Price FROM product WHERE Price < 30;

--Add more price options
-------------------------------------------------------------------------------------------
-- FILTER BY PTYPE

--list all product types 

SELECT distinct ptype as ProductType from product;


-- Select Statement indicating the quantity of products there are of each type 

SELECT ptype, count(ptype) as Quantity
from product
group by ptype;

-- user can filter by category 
select * from product

select pname as Name, price as Price, squantity as Quantity from product where ptype = 'tops';

-------------------------------------------------------------------------------------------
--RECEIVE SHIPMENT (increase the quantities of products) 

