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

-------------------------------------------------------------------------------------------
-- FILTER BY PTYPE

--list all product types 

SELECT distinct ptype as ProductType from product;


-- Select Statement indicating the quantity of products there are of each type 

SELECT ptype, count(ptype) as Quantity
from product
group by ptype;

-- user can filter by category 

select pname as Name, price as Price, pquantity as Quantity from product where ptype = 'tops';

-------------------------------------------------------------------------------------------

--RECEIVE SHIPMENT (increase the quantities of products) 
