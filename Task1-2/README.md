# sam_web_dev_task

###Task1-2：第一个web应用-Hello World
  [老王课程地址](https://mp.weixin.qq.com/s?__biz=MzA3MDExNzcyNA==&mid=2650392227&idx=1&sn=2530c91a4e74609f67fdadd850f58d26&scene=1&srcid=0810HyNBMZNB1mc6ehnDi9yv&key=8dcebf9e179c9f3a6f58423f1f0d29199950452f310ca11c3525459a17db04b0cc104034881dc865d073a517bdca0d06&ascene=0&uin=MTExNDEyMDM1&devicetype=iMac+MacBookPro11%2C2+OSX+OSX+10.11.6+build(15G31)&version=11020201&pass_ticket=Lg3UlsrH94CTJdf1MKKNioLNvA4MX0%2FUvxiGoSW3VaM%3D)

* git clone [老王最新的代码](https://github.com/simplemain/web-dev_task1-2_hello-world)
* 切换到项目的目录，打开terminal命令行，执行ant
* 编译完成后，在当前目录下产生run.bat、run两个文件，run是linux和mac下的可执行shell文件；
* Mac下运行：./run debug
* 浏览器访问：http://localhost:8080/hello-world.jsp

* 修改web/hello-world.jsp文件, 看看效果

* 再次浏览器访问：http://localhost:8080/show_parameter.jsp?a=1&b=2
* 尝试将参数转换为整数，计算结果后再转为String,最后打印出来。

在jsp标签<%和 %>中计算结果：

```
String a = request.getParameter("a");
String b = request.getParameter("b");

int m = Integer.valueOf(a);
int n = Integer.valueOf(b);

int sum = m + n;
String result = Integer.toString(sum);
```

输出结果：

```
a+b=<%out.println(result);%>
```



