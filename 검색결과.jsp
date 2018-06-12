<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<html>
<head>
<title>검색 결과</title>
<style>
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic|Do+Hyeon|Nanum+Pen+Script|Sunflower:300|Nanum+Gothic+Coding');
	p { font-size: 30px; }
	.th {font-family : 'Do Hyeon', sans-serif; }
	p1 {font-size: 18px; }
	.th1{font-family :'Nanum Gothic', sans-serif;
		font-weight: bold;
		color: Navy;}
</style>
</head>
<body>
<% String buyerID="jjj0909";%>
&nbsp&nbsp<%=buyerID%>님
&nbsp&nbsp<a href="loginForm.jsp">로그아웃</a>
<center>
<img width="220" height="120" src="링코리아로고.png"/><br>
<p class="th">검색 결과</p><br>
<hr size="5" color="#1E82FF"/>
<br>
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
		
		String query = "select * from Seller";
		
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
	String SellerID = rs.getString("SellerID");
%>
<form name="SellerProfile" action="/ff/실험2_1.jsp" method="post">
	<table style="border:dashed 3px steelblue" cellpadding="15" rules="none" width=400 >
		<tr>
			<td>
			<br>
			&nbsp
			<p1 class="th1">ID </p1>  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<%= SellerID %>
			<br>
			&nbsp&nbsp<p1 class="th1">이름</p1>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<%= rs.getString("NAME") %><br>
			&nbsp&nbsp<p1 class="th1">사용언어</p1>&nbsp&nbsp&nbsp
			<%= rs.getString("Seller_Lang") %><br>
			&nbsp&nbsp<p1 class="th1">전문분야</p1>&nbsp&nbsp  
			<%= rs.getString("Domain") %><br>
			&nbsp&nbsp<p1 class="th1">주소</p1>  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			<%= rs.getString("주소") %><br><br>
			&nbsp&nbsp<p1 class="th1">최소 금액</p1>&nbsp&nbsp
			<%= rs.getString("MIN_PAY") %>원<br><br>
			&nbsp&nbsp<p1 class="th1">자기소개</p1><br>&nbsp&nbsp
			<%= rs.getString("자기소개") %>
			<br><br>
		</tr>
	</table>
	<a href="writingProposal.jsp?SellerID=<%=SellerID %>">제안서보내기</a>
</form>
<br>
<%
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
