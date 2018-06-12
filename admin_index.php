<!DOCTYPE html5>
<!--관리자로 로그인 했을 때의 메인 화면 -->
<meta charset="utf-8" />
<html>
<head>
<title>  LinKorea </title>
<style >
@import url(https://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
@import url(https://fonts.googleapis.com/earlyaccess/hanna.css);
@import url(https://fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
#header{
  position: relative;
  width: 100%;
  top:0px;
  left:0px;
  margin : 0px;
  padding : 0px;
}
body{
  font-family: "Nanum Pen Script", "cursive", "Lucida","Hanna","Jeju Myeongjo",sans-serif;
}
h2 {
   position: absolute;
   top: 30px;
   right: 0px;
   width: 100%;
}
h2 span {
   color: black;
   font: bold 70px/70px Lucida Console, Lucida Console;
   letter-spacing: -1px;
   background-color: transparent;

   padding: 10px;
}
p.intro{
  font: bold 35px "Nanum Pen Script"; cursive;
}
p.sogae{
  font: 40px "Hanna"; cursive;
}
p.alabogi{
  font : 25px "Nanum Pen Script"; cursive; text-align: right;
}
p.mid{
  font : 20px "Jeju Myeongjo"; cursive;
  line-height: 1.8;
}
p.daepyo{
  font: 40px "Hanna"; cursive; text-align: center;
}

p.admin{
    font : 20px "Nanum Pen Script"; curive; text-align: left;
}
#member{
    font :20px "Nanum Pen Script"; curive; text-align: left;

}

linkto{
   position:absolute;
   right:<x>px;
   top  :<x>px;
}

#hr_{
  float:left;
  width:100%;
}
#table{
  float:left;
  width:60%;
}
#intv{
  float:right;
  width:40%;
}
table{
  border : 2px solid black;
  border-collapse: collapse;
}
th{
  font: "Nanum Pen Script"; cursive;
  font-size: 30px;
}
td{
  font-size: 18px;
  font-family:  "Jeju Myeongjo";
  height: 30px;
  text-align: center;
}
p.tb{
  font: 40px "Hanna"; cursive;
}
p.itvw{
  font: 40px "Hanna"; cursive;
}
ul li{
  font-size: 21px;
  font-family: "Jeju Myeongjo";
}
</style>


</head>

<body>

  <div id="logo">
  <img src='logo1.png' style= "float : left ;">

  </div>
<div id="header">
  <img src="http://pretius.com/wp-content/uploads/2015/03/outsourcing.png" width=100% height="500" margin="0">
</div>
<div id="works">
  <hr>
    <div id="memberinfo">
  <FORM name ="login" method ="post" action ="login.html" >
    <!-- 관리자 계정 로그인 후 , 로그인세션으로 스타트 -->
  <?php
  session_start();
  if($_SESSION['ses_id']){
   $id = $_SESSION['ses_id'];
   $name = $_SESSION['ses_name'];
   echo"<p align= 'right'><font size=5> &nbsp 관리자님 환영합니다&nbsp</p>";
   echo"<p align= 'right'><a href='logout.php'><font size=5>로그아웃 &nbsp <a href='admin_manage.php'> 회원정보&nbsp<a href='addmovie.html'> 신고 회원 관리 &nbsp</a></p>";
   }
  ?>
</FORM>
  </div>

  <br/><br/>

  <div id="hr_">
    <p><hr></p>
  </div>
</div>

<br/><br/>



</body>
<a style="display:scroll;position:fixed;bottom:10px;right:10px;" href="#" title=”맨위로"><img src="http://paparecipe.com/img/btn_backtotop.png" width=55px ;height=55px;></a>

</html>
