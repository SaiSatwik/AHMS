<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>S.U.C.C.E.S.S</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
		String name = request.getParameter("uname");
		String hostname = "localhost";
		String username = "postgres";
		String password = "satwik";
		String dbName = "postgres";
		String connectionUrl = "jdbc:postgresql://" + hostname + "/" + dbName;
		java.sql.Connection con = DriverManager.getConnection(connectionUrl, username, password);
		Statement st = con.createStatement();
		String sql = "delete from patients_info where name=" + name;

		try {

			st.executeUpdate(sql);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
	<br>
	<br>
	<b><center>Successfully deleted</center></b>
	<br>
	<center>
		<a href="mangptnts.jsp"><button value="Back">Back</button></a>
	</center>
</body>
</html>