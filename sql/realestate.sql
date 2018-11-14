/* 数据库创建 */
DROP DATABASE IF EXISTS realestate;
CREATE DATABASE realestate  DEFAULT CHARACTER SET utf8;
USE realestate;



/* 表格创建 */
DROP TABLE IF EXISTS real_estate;
DROP TABLE IF EXISTS users;


CREATE TABLE users(
	cardId VARCHAR(18) PRIMARY KEY COMMENT '身份证号，作为id，用户输入',
	`name` VARCHAR(50) NOT NULL COMMENT '用户名，用户输入',
	gender INT(1) NOT NULL COMMENT '性别，系统输入',
	createtime DATETIME NOT NULL COMMENT'注册时间，系统输入,奇数1女，偶数0男',
	`password` VARCHAR(50) NOT NULL COMMENT'密码，用户输入，长度6以上',
	`status` INT(1) NOT NULL COMMENT '用户状态，系统输入，1正常默认，0冻结'
)COMMENT='用户表';


CREATE TABLE real_estate(
	id BIGINT(10) PRIMARY KEY AUTO_INCREMENT COMMENT '房产id',
	cardId VARCHAR(18) NOT NULL COMMENT '产权人身份证号',
	FOREIGN KEY(cardId) REFERENCES users(cardId),
	projectName VARCHAR(50) NOT NULL COMMENT'项目名',
	address VARCHAR(200) NOT NULL COMMENT'具体地址',
	houseType VARCHAR(20) NOT NULL COMMENT'房屋类型',
	`area` INT(10) NOT NULL COMMENT'使用面积',
	bulidTime DATE NOT NULL COMMENT'建造时间' 
)COMMENT='房产信息表';


/* 插入数据 */
-- 用户数据
INSERT INTO users VALUES
('440301198810304096','李雷',0,'2017-5-6 12:22:33','123456',1),
('440301198305215031','刘红',1,'2017-6-1 13:32:13','123456',1),
('440301198407302062','张烨',0,'2017-4-23 11:11:11','123456',0);

-- 房产信息
INSERT INTO real_estate(cardId,projectName,address,houseType,`area`,bulidTime) VALUES
('440301198810304096','天泉山庄','天兰市天泉山庄','三室',120,'2011-3-2'),
('440301198305215031','天泉山庄','天兰市天泉山庄','四室',200,'2011-3-2'),
('440301198407302062','天泉山庄','天兰市天泉山庄','三室',120,'2011-3-2'),
('440301198305215031','栖兰庄','天兰市栖兰小筑','三室',120,'2014-12-12'),
('440301198810304096','天泉山庄','天兰市天泉山庄','二室',50,'2011-3-2'),
('440301198810304096','海天居','天兰市海天居','三室',88,'2013-6-2');



/*  
查询

select * from real_estate;

select * from users;

 */
 
SELECT  r.`id`,r.`cardId`, u.`name`,r.`projectName`, r.`address`,r.`houseType`,r.`area`,r.`bulidTime`
FROM  real_estate r
LEFT JOIN users u 
ON r.`cardId` = u.`cardId`;

SELECT COUNT(2)FROM real_estate
