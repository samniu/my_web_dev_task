# sam_web_dev_task

###Task1-3：HTML入门
  老王课程:[第一部分::任务3:HTML入门-实现一个计算器](https://mp.weixin.qq.com/s?__biz=MzA3MDExNzcyNA==&mid=2650392248&idx=1&sn=9943571b7f5d45f09efd5c9867584a4c&scene=1&srcid=081287BnmTNHEEEi0dlzHnrM&key=305bc10ec50ec19b286a0500994d7328dc7e2417276da3cc7af182ed9c6dd8f7c4face8360793e4938b2e43c263ab571&ascene=0&uin=MTExNDEyMDM1&devicetype=iMac+MacBookPro11%2C2+OSX+OSX+10.11.6+build(15G31)&version=11020201&pass_ticket=gQByILEsMdy4b9qpFtOhGnV%2FvdLuTB1XfHkLI%2B2ZpH8%3D)

* git clone [老王最新的代码](https://github.com/simplemain/web-dev_task1-3_html)
* 通过Google搜索完成了改变符号“=”的样式，变成红底白字，把所以按钮变成了圆角

  符号"="的实现：

	```
	.button_result {
		color: white;
		background-color: red;
	}
	```
	
	改变所以按钮样式为圆角：
	
	```
	border-radius: 30px;
	```

* 通过模仿加法的代码，实现了减法、乘法和除法
  
  实现其他运算也算比较简单：
  1. 分别实现运算符的逻辑，如乘法：
  
	  ```
		function multiply()
		{
			if (operand2 == 0)
			{
				return;
			}
		
			operator = OP_MULTIPLY;
		
			operand1 = operand2;
			operand2 = 0;
		
			update(operand1);
		}
	  ```
  2. 实现结果的运算：
	
	  ```
	  function calc()
		{
			if (operator == '')
			{
				return;
			}

			var res = 0;

			if (OP_ADD == operator)
			{
				res = operand1 + operand2;
			}

			if (OP_SUBTRACT == operator)
			{
				res = operand1 - operand2;
			}

			if (OP_MULTIPLY == operator)
			{
				res = operand1 * operand2;
			}

			if (OP_DEVIDE == operator)
			{
				res = operand1 / operand2;
			}

			operand1 = res;
			operand2  = 0;

			update(res);
		}
	  ```
* 遗憾的是高级要求里的作业没能完成：
  1. 增加一个点号(.)，实现浮点数的计算
  
	 网上找了很多例子代码，跟老王的原有实现方式不一致，也不知道怎么修改才能借用网上的代码
	 
	 除非把老王的代码推倒重来，按照网上的例子copy一份了。。。~~o(>_<)o ~~
  
  2. 实现乘法、除法高优先级运算就更没去看了



