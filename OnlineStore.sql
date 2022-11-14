--Database Schema 

--DROP SEQUENCE seqid;
CREATE SEQUENCE seqID INCREMENT BY 1 START WITH 1;

--drop table customer;
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

--drop table cart_Items;
CREATE TABLE cart_items(
    cartid int not null,
    productid int not null,
    psize varchar(20) check (psize IN ('x-small', 'small', 'medium', 'large', 'x-large', 'onesize')),
    pquantity int not null,
    primary key (cartid, productid),
    foreign key (cartid) references customer(accountid) ON DELETE CASCADE,
    foreign key (productid) references product(productid)
);

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

CREATE TABLE invoice_record_deleted_account(
    fname    varchar2(15) not null,
    lname    varchar2(15) not null,
    email	 varchar2(100) not null,
    invoiceid int not null
);

--customer accountid = 0 will be used to store a invoice history for deleted accounts 

INSERT into customer VALUES(0, 'invoice', 'history', 'n/a', NULL);

--drop trigger delete_product
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



