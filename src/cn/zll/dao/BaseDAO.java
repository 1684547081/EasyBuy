package cn.zll.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




public class BaseDAO {
	public static final String driver = "com.mysql.jdbc.Driver";
	public static final String url = "jdbc:mysql://localhost:3306/easybuy?useUnicode=true&charaterEncoding=UTF-8";
	public static final String username = "root";
	public static final String pwd = "qq1684547081";

	public Connection con;
	public Statement stat;
	public ResultSet rs;
	public PreparedStatement ps;
	

	public Connection getConnection() throws Exception{
		Class.forName(driver);
		if (con==null||con.isClosed()) {
			con=DriverManager.getConnection(url, username, pwd);
		}
		return con;
	}
	public Connection getConnection1() throws Exception{
		Context cnt=new InitialContext();
		DataSource ds=(DataSource)cnt.lookup("java:comp/env/jdbc/NewsManagerSystem");
		con=ds.getConnection();
		return con;
	}

	public ResultSet executeQuery(String sql,Object...objects) throws Exception{
		con=getConnection();
		ps=con.prepareStatement(sql);
		for (int i = 0; i < objects.length; i++) {
			ps.setObject(i+1, objects[i]);
		}
		rs= ps.executeQuery();
		return rs;
	}
	

	public int executeUpdate(String sql,Object...objects) throws Exception{
		con=getConnection();
		ps=con.prepareStatement(sql);
		for (int i = 0; i < objects.length; i++) {
			ps.setObject(i+1, objects[i]);
		}
		int count=ps.executeUpdate();
		return count;
	}
	

	public void close() throws Exception{
		if (rs!=null) {
			rs.close();
		}
		if (ps!=null) {
			ps.close();
		}
		if (con!=null) {
			con.close();
		}
	}
}



