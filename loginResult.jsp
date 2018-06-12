<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<html>
<head><title>로그인</title></head>
<body>
<center>
<img width="220" height="120" src="링코리아로고.png"/><br>
<img width="1200" height="600" src="링코리아대문.png"/><br>
<%
	String SellerID = request.getParameter("SellerID");
	String Password = request.getParameter("Password");
%>
<%
	// 1. JDBC 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		
		String jdbcDriver = "jdbc:oracle:thin:@112.220.224.186:1521:oimr2";
		String dbUser = "SKKU_007";
		String dbPass = "SKKU_007";
		
		String query = "Select Password from Seller "+
					   "where SellerID = '"+SellerID+"'";
		
		// 2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		// 3. Statement 생성
		stmt = conn.createStatement();
		
		// 4. 쿼리 실행
		rs = stmt.executeQuery(query);
		
		// 5. 쿼리 실행 결과 출력
		while(rs.next()) {
%>


<%
	String TruePW=rs.getString("Password");
%>

<% if (TruePW.equals(Password)){ %>
	<form name="proposal" action="/ff/viewAcceptProposal.jsp?SellerID=<%= SellerID %>" method="post">
		<br>환영합니다. <%= SellerID %>님 <br><br>
		<input type="submit" value ="받은 제안서 보기">
	</form>
<%
	}
	else {
%>
	실패!<br>
	<a href="loginForm.jsp">다시 로그인 하기</a>
<%		
	}
		}
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		// 6. 사용한 Statement 종료
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
		
		// 7. 커넥션 종료
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>
</center>
</body>
</html>
