# sam_web_dev_task

###Task1-4：搭建数据库&程序同数据库连接
  老王课程:[第一部分::任务4:搭建数据库&程序同数据库连接](http://mp.weixin.qq.com/s?__biz=MzA3MDExNzcyNA==&mid=2650392259&idx=1&sn=ac4e468976a5099ab11ee40ecc78e04e&scene=0#rd)

* git clone [老王最新的代码](https://github.com/simplemain/web-dev_task1-4_db-connect)
* 下载了mysql-5.7.14-osx10.11-x86_64.dmg后并安装

* 开启mysql, 执行下面命令，使用安装mysql时的默认密码：

```
mysql -u root -p
```

* 执行user.sql的sql语句

```
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
```

执行创建数据库命令时，出现以下问题：

```
mysql> CREATE DATABASE IF NOT EXISTS `samniu`;
ERROR 1820 (HY000): You must reset your password using ALTER USER statement before executing this statement.
mysql> 
```

Google参考下面方法解决了问题 

[Reset MySQL root password using ALTER USER statement after install on Mac](http://stackoverflow.com/questions/33467337/reset-mysql-root-password-using-alter-user-statement-after-install-on-mac)

执行代码

```
UPDATE mysql.user SET Password=PASSWORD('1111') 
       WHERE User='root'; 
SET PASSWORD = PASSWORD('1111');
```
然后一路执行上面sql语句创建数据库和表，Done！

* 切换到代码目录，运行ant编译成功
* 编译后产生run文件，然后运行 ./run debug

* 当打开浏览器访问 http://localhost:8080/user.jsp 时，出现下面错误

```
requirements SSL connection must be established by default if explicit option isn't set.
```

外事问Google, 结果问题还是没解决....

然后忽然想起来刚修改了密码，于是修改uer.jsp文件中的数据库用户名和密码后， 问题仍然没有解决......

这时突然发现数据库连接的url中有“simplemain”的字眼,才想起来，刚才创建数据库时，顺便把老王模板代码中的数据库名称改了....

连接数据库的代码

```
// 查找并加载mysql-connector中的驱动类
Class.forName("com.mysql.jdbc.Driver");

// 连接数据库
final String url = "jdbc:mysql://localhost:3306/samniu?autoReconnect=true&useUnicode=true&characterEncoding=utf-8&connectTimeout=2000&socketTimeout=10000";
	
// TODO 这里修改你的数据库用户名和密码
final String username = "root"; 
final String password = "1111";

connection = DriverManager.getConnection(url, username, password);
```

* 再次打开浏览器访问 http://localhost:8080/user.jsp ,期望的结果出现了, It's great!

* 在浏览器数据库中添加姓名,一切正常。
* 删除刚才添加的某条数据,继续添加刚才的数据, 原来老王留了作业完成删除功能的。。。

1. 修改user.jsp，实现删除用户的功能；
 
2. 修改user.jsp，实现按名字查找用户的功能；



