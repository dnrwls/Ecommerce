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
	String SellerID=request.getParameter("SellerID");
%>
<script type="text/javascript">
    function CheckForm(Join){
        //체크박스 체크여부 확인 
        var checked1=document.proposal_accept.chk1.checked;
		var checked2=document.proposal_accept.chk2.checked;
		var checked3=document.proposal_accept.chk3.checked;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
        if(!checked1 && !checked2 && !checked3 ){
            alert('하나 이상의 시간을 선택해주세요');
            return false;
        } 
		alert('제안서를 승낙하셨습니다.')
		document.proposal_accept.submit();
    }
 </script>

<html>
<head><title>받은 제안서</title>
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
	&nbsp&nbsp<%=SellerID %>님
	&nbsp&nbsp<a href="loginForm.jsp">로그아웃</a></div>
	<center>
	<img width="220" height="120" src="링코리아로고.png"/><br>
	<p class="th">받은 제안서</p><br>
		<hr size="5" color="#1E82FF"/>
	<br>
<%
	// 1. JDBC 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	int count=0;
	
	try {
		
		String jdbcDriver = "jdbc:oracle:thin:@112.220.224.186:1521:oimr2";
		String dbUser = "SKKU_007";
		String dbPass = "SKKU_007";
		
		String query = "Select * from PROPOSAL "+
					   "where SELLERID = '"+SellerID+"'";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		while(rs.next()) {
			count=count+1;
%>
	<%
		String ServiceID= rs.getString("ServiceID");
	%>
	<form name="proposal_accept" action="/ff/resultAccept.jsp" method="post">
		<table style="border:dashed 3px steelblue" cellpadding="15" rules="none">
			<tr><td>
				<br>
				&nbsp&nbsp<p1 class="th1">제안서 번호 : </p1><%= rs.getString("ProposalID") %><br>
				&nbsp&nbsp<p1 class="th1">제목</p1> &nbsp&nbsp&nbsp&nbsp<%= rs.getString("title") %><br>
									&nbsp&nbsp<p1 class="th1">송신인 : </p1>&nbsp<%= rs.getString("BUYERID") %><br>
					&nbsp&nbsp<p1 class="th1">수신인 : </p1>&nbsp<%= rs.getString("SELLERID") %><br>
					<br>
					&nbsp&nbsp<p1 class="th1">지불액 : </p1><%= rs.getString("Pay") %>원<br><br>
					&nbsp&nbsp<p1 class="th1">희망 서비스 내용</p1><br><br>
					<%
						Connection conn1 = null;
						Statement stmt1 = null;
						ResultSet rs1 = null;
						
						try {
							String query1 = "Select * from SERVICE "+
									"where SERVICEID = '"+ServiceID+"'";
							//데이터베이스 커넥션 생성
							conn1= DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
							//Statement 생성
							stmt1 = conn1.createStatement();
							//쿼리 실행
							rs1 = stmt1.executeQuery(query1);
							//쿼리 실행 결과 출력
							while(rs1.next()) {
					%>
					<table style="border: dashed 2px lightgray" cellpadding="5" width="500" rules="none" bgcolor="E1F6FA">
						<tr>
						<td>
						&nbsp&nbsp번호 :&nbsp&nbsp
						<%= rs1.getString("SERVICEID")%><br>
						&nbsp&nbsp내용 :&nbsp&nbsp
						<%= rs1.getString("TITLE") %><br>
						&nbsp&nbsp언어 :&nbsp&nbsp
						<%= rs1.getString("LANG") %><br>
						&nbsp&nbsp보수 :&nbsp&nbsp
						<%= rs1.getString("PRICE") %><br>
						&nbsp&nbsp분야 :&nbsp&nbsp
						<%= rs1.getString("CATEGORY") %><br>
						</td>
						</tr>
					<%
							}
						} catch(SQLException ex) {
							out.println(ex.getMessage());
							ex.printStackTrace();
						} finally {
							// 6. 사용한 Statement 종료
							if (rs1 != null) try { rs1.close(); } catch(SQLException ex) {}
							if (stmt1 != null) try { stmt1.close(); } catch(SQLException ex) {}
							
							// 7. 커넥션 종료
							if (conn1 != null) try { conn1.close(); } catch(SQLException ex) {}
						}
					%>
					</table>
				<br><br>
				<font size="3">&nbsp&nbsp<가능하신 시간을 선택해주세요></font><br><br>
				&nbsp&nbsp
				<input type="checkbox" name="chk1" id="chk1" value="chk_time1">
				시간1 : 선택 시간 <%= rs.getString("Date1").substring(0,11) %>
				/ 선택 시간대
				<%= rs.getString("TimeRange1") %>&nbsp&nbsp&nbsp&nbsp<br>
				&nbsp&nbsp
				<input type="checkbox" name="chk2" id="chk2" value="chk_time2">
				시간2 : 선택 시간 <%= rs.getString("Date2").substring(0,11) %>
				/ 선택 시간대
				<%= rs.getString("TimeRange2") %>&nbsp&nbsp&nbsp&nbsp<br>
				&nbsp&nbsp
				<input type="checkbox" name="chk3" id="chk3" value="chk_time3">
				시간3 : 선택 시간 <%= rs.getString("Date3").substring(0,11) %>
				/ 선택 시간대
				<%= rs.getString("TimeRange3") %>&nbsp&nbsp&nbsp&nbsp<br><br>
				<input type="button" value="제안서 승낙하기" onClick="return CheckForm(this)">
				</td>
			</tr>
		</table>
	</form>
	<%
			}
		} catch(SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		if (count==0){
	%>
	받은 제안서가 없습니다.
	<%
		}
	%>
	</center>
</body>
</html>
