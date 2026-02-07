
-- customer

select * from oc_customer order by customer_id desc limit 3;
insert into oc_customer (customer_group_id,store_id,language_id,firstname,lastname,email,telephone,password,status,date_added)
values (1,0,1,concat('fn_',@ts),concat('ln_',@ts),concat(@mk,'@mail.com'),'0100',sha1('pw'),1,now());
set @cid := last_insert_id();
update oc_customer set telephone='0111' where customer_id=@cid;
delete from oc_customer where customer_id=@cid;


-- group

select * from oc_customer_group order by customer_group_id desc limit 3;
insert into oc_customer_group (approval,sort_order) values (0,0);
set @cg := last_insert_id();
update oc_customer_group set sort_order=1 where customer_group_id=@cg;
delete from oc_customer_group where customer_group_id=@cg;


--  description

select * from oc_customer_group_description where customer_group_id=@cg;
insert into oc_customer_group_description (customer_group_id,language_id,name,description)
values (@cg,1,'basic group','desc');
update oc_customer_group_description set name='basic updated' where customer_group_id=@cg;
delete from oc_customer_group_description where customer_group_id=@cg;


-- login

select * from oc_customer_login order by customer_login_id desc limit 3;
insert into oc_customer_login (email,ip,total,date_added)
values (concat(@mk,'@mail.com'),'127.0.0.1',1,now());
set @lg := last_insert_id();
update oc_customer_login set total=2 where customer_login_id=@lg;
delete from oc_customer_login where customer_login_id=@lg;


-- history

select * from oc_customer_history where customer_id=@cid limit 3;
insert into oc_customer_history (customer_id,comment,date_added)
values (@cid,'test history',now());
update oc_customer_history set comment='updated history' where customer_id=@cid;
delete from oc_customer_history where customer_id=@cid;


--  token

select * from oc_customer_token where customer_id=@cid;
insert into oc_customer_token (customer_id,code,date_added,type)
values (@cid,concat(@mk,'tok'),now(),'login');
update oc_customer_token set type='reset' where customer_id=@cid;
delete from oc_customer_token where customer_id=@cid;


-- online

select * from oc_customer_online order by ip limit 3;
insert into oc_customer_online (ip,customer_id,url,date_added)
values ('127.0.0.1',@cid,'/',now());
update oc_customer_online set url='/updated' where ip='127.0.0.1';
delete from oc_customer_online where ip='127.0.0.1';


-- ip

select * from oc_customer_ip where customer_id=@cid;
insert into oc_customer_ip (customer_id,ip,date_added,country,store_id)
values (@cid,'192.0.2.55',now(),'EG',0);
update oc_customer_ip set country='US' where customer_id=@cid;
delete from oc_customer_ip where customer_id=@cid;


--  reward

select * from oc_customer_reward where customer_id=@cid;
insert into oc_customer_reward (customer_id,order_id,points,description,date_added)
values (@cid,0,10,'reward',now());
update oc_customer_reward set points=20 where customer_id=@cid;
delete from oc_customer_reward where customer_id=@cid;


--  wishlist

select * from oc_customer_wishlist where customer_id=@cid;
insert into oc_customer_wishlist (customer_id,product_id,store_id,date_added)
values (@cid,0,0,now());
update oc_customer_wishlist set product_id=1 where customer_id=@cid;
delete from oc_customer_wishlist where customer_id=@cid;


-- approval

select * from oc_customer_approval where customer_id=@cid;
insert into oc_customer_approval (customer_id,type,date_added)
values (@cid,'customer',now());
update oc_customer_approval set type='affiliate' where customer_id=@cid;
delete from oc_customer_approval where customer_id=@cid;


-- activity

select * from oc_customer_activity where customer_id=@cid;
insert into oc_customer_activity (customer_id,data,ip,date_added)
values (@cid,'act','127.0.0.1',now());
update oc_customer_activity set data='updated' where customer_id=@cid;
delete from oc_customer_activity where customer_id=@cid;


-- transaction

select * from oc_customer_transaction where customer_id=@cid;
insert into oc_customer_transaction (customer_id,order_id,description,amount,date_added)
values (@cid,0,'trx',100,now());
update oc_customer_transaction set amount=200 where customer_id=@cid;
delete from oc_customer_transaction where customer_id=@cid;


-- affiliate

select * from oc_customer_affiliate where customer_id=@cid;
insert into oc_customer_affiliate (customer_id,tracking,commission,status,date_added)
values (@cid,'trk',1,1,now());
update oc_customer_affiliate set commission=2 where customer_id=@cid;
delete from oc_customer_affiliate where customer_id=@cid;


-- affiliate_report

select * from oc_customer_affiliate_report where customer_id=@cid;
insert into oc_customer_affiliate_report (customer_id,date_added,ip,store_id)
values (@cid,now(),'127.0.0.1',0);
update oc_customer_affiliate_report set store_id=1 where customer_id=@cid;
delete from oc_customer_affiliate_report where customer_id=@cid;


-- authorize

select * from oc_customer_authorize where customer_id=@cid;
insert into oc_customer_authorize (customer_id,date_added,ip,status)
values (@cid,now(),'127.0.0.1',1);
update oc_customer_authorize set status=0 where customer_id=@cid;
delete from oc_customer_authorize where customer_id=@cid;


-- search

select * from oc_customer_search where customer_id=@cid;
insert into oc_customer_search (customer_id,keyword,date_added,language_id)
values (@cid,'test',now(),1);
update oc_customer_search set keyword='updated' where customer_id=@cid;
delete from oc_customer_search where customer_id=@cid;


-- email

select * from oc_customer_email where email like concat(@mk,'%');
insert into oc_customer_email (email,code,status,date_added)
values (concat(@mk,'@mail.com'),'code',0,now());
update oc_customer_email set status=1 where email like concat(@mk,'%');
delete from oc_customer_email where email like concat(@mk,'%');


-- address

select * from oc_address where customer_id=@cid;
insert into oc_address (customer_id,firstname,lastname,address_1,city,postcode,country_id,zone_id,`default`)
values (@cid,'fn','ln','street','city','00000',0,0,0);
update oc_address set city='newcity' where customer_id=@cid;
delete from oc_address where customer_id=@cid;


--  format

select * from oc_address_format where name like concat('af_',@mk,'%');
insert into oc_address_format (name,address_format)
values (concat('af_',@mk),'fmt');
update oc_address_format set address_format='fmt2' where name like concat('af_',@mk,'%');
delete from oc_address_format where name like concat('af_',@mk,'%');


-- gdpr

select * from oc_gdpr where customer_id=@cid;
insert into oc_gdpr (customer_id,request_type,data,status,date_added)
values (@cid,'req','gdpr',0,now());
update oc_gdpr set status=1 where customer_id=@cid;
delete from oc_gdpr where customer_id=@cid;


--  field

select * from oc_custom_field order by custom_field_id desc limit 3;
insert into oc_custom_field (type,value,location,status,sort_order)
values ('text','v','acc',1,0);
set @cf := last_insert_id();
update oc_custom_field set value='vv' where custom_field_id=@cf;
delete from oc_custom_field where custom_field_id=@cf;


--  field description

select * from oc_custom_field_description where custom_field_id=@cf;
insert into oc_custom_field_description (custom_field_id,language_id,name)
values (@cf,1,'cfd');
update oc_custom_field_description set name='cfd2' where custom_field_id=@cf;
delete from oc_custom_field_description where custom_field_id=@cf;


-- field value

select * from oc_custom_field_value where custom_field_id=@cf;
insert into oc_custom_field_value (custom_field_id,sort_order,value)
values (@cf,0,'v');
set @cfv := last_insert_id();
update oc_custom_field_value set value='v2' where custom_field_value_id=@cfv;
delete from oc_custom_field_value where custom_field_value_id=@cfv;


--  value description

select * from oc_custom_field_value_description where custom_field_value_id=@cfv;
insert into oc_custom_field_value_description (custom_field_value_id,language_id,name)
values (@cfv,1,'cfvd');
update oc_custom_field_value_description set name='cfvd2' where custom_field_value_id=@cfv;
delete from oc_custom_field_value_description where custom_field_value_id=@cfv;


-- customer group

select * from oc_custom_field_customer_group where custom_field_id=@cf;
insert into oc_custom_field_customer_group (custom_field_id,customer_group_id,required)
values (@cf,1,0);
update oc_custom_field_customer_group set required=1 where custom_field_id=@cf;
delete from oc_custom_field_customer_group where custom_field_id=@cf;

 SELECT status FROM oc_country WHERE iso_code_2 = 'US';
 INSERT INTO oc_country (name, iso_code_2, iso_code_3, postcode_required, status) VALUES ('Test Country', 'TC', 'TCO', 1, 0);
 UPDATE oc_country SET status = 1 WHERE iso_code_2 = 'TC';
 SELECT COUNT(*) FROM oc_zone WHERE country_id = 222;
 INSERT INTO oc_zone (country_id, name, code, status) VALUES (222, 'Test Zone', 'TZ', 1);
 SELECT * FROM oc_geo_zone ORDER BY name;
 SELECT * FROM oc_geo_zone_to_zone WHERE geo_zone_id = 5;
 UPDATE oc_geo_zone_to_zone SET zone_id = 0 WHERE geo_zone_zone_id = 1;
 SELECT rate FROM oc_tax_rate WHERE tax_rate_id = 1;
 SELECT description FROM oc_tax_class WHERE tax_class_id = 9;
UPDATE oc_tax_class SET title = 'VAT 20%' WHERE tax_class_id = 9;
 SELECT value FROM oc_setting WHERE `key` = 'config_store_id';
 SELECT COUNT(*) FROM oc_order WHERE order_status_id = 1;
 UPDATE oc_order SET order_status_id = 2 WHERE order_id = 1;
 SELECT quantity FROM oc_product WHERE product_id = 30;
 UPDATE oc_product SET price = 150.0000 WHERE product_id = 30;
 SELECT COUNT(*) FROM oc_country WHERE iso_code_2 = 'XX';
 INSERT INTO oc_country (name, iso_code_3, postcode_required, status) VALUES ('Invalid Country', 'INV', 0, 0);
 INSERT INTO oc_zone (name, code, status) VALUES ('Invalid Zone', 'INV', 0, 0);
 SELECT COUNT(name) FROM oc_zone WHERE country_id = 222 GROUP BY name HAVING COUNT(name) > 1;
 SELECT decimal_place FROM oc_currency WHERE code = 'USD';
 UPDATE oc_geo_zone SET name = 'European Union Tax Area' WHERE geo_zone_id = 1;
 SELECT COUNT(*) FROM oc_tax_rate WHERE type NOT IN ('P', 'F');
 SELECT COUNT(*) FROM oc_tax_rate_to_customer_group WHERE tax_rate_id = 1 AND customer_group_id = 1;
 SELECT image FROM oc_language WHERE `code` = 'en';
 
 
 

-- PRODUCT TABLE QUERIES


SELECT * FROM oc_product WHERE product_id = 145;

SELECT product_id, model, quantity, price 
FROM oc_product;

SELECT * FROM oc_product 
WHERE length < 0 OR width < 0 OR height < 0;


-- PRODUCT DESCRIPTION


SELECT * FROM oc_product_description;

SELECT * FROM oc_product_description 
WHERE product_id = 3;


-- PRODUCT SPECIAL


-- Valid insert
INSERT INTO oc_product_special 
(product_id, customer_group_id, priority, price, date_start, date_end) 
VALUES 
(1, 1, 1, 50, '2025-01-01', '2025-12-31');

-- Delete by ID
DELETE FROM oc_product_special 
WHERE product_special_id = 1;

-- Invalid insert: product_id does not exist
INSERT INTO oc_product_special 
(product_id, customer_group_id, priority, price, date_start, date_end) 
VALUES 
(9999, 1, 1, 29.99, '2025-01-01', '2025-12-31');


-- PRODUCT TO CATEGORY


-- Valid
INSERT INTO oc_product_to_category (product_id, category_id) 
VALUES (1, 5);

-- Invalid: product does not exist
INSERT INTO oc_product_to_category (product_id, category_id) 
VALUES (9999, 5);

-- Invalid: category does not exist
INSERT INTO oc_product_to_category (product_id, category_id) 
VALUES (1, 9999);

-- Delete existing relationship
DELETE FROM oc_product_to_category 
WHERE product_id = 1 AND category_id = 5;

-- Invalid: null product_id
INSERT INTO oc_product_to_category VALUES (NULL, 5);

-- Invalid: null category_id
INSERT INTO oc_product_to_category VALUES (1, NULL);


-- PRODUCT TO STORE


INSERT INTO oc_product_to_store (product_id, store_id) 
VALUES (1, 0);

DELETE FROM oc_product_to_store 
WHERE product_id = 1 AND store_id = 0;


-- PRODUCT REPORT


-- Valid insert (date format corrected)
INSERT INTO oc_product_report 
(product_id, store_id, ip, country, date_added) 
VALUES 
(1, 0, '192.168.1.1', 'US', '2005-12-12');

-- Invalid insert: product does not exist
INSERT INTO oc_product_report 
(product_id, store_id, ip, country, date_added) 
VALUES 
(9999, 0, '192.168.1.1', 'US', '2005-12-12');

-- Delete report
DELETE FROM oc_product_report 
WHERE product_report_id = 1;




-- PRODUCT TABLE QUERIES


SELECT * FROM oc_product WHERE product_id = 145;

SELECT product_id, model, quantity, price 
FROM oc_product;

SELECT * FROM oc_product 
WHERE length < 0 OR width < 0 OR height < 0;


-- PRODUCT DESCRIPTION


SELECT * FROM oc_product_description;

SELECT * FROM oc_product_description 
WHERE product_id = 3;


-- PRODUCT SPECIAL


-- Valid insert
INSERT INTO oc_product_special 
(product_id, customer_group_id, priority, price, date_start, date_end) 
VALUES 
(1, 1, 1, 50, '2025-01-01', '2025-12-31');

-- Delete by ID
DELETE FROM oc_product_special 
WHERE product_special_id = 1;

-- Invalid insert: product_id does not exist
INSERT INTO oc_product_special 
(product_id, customer_group_id, priority, price, date_start, date_end) 
VALUES 
(9999, 1, 1, 29.99, '2025-01-01', '2025-12-31');


-- PRODUCT TO CATEGORY


-- Valid
INSERT INTO oc_product_to_category (product_id, category_id) 
VALUES (1, 5);

-- Invalid: product does not exist
INSERT INTO oc_product_to_category (product_id, category_id) 
VALUES (9999, 5);

-- Invalid: category does not exist
INSERT INTO oc_product_to_category (product_id, category_id) 
VALUES (1, 9999);

-- Delete existing relationship
DELETE FROM oc_product_to_category 
WHERE product_id = 1 AND category_id = 5;

-- Invalid: null product_id
INSERT INTO oc_product_to_category VALUES (NULL, 5);

-- Invalid: null category_id
INSERT INTO oc_product_to_category VALUES (1, NULL);


-- PRODUCT TO STORE


INSERT INTO oc_product_to_store (product_id, store_id) 
VALUES (1, 0);

DELETE FROM oc_product_to_store 
WHERE product_id = 1 AND store_id = 0;


-- PRODUCT REPORT


-- Valid insert (date format corrected)
INSERT INTO oc_product_report 
(product_id, store_id, ip, country, date_added) 
VALUES 
(1, 0, '192.168.1.1', 'US', '2005-12-12');

-- Invalid insert: product does not exist
INSERT INTO oc_product_report 
(product_id, store_id, ip, country, date_added) 
VALUES 
(9999, 0, '192.168.1.1', 'US', '2005-12-12');

-- Delete report
DELETE FROM oc_product_report 
WHERE product_report_id = 1;







-- Starter Vars
set @ts := unix_timestamp();
set @mk := concat('qa_',@ts);

--  oc_order

select * from oc_order order by order_id desc limit 3;
insert into oc_order (invoice_prefix, store_id, customer_id, firstname, lastname, email, telephone, payment_method, total, order_status_id, date_added)
values ('INV-',0,1,'ahmed','tester',concat(@mk,'@mail.com'),'0100','Cash on Delivery',100,1,now());
set @oid := last_insert_id();
update oc_order set total=150 where order_id=@oid;
delete from oc_order where order_id=@oid;

-- oc_order_product

select * from oc_order_product where order_id=@oid limit 3;
insert into oc_order_product (order_id, product_id, name, model, quantity, price, total)
values (@oid,1,'Test Product','TP01',2,50,100);
set @opid := last_insert_id();
update oc_order_product set quantity=3 where order_product_id=@opid;
delete from oc_order_product where order_product_id=@opid;

--  oc_order_option

select * from oc_order_option where order_id=@oid;
insert into oc_order_option (order_id, order_product_id, product_option_id, name, value, type)
values (@oid,@opid,1,'Color','Red','select');
set @ooid := last_insert_id();
update oc_order_option set value='Blue' where order_option_id=@ooid;
delete from oc_order_option where order_option_id=@ooid;

-- oc_order_total

select * from oc_order_total where order_id=@oid;
insert into oc_order_total (order_id, code, title, value, sort_order)
values (@oid,'total','Order Total',150,1);
set @otid := last_insert_id();
update oc_order_total set value=200 where order_total_id=@otid;
delete from oc_order_total where order_total_id=@otid;

-- oc_order_status

select * from oc_order_status order by order_status_id desc limit 3;
insert into oc_order_status (language_id, name) values (1,'Pending');
set @osid := last_insert_id();
update oc_order_status set name='Completed' where order_status_id=@osid;
delete from oc_order_status where order_status_id=@osid;

--  oc_order_history

select * from oc_order_history where order_id=@oid;
insert into oc_order_history (order_id, order_status_id, notify, comment, date_added)
values (@oid,@osid,1,'Order Created',now());
set @ohid := last_insert_id();
update oc_order_history set comment='Order Updated' where order_history_id=@ohid;
delete from oc_order_history where order_history_id=@ohid;

--  oc_return

select * from oc_return order by return_id desc limit 3;
insert into oc_return (order_id, product_id, customer_id, firstname, lastname, email, telephone, product, model, quantity, opened, reason, date_ordered, date_added)
values (@oid,1,1,'ahmed','tester',concat(@mk,'@mail.com'),'0100','Test Product','TP01',1,0,'Damaged',now(),now());
set @rid := last_insert_id();
update oc_return set reason='Wrong item' where return_id=@rid;
delete from oc_return where return_id=@rid;

--  oc_return_reason

select * from oc_return_reason where return_reason_id>0 limit 3;
insert into oc_return_reason (language_id, name) values (1,'Damaged item');
set @rrid := last_insert_id();
update oc_return_reason set name='Wrong size' where return_reason_id=@rrid;
delete from oc_return_reason where return_reason_id=@rrid;

-- oc_return_status

select * from oc_return_status order by return_status_id desc limit 3;
insert into oc_return_status (language_id, name) values (1,'Pending');
set @rsid := last_insert_id();
update oc_return_status set name='Processed' where return_status_id=@rsid;
delete from oc_return_status where return_status_id=@rsid;

--  oc_return_history

select * from oc_return_history where return_id=@rid;
insert into oc_return_history (return_id, return_status_id, notify, comment, date_added)
values (@rid,@rsid,1,'Return created',now());
set @rhid := last_insert_id();
update oc_return_history set comment='Return updated' where return_history_id=@rhid;
delete from oc_return_history where return_history_id=@rhid;

-- oc_cart

select * from oc_cart order by cart_id desc limit 3;
insert into oc_cart (api_id, customer_id, session_id, product_id, name, quantity, date_added)
values (0,1,concat('sess_',@ts),1,'Cart Product',2,now());
set @cartid := last_insert_id();
update oc_cart set quantity=3 where cart_id=@cartid;
delete from oc_cart where cart_id=@cartid;

--  oc_payment

select * from oc_payment order by payment_id desc limit 3;
insert into oc_payment (order_id, method, amount, status, date_added)
values (@oid,'Cash on Delivery',150,1,now());
set @payid := last_insert_id();
update oc_payment set status=0 where payment_id=@payid;
delete from oc_payment where payment_id=@payid;

--  oc_shipping

select * from oc_shipping order by shipping_id desc limit 3;
insert into oc_shipping (order_id, method, cost, status, date_added)
values (@oid,'Flat Rate',25,1,now());
set @shipid := last_insert_id();
update oc_shipping set cost=30 where shipping_id=@shipid;
delete from oc_shipping where shipping_id=@shipid;

--  oc_subscription

select * from oc_subscription order by subscription_id desc limit 3;
insert into oc_subscription (customer_id, order_id, status_id, date_added)
values (1,@oid,1,now());
set @sid := last_insert_id();
update oc_subscription set status_id=2 where subscription_id=@sid;
delete from oc_subscription where subscription_id=@sid;

--  oc_subscription_history

select * from oc_subscription_history where subscription_id=@sid;
insert into oc_subscription_history (subscription_id, subscription_status_id, comment, date_added)
values (@sid,1,'Initial activation',now());
set @shid := last_insert_id();
update oc_subscription_history set comment='Paused temporarily' where subscription_history_id=@shid;
delete from oc_subscription_history where subscription_history_id=@shid;

-- oc_subscription_plan

select * from oc_subscription_plan order by subscription_plan_id desc limit 3;
insert into oc_subscription_plan (price, frequency, duration, status, sort_order)
values (99.99,'month',12,1,0);
set @spid := last_insert_id();
update oc_subscription_plan set duration=6 where subscription_plan_id=@spid;
delete from oc_subscription_plan where subscription_plan_id=@spid;

-- oc_subscription_plan_description

select * from oc_subscription_plan_description where subscription_plan_id=@spid;
insert into oc_subscription_plan_description (subscription_plan_id, language_id, name, description)
values (@spid,1,'Basic Monthly Plan','1 month access plan');
update oc_subscription_plan_description set name='Updated Plan' where subscription_plan_id=@spid;
delete from oc_subscription_plan_description where subscription_plan_id=@spid;

--  oc_subscription_status

select * from oc_subscription_status order by subscription_status_id desc limit 3;
insert into oc_subscription_status (language_id, name)
values (1,'Active');
set @ssid := last_insert_id();
update oc_subscription_status set name='Paused' where subscription_status_id=@ssid;
delete from oc_subscription_status where subscription_status_id=@ssid;

-- Test Case TC_001: Verify oc_user table integrity
SELECT * FROM oc_user LIMIT 10;

-- Test Case TC_002: Verify oc_user_login table integrity
SELECT * FROM oc_user_login LIMIT 10;

-- Test Case TC_003: Verify oc_user_group table integrity
SELECT * FROM oc_user_group LIMIT 10;

-- Test Case TC_004: Verify oc_user_authorize table integrity
SELECT * FROM oc_user_authorize LIMIT 10;

-- Test Case TC_005: Verify oc_user_token table integrity
SELECT * FROM oc_user_token LIMIT 10;

-- Test Case TC_006: Verify oc_api table integrity
SELECT * FROM oc_api LIMIT 10;

-- Test Case TC_007: Verify oc_api_ip table integrity
SELECT * FROM oc_api_ip LIMIT 10;

-- Test Case TC_008: Verify oc_api_history table integrity
SELECT * FROM oc_api_history LIMIT 10;

-- Test Case TC_009: Verify oc_event table integrity
SELECT * FROM oc_event LIMIT 10;

-- Test Case TC_010: Verify oc_extension table integrity
SELECT * FROM oc_extension LIMIT 10;

-- Test Case TC_011: Verify oc_extension_install table integrity
SELECT * FROM oc_extension_install LIMIT 10;

-- Test Case TC_012: Verify oc_extension_path table integrity
SELECT * FROM oc_extension_path LIMIT 10;

-- Test Case TC_013: Verify oc_modification table integrity
SELECT * FROM oc_modification LIMIT 10;

-- Test Case TC_014: Verify oc_session table integrity
SELECT * FROM oc_session LIMIT 10;

-- Test Case TC_015: Verify oc_startup table integrity
SELECT * FROM oc_startup LIMIT 10;

-- Test Case TC_016: Verify oc_seo_url table integrity
SELECT * FROM oc_seo_url LIMIT 10;

-- Test Case TC_017: Verify oc_banner table integrity
SELECT * FROM oc_banner LIMIT 10;

-- Test Case TC_018: Verify oc_banner_image table integrity
SELECT * FROM oc_banner_image LIMIT 10;

-- Test Case TC_019: Verify oc_theme table integrity
SELECT * FROM oc_theme LIMIT 10;

-- Test Case TC_020: Verify oc_translation table integrity
SELECT * FROM oc_translation LIMIT 10;

-- Test Case TC_021: Verify oc_notification table integrity
SELECT * FROM oc_notification LIMIT 10;

-- Test Case TC_022: Verify oc_marketing table integrity
SELECT * FROM oc_marketing LIMIT 10;

-- Test Case TC_023: Verify oc_marketing_report table integrity
SELECT * FROM oc_marketing_report LIMIT 10;


