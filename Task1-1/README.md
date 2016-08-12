# my_web_dev_task

###Task1-1：开发环境搭建
* 下载Java SE 8,安装Java编译和运行环境：javac、java；

  这个过程比较简单，从官网下载安装就好，在Mac OS系统Terminal终端输入java 或 javac，如果这些编译和运行环境没有安装，会弹窗提示，安装提示到官网下载dmg安装就好了。

* 下载并安装Apache Ant：java项目的编译工具；

  下载后将文件解压到/usr/local路径下，并配置/etc/bashrc 参数即可；

  参考：http://blog.csdn.net/crazybigfish/article/details/18215439

* 下载并安装jetty：J2EE的运行时框架服务器，还不是太明白做什么用。。

  jetty的安装和Ant类似，发现使用Homebrew更方便；

  参考：http://macappstore.org/jetty/
  
* 按照上面步骤完成jetty安装后，在开始[老王的下一课](https://github.com/simplemain/web-dev_task1-2_hello-world)时，发现找不到JETTY_HOME的环境变量

  分析原因应该是Homebrew导致的，因此安装老王的方法：
  
  1. 下载jetty安装包并解压;
  2. 将jetty工具包的路径设置为JETTY_HOME的环境变量；
  3. Mac 环境变量设置方法如下：

  进入命令行
 
  ```
  cd ~
  touch .bash_profile
  vi .bash_profile
  ```
  输入jetty变量配置内容：
  
  ```
  JETTY_HOME=/Users/niusam/Github/web_dev/Tools/jetty-hightide-8.0.0.v20110901 #jetty安装路径   
  export JETTY_HOME
  ```
  输入：wq保存。
  
  更新配置文件：
  
  ```
  source .bash_profile
  ```
  
  完成。
  
  参考链接：[Mac 可设置环境变量的位置、查看和添加PATH环境变量](http://elf8848.iteye.com/blog/1582137)
  
* 下载使用Eclipse；

  官网下载解压即可使用；

* 写一个Java程序helloworld，使用javac编译，并使用java运行；

  使用sublime文本编辑了一个java程序，然后使用javac编译后，使用java运行ok；

