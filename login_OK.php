<?php
$host ="localhost";
$username = "root";
$password ="1234";
$dbname = "theatre";
$dbtype="mysql";
$message ="";
$dsn = "$dbtype:host=$host;dbname=$dbname;charset=utf8";
try{
    $pdo = new PDO($dsn, $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
} catch (PDOException $Exception) {
   die("오류".$Exception->getMessage());
}
$id= $_POST['id'];
$pw = $_POST['pw'];

$sql = "select * from wholemembers where id = :id and pw = :pw";
$stmh = $pdo->prepare($sql);
$stmh ->bindValue(':id',$id, PDO::PARAM_STR);
$stmh ->bindValue(':pw',$pw, PDO::PARAM_STR);
$stmh ->execute();
$count = $stmh->rowCount();

if($count<1){
    echo "<script>alert(\"로그인 실패! ID나 PW가 잘못되었습니다.\" );</script>";
    Header("Location:re_login.html");

}
else{
    echo"<script>alert(\"로그인 성공!\" );</script>";
    $row = $stmh->fetch(PDO::FETCH_ASSOC);
    $name = $row['name'];
    echo"<script>alert(\"로그인 성공!\" );</script>";
    session_start();
    echo"<script>alert(\"로그인 성공!\" );</script>";
    $_SESSION['ses_id'] = $id;
    $_SESSION['ses_pw'] = $pw;
    $_SESSION['ses_name'] = $name;
    $_SESSION['ses_PhoneNo'] = $PhoneNo;
    echo"<script>alert(\"로그인 성공!\" );</script>";
     Header("Location:member_index.php");
     echo"<script>alert(\"로그인 성공!\" );</script>";

}


?>
