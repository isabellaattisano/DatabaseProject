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
    foreign key (accountid) references customer(accountid)
);

--drop table payment;
CREATE TABLE payment (
    accountid int not null,
    expMonth int not null,
    expYear int not null,
    cardnumber varchar2(16),
    securitycode varchar2(4),
    primary key (cardnumber, accountid),
    foreign key (accountid) references customer(accountid)
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
    pquanity int not null,
    primary key (cartid, productid),
    foreign key (cartid) references customer(accountid),
    foreign key (productid) references product(productid)
);

--drop table favorties 
CREATE TABLE favorites(
);

--drop table reviews
CREATE TABLE reviews(
    foreign key (productid) references invoice(invoiceid),
    cartid int not null,
    productid int not null,
    psize varchar(20) check (psize IN ('x-small', 'small', 'medium', 'large', 'x-large', 'onesize')),
    pquanity int not null,
    primary key (cartid, productid),
    foreign key (cartid) references customer(accountid),
    foreign key (productid) references product(productid)
);


--drop view cart_view;
CREATE View cart_view (cartid, totalprice) as 
SELECT ci.cartid, sum(p.price*ci.pquanity)
from product p NATURAL JOIN cart_items ci
GROUP BY ci.cartid;

