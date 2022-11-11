--CREATE PRODUCTS 
INSERT into product VALUES(seqProduct.nextVal, 'Square Neck Blouse', 'tops', 19.95);
INSERT into product VALUES(seqproduct.nextVal, 'Oversized Sweater', 'tops', 49.95);
INSERT into product VALUES(seqproduct.nextVal, 'High-Waisted Pants', 'bottoms', 49.95);
INSERT into product VALUES(seqproduct.nextVal, 'Plaid Mini Skirt', 'bottoms', 25.00);
INSERT into product VALUES(seqproduct.nextVal, 'Jacket', 'outerwear', 49.95);
INSERT into product VALUES(seqproduct.nextVal, '4pck Scrunchies', 'accessories', 14.95);

-------------------------------------------------------------------------------------------

--CREATE CUSTOMER ACCOUNT

INSERT into customer VALUES(seqID.nextVal, 'customer', 'one', 'customerone@gmail.com', '0123456789');
INSERT into customer VALUES(seqID.nextVal, 'customer', 'two', 'customertwo@gmail.com', '0123456789');

-------------------------------------------------------------------------------------------

--ADD ITEMS TO CART

INSERT into cart_items VALUES(1, 1, 'small', 1);
INSERT into cart_items VALUES(1, 2, 'large', 2);
INSERT into cart_items VALUES(2, 3, 'medium', 3);
INSERT into cart_items VALUES(2, 6, 'onesize', 4);

select * from cart_items; 

-------------------------------------------------------------------------------------------
-- VIEW CART

select cv.cartid, cv.totalprice, ci.productid from cart_view cv JOIN cart_items ci on cv.cartid = ci.cartid;


