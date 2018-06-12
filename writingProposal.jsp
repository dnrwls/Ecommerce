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
	String SellerID = request.getParameter("SellerID");
	String BuyerID = "jjj0909";
%>
<script>
	function doSubmit(){
		if (document.getElementById("proposal_title").value=="") {
			alert("제안서 제목을 입력해주세요");
			return false;
		}
		if (document.getElementById("Date1").value == "") {
			alert("시간1의 날짜를 입력해주세요");
			return false;
		}
		if (document.getElementById("Date2").value == "") {
			alert("시간2의 날짜를 입력해주세요");
			return false;
		}
		if (document.getElementById("Date3").value == "") {
			alert("시간3의 날짜를 입력해주세요");
			return false;
		}
		if (document.getElementById("proposal_pay").value < 0) {
			alert("지불액은 0원 이상이어야합니다.");
			return false;
		}
		alert('제안서가 전송 되었습니다')
		document.proposal.submit();
	}
</script>

<html>
<head><title>제안서 전송</title>
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
&nbsp&nbsp<%=BuyerID %>님
&nbsp&nbsp<a href="loginForm.jsp">로그아웃</a>
<center>
<img width="220" height="120" src="링코리아로고.png"/><br>
<p class="th">제안서 작성하기</p><br>
<hr size="5" color="#1E82FF"/>
<font face='Nanum Gothic'>
<br>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn1 = null;
	Statement stmt1 = null;
	ResultSet rs1 = null;
	int temp=0;
	try {
		String jdbcDriver = "jdbc:oracle:thin:@112.220.224.186:1521:oimr2";
		String dbUser = "SKKU_007";
		String dbPass = "SKKU_007";
		
		String query1 = "Select Count(*) from Proposal";
		
		// 2. 데이터베이스 커넥션 생성
		conn1 = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		// 3. Statement 생성
		stmt1 = conn1.createStatement();
		
		// 4. 쿼리 실행
		rs1 = stmt1.executeQuery(query1);
		
		// 5. 쿼리 실행 결과 출력
		while(rs1.next()) {
				temp=rs1.getInt(1);
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
	temp=temp+1;
	int ProposalID = temp;
%>				

<form name="proposal" action="/ff/sendingProposal.jsp?SellerID=<%= SellerID %>" method="post">
	<table style="border:dashed 3px steelblue" cellpadding="15" rules="none">
			<tr>
				<td>
				<br>
				<input type="hidden" name="ProposalID" value="<%= ProposalID %>">
				&nbsp&nbsp<p1 class="th1">제안서 번호 </p1> : <%= ProposalID %><br>
				&nbsp&nbsp<p1 class="th1">제목 </p1> &nbsp&nbsp&nbsp&nbsp<input type="text" name="title" id="proposal_title" size="30"><br>
				&nbsp&nbsp<p1 class="th1">송신인 </p1> <%= SellerID %><br>
				&nbsp&nbsp<p1 class="th1">수신인 </p1> <%= BuyerID %><br>
				<br>
				<br>
				&nbsp&nbsp<p1 class="th1">지불액 : </p1><input type="number" id="proposal_pay" name="pay" > 원<br><br>
				&nbsp&nbsp<p1 class="th1">*첨부할 희망 서비스를 선택하세요</p1>&nbsp
				<br>
				<form name="Proposal" action="/ff/실험3.jsp" method="post">
				<%
					
					Connection conn = null;
					Statement stmt = null;
					ResultSet rs = null;
					
					try {
						String jdbcDriver = "jdbc:oracle:thin:@112.220.224.186:1521:oimr2";
						String dbUser = "SKKU_007";
						String dbPass = "SKKU_007";
						
						String query = "Select * from SERVICE "+
									   "where BUYERID = '"+BuyerID+"' order by SERVICEID";
						
						// 2. 데이터베이스 커넥션 생성
						conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
						
						// 3. Statement 생성
						stmt = conn.createStatement();
						
						// 4. 쿼리 실행
						rs = stmt.executeQuery(query);
						
						// 5. 쿼리 실행 결과 출력
						while(rs.next()) {
				%>
					&nbsp&nbsp
					<table style="border: dashed 2px lightgray" width="500" cellpadding="5" rules="none" bgcolor="E1F6FA">
					<tr><td>
					<input type="radio" name="chk_service" value="<%= rs.getString("SERVICEID") %>">
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
					</table>
					
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
				<br>
				</form>
				&nbsp&nbsp시간1 : 날짜 선택 <input id="Date1" name="Date1" type="date">
				시간 선택
				<select name="TimeRange1">
					<option value="8:00~12:00">8:00~12:00</option>
					<option value="12:00~15:00">12:00~15:00</option>
					<option value="15:00~18:00">15:00~18:00</option>
					<option value="18:00~22:00">18:00~22:00</option>
					<option value="기타">기타</option>
				</select>&nbsp&nbsp<br>
					
				&nbsp&nbsp시간2 : 날짜 선택 <input id="Date2" name="Date2" type="date">
				시간 선택
				<select name="TimeRange2">
					<option value="8:00~12:00">8:00~12:00</option>
					<option value="12:00~15:00">12:00~15:00</option>
					<option value="15:00~18:00">15:00~18:00</option>
					<option value="18:00~22:00">18:00~22:00</option>
					<option value="기타">기타</option>
				</select>&nbsp&nbsp<br>
				&nbsp&nbsp시간3 : 날짜 선택 <input id="Date3" name="Date3" type="date">
				시간 선택
				<select name="TimeRange3">
					<option value="8:00~12:00">8:00~12:00</option>
					<option value="12:00~15:00">12:00~15:00</option>
					<option value="15:00~18:00">15:00~18:00</option>
					<option value="18:00~22:00">18:00~22:00</option>
					<option value="기타">기타</option>
				</select>&nbsp&nbsp<br>
				<br>
				</td>
			</tr>
		</table>
		<br>
		<input type="button" value="제안서 보내기" onclick="doSubmit()">
</form>
</center>
</font>
</body>
</html>
