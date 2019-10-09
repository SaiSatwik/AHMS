package com.hospdbms.pkg;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

/**
 * Servlet implementation class Plogin
 */
@WebServlet(urlPatterns = "/Plogin")
public class Plogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Plogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String driverName = "org.postgresql.Driver";
		String hostname = "localhost";
		String username = "postgres";
		String password = "satwik";
		String dbName = "postgres";
		String connectionUrl = "jdbc:postgresql://" + hostname + "/" + dbName;
		String pwdd = null;
		String name = request.getParameter("uname");

		String psswd = request.getParameter("pwd");
		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			connection = DriverManager.getConnection(connectionUrl, username, password);
			statement = connection.createStatement();
			String sql = "SELECT password FROM patients_info where name='" + name + "'";

			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				pwdd = resultSet.getString("password");
			}
			Cookie ck = new Cookie("auth",name);
			
			ck.setMaxAge(6000000);
			if (psswd.equalsIgnoreCase(pwdd)) {
				session.setAttribute("Name", name);
				response.addCookie(ck);
				//request.getRequestDispatcher("patientpage.jsp").forward(request, response);
				response.sendRedirect("patientpage.jsp");
				return;
			}

			else {
				request.setAttribute("error", "Invalid username/password.");
				request.getRequestDispatcher("plogin.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
