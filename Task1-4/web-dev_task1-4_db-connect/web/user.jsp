<!DOCTYPE html>
<%@ page trimDirectiveWhitespaces="true"%> <!-- jsp标签，用来清除多余的空格 -->
<%@ page contentType="text/html; charset=UTF-8" %> <!-- jsp标签，用来设置编码和内容格式 -->
<%@ page import="java.lang.*,java.sql.*,java.io.*"%>

<%
Connection connection = null;

try
{
	// 查找并加载mysql-connector中的驱动类
	Class.forName("com.mysql.jdbc.Driver");

	// 连接数据库
	final String url = "jdbc:mysql://localhost:3306/samniu?autoReconnect=true&useUnicode=true&characterEncoding=utf-8&connectTimeout=2000&socketTimeout=10000";
	
	// TODO 这里修改你的数据库用户名和密码
	final String username = "root"; 
	final String password = "1111";

	connection = DriverManager.getConnection(url, username, password);

%>

<html>
	<head>
		<meta name="referrer" content="always" />
		<meta charset="utf-8" />
		<title>用户管理</title>
	</head>
	
	<body style="font-family:Courier New;text-align:center">
	
		<div style="padding:100px 0 30px 0;"><table width="100%"><tr><td align="center">

			<!-- jsp标签，实现添加新用户逻辑 -->
			<%
			final String action  = request.getParameter("action"); // 从请求中获取action参数

			// 添加用户
			if ("add".equals(action))
			{
				final String submitName = request.getParameter("name"); // 从请求中获取name参数
				if (submitName != null && !submitName.trim().equals(""))
				{
					PreparedStatement ps = null;
					try
					{
						String sql = "insert into user (id, name) values (null, ?)";
						ps = connection.prepareStatement(sql);
						ps.setString(1, submitName);
						ps.executeUpdate();
					}
					catch (Exception e)
					{
						e.printStackTrace();
					}
					finally
					{
						if (ps != null)
						{
							ps.close();
						}
					}
				}
			}
			%>
			
			<table border="1">
				<tr>
					<td align="left" colspan="2"><input type="text" style="width:300px"/></td>
					<td align="center"><button>查找</button></td>
				</tr>

				<tr><td colspan="3"><div style="height:30px"></div></td></tr>

				<tr>
					<td align="center">ID</td>
					<td align="center">姓名</td>
					<td align="center">操作</td>
				</tr>
				<tr>
					<form action="user.jsp" method="get">
					<input type="hidden" name="action" value="add"/>
					<td align="center"></td>
					<td align="center"><input type="text" name="name" style="width:200px"/></td>
					<td align="center"><input type="submit" value="添加"/></td>
					</form>
				</tr>

			<%
			// 执行查询，将所用用户查出来，并显示到网页上
			PreparedStatement ps = null;
			ResultSet rs = null;
			try
			{
				String sql = "select * from user order by id desc";
			
				ps = connection.prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs != null && rs.next())
				{
					final int id = rs.getInt("id");
					final String name = rs.getString("name");
			%>
				<tr>
					<td align="center"><%out.print(id);%></td>
					<td align="center"><%out.print(name);%></td>
					<td align="center"><a href="">删除</a></td>
				</tr>
			<%		
				}
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			finally
			{
				try {rs.close();} catch (Exception e1) {}
				
				try {ps.close();} catch (Exception e2) {}
			}
			%>
		</td></tr></table></div>
		
	</body>
</html>

<%
}
catch (Exception e)
{
	e.printStackTrace();
}
finally
{
	if (connection != null)
	{
		connection.close(); // 释放连接
	}
}
%>