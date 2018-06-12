<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html> 
<html>
<head> 
<meta charset="utf-8"> 
<title>로그인</title> 
</head> 
<body> 
<center>
<img width="220" height="120" src="링코리아로고.png"/><br>
<img width="1200" height="600" src="링코리아대문.png"/><br>
<br>
	<form id="loginForm" method="post" action="loginResult.jsp"> 
		<label>ID : <input type="text" name="SellerID" /></label> 
		<label>PW : <input type="password" name="Password" /></label> 
		<input type="submit" /> 
	</form>
</center>
</body> 
</html>
