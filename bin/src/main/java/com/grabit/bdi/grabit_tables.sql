SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS admin_info;
DROP TABLE IF EXISTS menu_options;
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS menu_info;
DROP TABLE IF EXISTS menu_category;
DROP TABLE IF EXISTS payment_info;
DROP TABLE IF EXISTS order_info;
DROP TABLE IF EXISTS user_info;
DROP TABLE IF EXISTS venue_info;




/* Create Tables */

CREATE TABLE admin_info
(
	ai_num tinyint(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
	ai_id varchar(50) NOT NULL,
	ai_pwd varchar(50) NOT NULL,
	PRIMARY KEY (ai_num),
	UNIQUE (ai_id)
);


CREATE TABLE menu_category
(
	mc_code tinyint(3) unsigned zerofill NOT NULL,
	mc_name varchar(50) NOT NULL,
	PRIMARY KEY (mc_code)
);


CREATE TABLE menu_info
(
	vi_num mediumint(7) unsigned zerofill NOT NULL,
	mi_num tinyint(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
	mc_code tinyint(3) unsigned zerofill NOT NULL,
	mi_name varchar(50) NOT NULL,
	mi_price mediumint(7) unsigned NOT NULL,
	mi_img varchar(1000),
	mi_intro varchar(1000),
	PRIMARY KEY (mi_num)
);


CREATE TABLE menu_options
(
	mi_num tinyint(3) unsigned zerofill NOT NULL,
	mo_name varchar(50) NOT NULL,
	mo_value char(1) NOT NULL,
	UNIQUE (mo_name)
);


CREATE TABLE order_details
(
	oi_num int(10) unsigned zerofill NOT NULL,
	mi_num tinyint(3) unsigned zerofill NOT NULL,
	od_quantity tinyint(3) NOT NULL,
	od_msg varchar(1000)
);


CREATE TABLE order_info
(
	oi_num int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
	ui_num mediumint(8) unsigned zerofill NOT NULL,
	vi_num mediumint(7) unsigned zerofill NOT NULL,
	oi_status varchar(10) NOT NULL,
	oi_date char(8) NOT NULL,
	oi_cretim char(6) NOT NULL,
	oi_modtim char(6),
	oi_sum mediumint(7) unsigned NOT NULL,
	PRIMARY KEY (oi_num)
);


CREATE TABLE payment_info
(
	oi_num int(10) unsigned zerofill NOT NULL,
	pi_num mediumint(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
	pi_methods varchar(10) NOT NULL,
	pi_amount mediumint(7) NOT NULL,
	pi_date char(8) NOT NULL,
	pi_cretime char(6) NOT NULL,
	ui_num mediumint(8) unsigned zerofill NOT NULL,
	PRIMARY KEY (pi_num)
);


CREATE TABLE user_info
(
	ui_num mediumint(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
	ui_id varchar(50) NOT NULL,
	ui_pwd varchar(100) NOT NULL,
	ui_name varchar(10) NOT NULL,
	ui_email varchar(50) NOT NULL,
	ui_tel varchar(20) NOT NULL,
	PRIMARY KEY (ui_num),
	UNIQUE (ui_id),
	UNIQUE (ui_email),
	UNIQUE (ui_tel)
);


CREATE TABLE venue_info
(
	vi_num mediumint(7) unsigned zerofill NOT NULL AUTO_INCREMENT,
	vi_pwd varchar(100) NOT NULL,
	vi_name varchar(50),
	vi_addr varchar(100),
	vi_tel varchar(20) NOT NULL,
	vi_img varchar(1000),
	vi_intro varchar(3000) NOT NULL,
	vi_businessdays varchar(30) NOT NULL,
	vi_businesshours varchar(30) NOT NULL,
	vi_status varchar(10) NOT NULL,
	PRIMARY KEY (vi_num),
	UNIQUE (vi_name),
	UNIQUE (vi_addr)
);



/* Create Foreign Keys */

ALTER TABLE menu_info
	ADD FOREIGN KEY (mc_code)
	REFERENCES menu_category (mc_code)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE menu_options
	ADD FOREIGN KEY (mi_num)
	REFERENCES menu_info (mi_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE order_details
	ADD FOREIGN KEY (mi_num)
	REFERENCES menu_info (mi_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE order_details
	ADD FOREIGN KEY (oi_num)
	REFERENCES order_info (oi_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE payment_info
	ADD FOREIGN KEY (oi_num)
	REFERENCES order_info (oi_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE order_info
	ADD FOREIGN KEY (ui_num)
	REFERENCES user_info (ui_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE payment_info
	ADD FOREIGN KEY (ui_num)
	REFERENCES user_info (ui_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE menu_info
	ADD FOREIGN KEY (vi_num)
	REFERENCES venue_info (vi_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE order_info
	ADD FOREIGN KEY (vi_num)
	REFERENCES venue_info (vi_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



