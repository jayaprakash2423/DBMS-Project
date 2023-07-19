
create database project;
use project;

-----------------------------#CREATINGTABLES:-------------------------------------
#1.MANAGER TABLE....

create table manager (
Manager_id int primary key,
Mfirst_name varchar(20),
Mmiddle_name varchar(20),
Mlast_name varchar(20),
Manager_Qualification varchar(20),
Manager_DOB date,
Gender varchar(15),
Location varchar(20),
city varchar(20),
State varchar(20)
);

create table Billing_details (
Billing_id int primary key,
Billing_date date,
Billing_amount int,
Manager_id int references manager(Manager_id)
);

create table manager_contact (
Manager_id int references manager(Manager_id),
Manager_contact int
);

create table supplyer (
Supplyer_id int primary key,
Supplyer_store_name varchar(20),
Supplyer_first_name varchar(20),
Supplyer_middle_name varchar(20),
Supplyer_last_name varchar(20),
Supplyer_location varchar(20),
city varchar(20),
State varchar(20),
Supplyer_Gender varchar(10)
);

create table Supplyer_contact (
Supplyer_id int references supplyer(Supplyer_id),
Supplyer_contact int
);




create table manager_supplyer (
Manager_id int references manager(Manager_id),
Supplyer_id int references supplyer(Supplyer_id)
);


create table products (
Product_id int primary key,
Product_name varchar(20),
Product_type varchar(20),
Product_cost varchar(20),
Product_discription varchar(20),
Supplyer_id int references supplyer(Supplyer_id)
);


create table store (
Store_id int primary key,
Store_name varchar(20),
Store_street_name varchar(20),
location varchar(20),
city varchar(20),
state varchar(20)
);

create table store_contact (
Store_id int references store(Store_id),
Store_contact_nummber int
);

create table Supplyer_store (
Supplyer_id int references supplyer(Supplyer_id),
Store_id int references store(Store_id)
);


create table workers 
(
Workers_id int primary key,
Workers_first_name varchar(20),
Workers_middle_name varchar(20),
Workers_last_name varchar(20),
Store_id int references store(Store_id),
Workers_type varchar(20),
Workers_salary int,
Workers_discription varchar(20)
);


create table workers_contact 
(
Workers_id int references workers(Workers_id),
Workers_contact int
);


create table customer 
(
Customer_id int primary key,
Customer_first_name varchar(20),
Customer_middle_name varchar(20),
Customer_last_name varchar(20),
Customer_street_name varchar(20),
location varchar(20),
city varchar(20),
state varchar(20),
Customer_gender varchar(10)
);

create table sales
(
Sales_id int primary key,
Product_id int references products(Product_id),
cost int ,
Sales_discription varchar(20),
Store_id int references store(Store_id),
Customer_id int references customer(Customer_id)
);


create table tax
(
Tax_id int primary key,
Tax_amount int ,
Tax_type varchar(20),
Sales_id int references sales(Sales_id)
);

create table customer_email
(
Customer_id int references customer(Customer_id),
email_id varchar(20)
);

create table customer_contact
(
Customer_id int references customer(Customer_id),
Customer_contact_number int 
);

create table payment
(
Payment_id int primary key ,
Customer_id int references customer(Customer_id) ,
Payment_date date ,
Payment_amount int ,
Payment_type varchar(20) ,
Payment_status varchar(20) 
);

insert into manager values(1,'kadiyala','jaya','prakash','PHD','2003-06-14','male','gannavaram','vijayawada','AP');
select*from manager;


insert into Billing_details values(21,'2022-11-27','56000',1);
insert into Billing_details values(22,'2005-04-27','100000',1);
insert into Billing_details values(23,'2000-12-11','56000',1);
insert into Billing_details values(24,'2011-02-01','4326000',1);
select*from Billing_details;

insert into manager_contact values(1,'90146447');

select*from manager_contact;

insert into supplyer values(1,'ravi_store','komminani','jagadeesh','chowdary','kasarapalli','vijayawada','AP','male');
insert into supplyer values(2,'jagu_store','komminani','ravi','teja','nidamaru','guntur','AP','male');
insert into supplyer values(3,'narayana_store','kadiyala','narayana','murthy','koragalu','vijayawada','AP','male');
insert into supplyer values(4,'chandu_store','komminani','chandra','shakar','kasarapalli','vijayawada','AP','male');
select*from supplyer;


insert into Supplyer_contact values(1,'123456789');
insert into Supplyer_contact values(2,'098765432');
insert into Supplyer_contact values(3,'756484657');
insert into Supplyer_contact values(4,'999999999');
select*from Supplyer_contact;

insert into manager_supplyer values(1,1);
select *from manager_supplyer;
insert into manager_supplyer values(1,4);
insert into manager_supplyer values(4,3);
insert into manager_supplyer values(22,7);


insert into products values(101,'santoor','soap','100','itwillcleanourbody',1);
insert into products values(102,'samsunggalaxyA21S','mobile','15000','used to talk',2);
insert into products values(103,'colgate','paste','80','usedto clean teeth',3);
insert into products values(104,'crocks','footwear','1500','protect our foot',4);
select*from products;

insert into store values(1,'jaya_store','royalstreet','gannavaram','vijayawada','AP');
insert into store values(2,'chandu_store','shoppingstreet','mangalagiri','gunture','AP');
insert into store values(3,'srujana_store','cinemastreet','jalandhar','patiala','punjab');
insert into store values(4,'nithin_store','changestreet','ludhiana','bathinda','bihar');

select * from store;

insert into store_contact values(1,'878799098');
insert into store_contact values(2,'656567743');
insert into store_contact values(3,'949083829');
insert into store_contact values(4,'888776654');

select * from store_contact;

insert into Supplyer_store values(1,1001);
insert into Supplyer_store values(2,1002);
insert into Supplyer_store values(4,203);
insert into Supplyer_store values (3,303);

select*from Supplyer_store;

insert into workers values(10,'nikith','sai','reddy',1,'phone_display','20000','whoexplainsphones');
insert into workers values(11,'mahamad','ashmi','irfan',2,'cashier','50000','whocollectscash');
insert into workers values(12,'boddu','lakshmi','sndeep',3,'cleaner','5000','whocleansfloor');
insert into workers values(13,'sai','vishnu','vrdhan',4,'securitygard','10000','protectfromthieves');

select * from workers;

insert into workers_contact values(10,'849384848');
insert into workers_contact values(11,'545454544');
insert into workers_contact values(12,'500004544');
insert into workers_contact values(13,'545212124');

select * from workers_contact;

insert into customer values(1,'shaik','azaj','uddin','marketstreet','mangalagiri','gunture','AP','male');
insert into customer values(2,'mahesh','kumar','reddy','golastreet','jagadiriguta','hydrabad','telangana','male');
insert into customer values(3,'valabanani','srujana','sri','katuru','govindrapata','kammam','telangana','female');
insert into customer values(4,'puttaparti','sai','venkat','chittoor','palamneru','hanumukonda','gujarath','male');

select * from customer;

insert into sales values(110,101,'500','good',2,1);
insert into sales values(111,103,'4000','best',4,2);
insert into sales values(112,102,'1000','average',3,3);
insert into sales values(113,103,'6000','good',1,4);

select * from sales;

insert into tax values(1000,'250','retailtax',110);
insert into tax values(1001,'840','wholesaletax',111);
insert into tax values(1002,'110','valueaddedtax',112);
insert into tax values(1003,'504','manufacturerstax',113);

select*from tax;

insert into customer_email values(1,'jaya11@gmail.com');
insert into customer_email values(2,'sai@gmail.com');
insert into customer_email values(3,'venkat@gmail.com');
insert into customer_email values(4,'prakash@gmail.com');

select* from customer_email;


insert into customer_contact values(1,'909090909');
insert into customer_contact values(2,'666666666');
insert into customer_contact values(3,'888888888');
insert into customer_contact values(4,'111111111');

select*from customer_contact ;


insert into payment values(100001,2,'2022-11-20','10000','cardpayment','success');
insert into payment values(100002,1,'2022-10-11','5000','onlinepayment','success');
insert into payment values(100003,3,'2022-09-23','2000','cashpayment','success');
insert into payment values(100004,4,'2022-11-27','5000','onlinepayment','success');

select * from payment;



-------------------------------------------------------------------------#QUERIES-----------------------------------------------------

select all Product_name
from products
where Product_type ='soap';


select all Product_name
from products
where Product_type ='mobile';

select customer.Customer_middle_name
from customer,sales
where
sales.Customer_id=customer.Customer_id;



select customer.Customer_middle_name
from customer,sales
where
sales.Customer_id=customer.Customer_id and 
State='telangana';

select Product_name, max(Product_cost)
from products;


select Product_name, min(Product_cost)
from products;


select Product_name,Customer_middle_name,Product_cost
from products,customer;


select Sales_discription,Product_name,Customer_middle_name,Product_cost
from sales,products,customer
where sales.Product_id=products.Product_id and
sales.Customer_id=customer.Customer_id;



select Sales_discription,Product_name,Customer_middle_name,Product_cost
from sales,products,customer;



