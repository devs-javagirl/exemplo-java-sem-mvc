<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listando os usuários</title>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>

</head>
<body>
	<h1 style="text-align: center">Só mina foda, além de nós, óbvio! ;)</h1>

	<%
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager
					.getConnection("jdbc:mysql://localhost/semmvc?user=root&password=teste");
			Statement stmt = conn.createStatement();
			String sql = "SELECT id, nome, email FROM usuarios;";

			ResultSet rs = stmt.executeQuery(sql);
	%>
	<table style="width: 100%">
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Email</th>
		</tr>
		<%
			while (rs.next()) {
					int id = rs.getInt("id");
					String nome = rs.getString("nome");
					String email = rs.getString("email");
		%>
		<tr>
			<td><%=id%></td>
			<td><%=nome%></td>
			<td><%=email%></td>
		</tr>
		<%
			}
		%>
	</table>

	<%
		rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

</body>
</html>