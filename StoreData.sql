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

INSERT into product VALUES(seqproduct.nextVal, 'Cream Cable Knit Sweater', 'tops', 35.50, 20);
INSERT into product VALUES(seqproduct.nextVal, 'Paisley Midi Skirt', 'bottoms', 55.95, 34);
INSERT into product VALUES(seqproduct.nextVal, 'Black Head Band', 'accessories', 8.45, 14);
INSERT into product VALUES(seqproduct.nextVal, '3pck Pink Claw Clips', 'accessories', 10.00, 25);
INSERT into product VALUES(seqproduct.nextVal, 'Black Velvet Strapless Dress', 'dresses', 75.50, 12);


-------------------------------------------------------------------------------------------
--Display Products 

--all products 
select * from product;

--Select statement shows products in stock
SELECT Pname, Price, ProductID FROM product WHERE pquantity>0; 

-- View all out of stock products 
select * from product where pquantity = 0;

-------------------------------------------------------------------------------------------
-- Update stored quantity

-- Square neck blouse updated to a stored quantity of 30
UPDATE product 
SET pquantity = 30
WHERE ProductID = 1;

-- Oversized Sweater updated to a stored quantity of 0
UPDATE product 
SET pquantity = 0
WHERE ProductID = 2;

-- Plaid Mini Skirt updated to stored quantity of 100
UPDATE product
SET pquantity = 100 
WHERE ProductID = 4;
-- Jacket updated to stored quantity of 15
UPDATE product 
SET pquantity = 15
WHERE ProductID = 5;

-------------------------------------------------------------------------------------------
--Filter (clothing v. homegoods) by Price

--Price High to Low
select * from product where ptype not in ('mugs', 'board games', 'posters', 'phone cases', 'candles') and pquantity > 0 order by price asc;
select * from product where ptype in ('mugs', 'board games', 'posters', 'phone cases', 'candles') and pquantity > 0 order by price asc;


--Price Low to High 
select * from product where ptype not in ('mugs', 'board games', 'posters', 'phone cases', 'candles') and pquantity > 0 order by price asc;
select * from product where ptype in ('mugs', 'board games', 'posters', 'phone cases', 'candles') and pquantity > 0 order by price asc;


--Perfect gifts under 30$
SELECT PName, ProductID, Price FROM product WHERE Price < 30 and pquantity > 0;

select * from product where pquantity > 0 and ptype = 'tops' and price<=30 and pquantity > 0;

--FILTER BY TYPE 

--view homegoods
select * from product where ptype in ('mugs', 'board games', 'posters', 'phone cases') and pquantity > 0;

--view clothing
select * from product where ptype not in ('mugs', 'board games', 'posters', 'phone cases') and pquantity > 0;

select * from product where ptype = 'mugs' and pquantity > 0;
select * from product where ptype = 'board games' and pquantity > 0;
select * from product where ptype = 'posters' and pquantity > 0;
select * from product where ptype = 'phone cases' and pquantity > 0;
select * from product where ptype = 'candles' and pquantity > 0;


select * from product where ptype = 'tops' and pquantity > 0;
select * from product where ptype = 'bottoms' and pquantity > 0;
select * from product where ptype = 'accessories' and pquantity > 0;
select * from product where ptype = 'outerwear' and pquantity > 0;
select * from product where ptype = 'dresses' and pquantity > 0;


-------------------------------------------------------------------------------------------
-- Select Statement indicating the quantity of products there are of each type 

SELECT ptype, count(ptype) as Quantity
from product
group by ptype;

select * from product
