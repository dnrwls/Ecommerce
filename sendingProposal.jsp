<%@ page contentType = "text/html; charset=utf-8" %>

<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
	request.setCharacterEncoding("utf-8");
	String ProposalID = request.getParameter("ProposalID");
	String title = request.getParameter("title");
	String SellerID = request.getParameter("SellerID");
	String BuyerID = "jjj0909";
	String pay = request.getParameter("pay");
	String Date1 = request.getParameter("Date1");
	String TimeRange1 = request.getParameter("TimeRange1");
	String Date2 = request.getParameter("Date2");
	String TimeRange2 = request.getParameter("TimeRange2");
	String Date3 = request.getParameter("Date3");
	String TimeRange3 = request.getParameter("TimeRange3");
	String ServiceID = request.getParameter("chk_service");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		String jdbcDriver = "jdbc:oracle:thin:@112.220.224.186:1521:oimr2";
		String dbUser = "SKKU_007";
		String dbPass = "SKKU_007";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		pstmt = conn.prepareStatement(
			"insert into proposal values (?,?,?,?,?,?,?,?,?,?,?,?)");
		pstmt.setString(1, title);
		pstmt.setString(2, BuyerID);
		pstmt.setString(3, SellerID);
		pstmt.setString(4, pay);
		pstmt.setString(5, Date1);
		pstmt.setString(6, TimeRange1);
		pstmt.setString(7, ProposalID);
		pstmt.setString(8, Date2);
		pstmt.setString(9, TimeRange2);
		pstmt.setString(10, Date3);
		pstmt.setString(11, TimeRange3);
		pstmt.setString(12, ServiceID);
		pstmt.executeUpdate();
	} finally {
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>
<html>
<head><title>제안서 전송 성공</title>
<style>
	@import url('https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Pen+Script|Sunflower:300|Nanum+Gothic+Coding');
	p { font-size: 30px; }
	.th {font-family : 'Do Hyeon', sans-serif; }
</style>
</head>
<body>
&nbsp&nbsp<a href="loginForm.jsp">로그아웃</a>
<center>
<img width="220" height="120" src="링코리아로고.png"/><br>
<hr size="5" color="#1E82FF"/><br><br>
<p class="th">제안서가 전송되었습니다</p><br>
<a href="resultSendProposal.jsp?ProposalID=<%=ProposalID %>"> 제안서 확인하기 </a>
</center>
</body>
</html>
