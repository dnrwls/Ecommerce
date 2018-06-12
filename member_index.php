<!DOCTYPE html5>
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


#work1{
  width : 33%;
  float : left;
  font : 25px "Hanna"; cursive; text-align: center;
}
#work2{
  width: 33.4%;
  float : left;
  font : 25px "Hanna"; cursive; text-align: center;
}
#work3{
  width: 33.3%;
  float : right;
  font : 25px "Hanna"; cursive; text-align: center;
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
<hr>
<div class='linkto' >
<p class="alabogi" >  <a href="https://www.hikorea.go.kr/pt/InfoDetailR_kr.pt?catSeq=&categoryId=24&parentId=1109&showMenuId=102">
  <img src="1345.png" > </a> </p>
</div>
<br/><br/>


  <div id="memberinfo">
<FORM name ="login" method ="post" action ="login.html" >
    <?php
  session_start();
  if($_SESSION['ses_id']){
   $id = $_SESSION['ses_id'];
   $name = $_SESSION['ses_name'];
   echo"<p><font size=5> &nbsp $id 님 환영합니다</p>";
   echo"<p><a href='logout.php'><font size=5>로그아웃&nbsp<a href='myinfo.php'> MY정보&nbsp</a></p>";
   }
  ?>
</FORM>
</div>

 <center> Recommended Seller (추천 제공자 목록) </center>
 <br><br>

  <div id="work1">
    <figure>
        <figcaption>George Lucas</figcaption>
        <span style="font-size:12pt; line-height:1.0em">Service : Real Estate</span>
        <br/>
        <a href="reserved_work1.php">
        <img src="man1.jpg" width="350" px height="450"px >
	</a>
    </figure>

  </div>


  <div id="work2">
  <figure>
  <figcaption>Steven Yeun</figcaption>
   <span style="font-size:12pt; line-height:1.0em">Service : Public affairs</span>
  <br/>
  <a href="reserved_work2.php">
  <img src="man2.jpg" width="350"px height="450"px>
  </a>
 </figure>
  </div>

  <div id="work3">
    <figure>
      <figcaption>Kate Goldman</figcaption>
      <span style="font-size:12pt; line-height:1.0em">Service : Tour Guide</span>
      <br/>
      <a href="reserved_work3.php" >
    <img src="woman1.jpg" width="350"px height="450"px>
  </a>
    </figure>
    <br/>
    <p></p>
  </div>

  <div id="hr_">
    <p><hr></p>
  </div>
</div>

<br/><br/>






</body>
<a style="display:scroll;position:fixed;bottom:10px;right:10px;" href="#" title=”맨위로"><img src="http://paparecipe.com/img/btn_backtotop.png" width=55px ;height=55px;></a>

</html>
