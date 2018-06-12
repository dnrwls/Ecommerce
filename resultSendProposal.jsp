<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String Proposal_ID= request.getParameter("ProposalID");
	String service_ID=null;
	String BuyerID="jjj0909";
%>

<html>
	<head><title>보낸 제안서 확인</title>
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
	<div style="text-align:left">
	<a href="검색결과.jsp">검색결과 화면으로</a>
    &nbsp&nbsp<a href="loginForm.jsp">로그아웃</a></div>
	<center>
	<img width="220" height="120" src="링코리아로고.png"/><br>
	<p class="th">제안서 확인하기</p><br>
	<hr size="5" color="#1E82FF"/>
	<font face='Nanum Gothic'>
	<br>
	<%

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn1 = null;
		Statement stmt1 = null;
		ResultSet rs1 = null;
		try {
			String jdbcDriver = "jdbc:oracle:thin:@112.220.224.186:1521:oimr2";
			String dbUser = "SKKU_007";
			String dbPass = "SKKU_007";	
			String query1 = "Select * from PROPOSAL "+
						   "where ProposalID = '"+Proposal_ID+"'";
			//데이터베이스 커넥션 생성
			conn1 = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			//Statement 생성
			stmt1 = conn1.createStatement();
			//쿼리 실행
			rs1 = stmt1.executeQuery(query1);
			//쿼리 실행 결과 출력
			while(rs1.next()) {
	%>
		<%
			String ServiceID= rs1.getString("ServiceID");
		%>
		<form name="proposal_accept">
			<table style="border:dashed 3px steelblue" cellpadding="15" rules="none">
				<tr><td>
					<br>
					&nbsp&nbsp<p1 class="th1">제안서 번호 : </p1><%= rs1.getString("ProposalID") %><br>
					&nbsp&nbsp<p1 class="th1">제목 : </p1>&nbsp&nbsp&nbsp&nbsp<%= rs1.getString("title") %><br>
					&nbsp&nbsp<p1 class="th1">송신인 : </p1>&nbsp<%= rs1.getString("BUYERID") %><br>
					&nbsp&nbsp<p1 class="th1">수신인 : </p1>&nbsp<%= rs1.getString("SELLERID") %><br>
					
					<br>
					&nbsp&nbsp<p1 class="th1">지불액 : </p1><%= rs1.getString("Pay") %>원<br><br>
					&nbsp&nbsp<p1 class="th1">희망 서비스 내용</p1>
						<form name="Proposal" action="/ff/실험3.jsp" method="post">
						<%
							
							Connection conn = null;
							Statement stmt = null;
							ResultSet rs = null;
							
							try {
								String query = "Select * from SERVICE "+
											   "where ServiceID = '"+ServiceID+"' order by SERVICEID";
							
								conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
								stmt = conn.createStatement();
								rs = stmt.executeQuery(query);
								
								// 5. 쿼리 실행 결과 출력
								while(rs.next()) {
						%>
							<br>
							&nbsp&nbsp
							<table style="border: dashed 1px lightgray" cellpadding="5" width="500" rules="none" bgcolor="E1F6FA">
							<tr><td>
							&nbsp&nbsp번호 :&nbsp&nbsp
							<%= rs.getString("SERVICEID") %><br>
							&nbsp&nbsp내용 :&nbsp&nbsp
							<%= rs.getString("TITLE") %><br>
							&nbsp&nbsp언어 :&nbsp&nbsp
							<%= rs.getString("LANG") %><br>
							&nbsp&nbsp보수 :&nbsp&nbsp
							<%= rs.getString("PRICE") %><br>
							&nbsp&nbsp분야 :&nbsp&nbsp
							<%= rs.getString("CATEGORY") %><br>
							</td></tr>
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
							</table>	
						<br>
					&nbsp&nbsp
					시간1 : 선택 시간 <%= rs1.getString("Date1").substring(0,11) %>
					/ 선택 시간대
					<%= rs1.getString("TimeRange1") %>&nbsp&nbsp&nbsp&nbsp<br>
						
					&nbsp&nbsp
					시간2 : 선택 시간 <%= rs1.getString("Date2").substring(0,11) %>
					/ 선택 시간대
					<%= rs1.getString("TimeRange2") %>&nbsp&nbsp&nbsp&nbsp<br>
					
					&nbsp&nbsp
					시간3 : 선택 시간 <%= rs1.getString("Date3").substring(0,11) %>
					/ 선택 시간대
					<%= rs1.getString("TimeRange3") %>&nbsp&nbsp&nbsp&nbsp<br><br>
		<%
				}
			} catch(SQLException ex) {
				out.println(ex.getMessage());
				ex.printStackTrace();
			} finally {
				if (rs1 != null) try { rs1.close(); } catch(SQLException ex) {}
				if (stmt1 != null) try { stmt1.close(); } catch(SQLException ex) {}
				if (conn1 != null) try { conn1.close(); } catch(SQLException ex) {}
			}
		%>
		</form>
	</center>
	</font>
	</body>
</html>
