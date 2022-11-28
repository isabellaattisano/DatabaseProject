--Database Schema 
--DROP SEQUENCE seqid;
CREATE SEQUENCE seqID INCREMENT BY 1 START WITH 1;

--drop table customer
CREATE TABLE customer (
    accountid   int not null,
    fname    varchar2(15) not null,
    lname    varchar2(15) not null,
    email	 varchar2(100) not null,
    phone    varchar2(10),
    primary key (accountid)
);

--drop table address;
CREATE TABLE address (
    accountid int not null,
    Street	Char(50) NOT NULL,
	city	Char(50) NOT NULL,
	state	Char(2)	 NOT NULL,
	zip	    Char(10) NOT NULL,
    primary key (street, accountid),
    foreign key (accountid) references customer(accountid) ON DELETE CASCADE
);

--drop table payment;
CREATE TABLE payment (
    accountid int not null,
    expMonth int not null,
    expYear int not null,
    cardnumber varchar2(16),
    securitycode varchar2(4),
    primary key (cardnumber, accountid),
    foreign key (accountid) references customer(accountid) ON DELETE CASCADE
);

--DROP SEQUENCE seqInvoice;
CREATE SEQUENCE seqInvoice INCREMENT BY 1 START WITH 1;

--drop table invoice;
CREATE TABLE invoice(
    invoiceid int not null,
    accountid int not null,
    totalprice DECIMAL(10,2),
    primary key (invoiceid),
    foreign key (accountid) references customer(accountid)
);

--drop table invoice_products;
CREATE TABLE invoice_products(
    invoiceid int not null,
    productid int not null,
    psize varchar(20) check (psize IN ('x-small', 'small', 'medium', 'large', 'x-large', 'onesize')),
    pquanity int not null,
    primary key (invoiceid, productid),
    foreign key (invoiceid) references invoice(invoiceid)
);

--drop sequence seqProduct;
CREATE SEQUENCE seqProduct INCREMENT BY 1 START WITH 1;

--drop table product;
CREATE TABLE product(
    productid int not null,
    pname varchar2(50) not null,
    ptype varchar2(20) check (ptype IN ('tops', 'bottoms', 'outerwear', 'dresses', 
    'accessories', 'candles', 'phone cases', 'board games', 'mugs', 'posters')),
    price DECIMAL(10,2),
    pquantity int check (pquantity >= 0),
    primary key(productid)
);

ALTER TABLE invoice_products 
ADD CONSTRAINT fk_invoice foreign key (productid) references product(productid);

CREATE SEQUENCE seqCart INCREMENT
--drop table cart
CREATE TABLE cart(
    cartid int not null,
    primary key (cartid),
    foreign key (cartid) references customer(accountid) ON DELETE CASCADE
);

--drop table cart_Items;
CREATE TABLE cart_items(
    cartid int not null,
    productid int not null,
    psize varchar(20) check (psize IN ('x-small', 'small', 'medium', 'large', 'x-large', 'onesize')),
    pquantity int not null,
    price DECIMAL(10,2), 
    primary key (cartid, productid),
    foreign key (cartid) references customer(accountID) ON DELETE CASCADE,
    foreign key (productid) references product(productid)
);


--drop table reviews
CREATE TABLE reviews(
    foreign key (productid) references invoice(invoiceid),
    
    id int not null,
    productid int not null,
    psize varchar(20) check (psize IN ('x-small', 'small', 'medium', 'large', 'x-large', 'onesize')),
    pquanity int not null,
    primary key (cartid, productid),
    foreign key (cartid) references customer(accountid),
    foreign key (productid) references product(productid)
);
--drop table favorties 
CREATE TABLE favorites(
    accountid int not null,
    productid int not null,
    primary key (accountid, productid),
    foreign key (accountid) references customer(accountid) ON DELETE CASCADE,
    foreign key (productid) references product(productid)
);
--drop table recently_deleted_items;
CREATE TABLE recently_deleted_items(
    accountid int not null,
    productid int not null,
    psize varchar(20) check (psize IN ('x-small', 'small', 'medium', 'large', 'x-large', 'onesize')),
    pquantity int not null,
    primary key (accountid, productid),
    foreign key (accountid) references customer(accountid) ON DELETE CASCADE,
    foreign key (productid) references product(productid)
);

--drop view cart_view;
CREATE View cart_view (cartid, totalprice) as 
SELECT ci.cartid, sum(p.price*ci.pquanity)
from product p NATURAL JOIN cart_items ci
GROUP BY ci.cartid;


-------------------------------------------------------------------------------------------

-- TRIGGERS --
--drop trigger delete_product
create or replace trigger delete_product
before delete on cart_items
for each row 
begin 
insert into recently_deleted_items(accountid, productid, psize, pquantity) 
values(:old.cartid, :old.productid, :old.psize, :old.pquantity);

end;

drop trigger 

--drop table invoice_record_deleted_account;
CREATE TABLE invoice_record_deleted_account(
    fname    varchar2(15) not null,
    lname    varchar2(15) not null,
    email	 varchar2(100) not null,
    invoiceid int not null
);

--customer accountid = 0 will be used to store a invoice history for deleted accounts 

INSERT into customer VALUES(0, 'invoice', 'history', 'n/a', NULL);

--drop trigger delete_account;
create or replace trigger delete_account
before delete on customer
for each row 
begin 
    for o in (select invoiceid, accountid from invoice where accountid = :old.accountid)
    Loop
       insert into invoice_record_deleted_account
       values(:old.fname, :old.lname, :old.email, o.invoiceid);
       
       UPDATE invoice set accountid = 0 where accountid = :old.accountid;
     
    end loop;
end;

--SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'customer';


--drop sequence seqInvoice;
create SEQUENCE seqInvoice INCREMENT BY 1 START WITH 1;

--create invoice trigger
--create or replace trigger create_invoice
--before delete on cart_items
--FOR EACH ROW
--BEGIN
  --  for o in (select cartid, price from cart_items where cartid = :old.cartid)
    --Loop
      -- insert into invoice
       --values(seqInvoice.NEXTVAL, :old.cartid, :old.price);

    --end loop;
--END;

--create view for invoice 

--

--Create trigger to create cart when account it created 
--drop trigger create_cart
CREATE or REPLACE TRIGGER create_cart
AFTER INSERT ON customer
FOR EACH ROW
BEGIN 
insert into cart(cartid) values(:new.accountid);
END;

--Create trigger to delete cart when account is deleted!!

--Create trigger than before cart deleted, you get cartid and then loop through items and add to invoice history
        
create or replace trigger create_invoice
after update on cart
FOR EACH ROW
BEGIN
    insert into invoice(invoiceid, accountid, totalprice) values(seqInvoice.NEXTVAL, :old.cartid, 0.00);
    for o in (select * from cart_items c where cartid = :old.cartid)
    Loop
        insert into invoice_products values (seqInvoice.currval, o.productid, o.psize, o.pquantity);
        update invoice set totalprice = totalprice + o.price where o.cartid = :old.cartid;
        update product set squantity = squantity - o.pquantity where productid = o.productid;
    end loop;
    delete from cart_items where cartid = :old.cartid;
END;

select * from invoice_products

--drop trigger create_invoice
--create view for invoice 
select * from cart_items

--
    