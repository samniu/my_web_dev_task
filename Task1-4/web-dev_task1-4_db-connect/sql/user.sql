-- 创建数据库
CREATE DATABASE IF NOT EXISTS `samniu`;

-- 切换数据库
use `samniu`;

-- 创建表
CREATE TABLE IF NOT EXISTS `user`
(
	id int auto_increment not null,
	name varchar(255) not null,
	
	primary key (`id`),
	key (`name`)
)ENGINE=InnoDB DEFAULT CHARSET=`utf8`;
