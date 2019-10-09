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

		Class.forName("org.postgresql.Driver");
		String hostname = "localhost";
		String username = "postgres";
		String password = "satwik";
		String dbName = "postgres";
		String connectionUrl = "jdbc:postgresql://" + hostname + "/" + dbName;
		java.sql.Connection con = DriverManager.getConnection(connectionUrl, username, password);
		Statement st = con.createStatement();
		int id=Integer.parseInt(request.getParameter("ide"));
		if (id == 1) {
			String pswd = request.getParameter("pwd");
			String country = request.getParameter("country");
			String locality = request.getParameter("area");
			String street = request.getParameter("street");
			String pemail = request.getParameter("pemail");
			String pno = request.getParameter("pno");
			String state = request.getParameter("state");
			String name = request.getParameter("name");
			System.out.println(name);
			String aadhar = request.getParameter("aadhar");
			st.executeUpdate("insert into patients_info values ('" + name + "','" + pemail + "'," + pno + ",'"
					+ street + "','" + locality + "', '" + aadhar + "','" + state + "','" + country + "','" + pswd
					+ "')");
		} else {
			System.out.println(id);
			String pswd = request.getParameter("pwdDoc");
			String country = request.getParameter("countryDoc");
			String locality = request.getParameter("areaDoc");
			String street = request.getParameter("streetDoc");
			String pemail = request.getParameter("pemailDoc");
			String pno = request.getParameter("pnoDoc");
			String state = request.getParameter("stateDoc");
			String name = request.getParameter("nameDoc");
			System.out.println(name);
			String spez = request.getParameter("spz");
			st.executeUpdate("insert into doc_info values('" + name + "','" + spez + "','" + pswd + "')");
		}
	%>
	<br>
	<br>
	<b><center>Success</center></b>
	<br>
	<center>
		<a href="plogin.jsp">Back to login page</a>
	</center>
	<br>
	<center>
		<a href="/HospDBMS">Home</a>
	</center>

</body>
</html>