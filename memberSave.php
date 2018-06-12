<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

 $host = 'localhost';
 $user = 'root';
 $pw = '1234';
 $dbName = 'theatre';
 $mysqli = new mysqli($host, $user, $pw, $dbName);

 $id=$_POST['id'];
 $password=($_POST['mbpw']);
 $password2=$_POST['mbpw_re'];
 $name=$_POST['mbname'];
 $phoneno=$_POST['tel'];



 $sql = "insert into member (id, pw, name,PhoneNo)";
 $sql = $sql. "values('$id','$password','$name','$phoneno')";

 $sql2 = "insert into wholemembers (id, pw, name,PhoneNo)";
 $sql2 = $sql2."values('$id','$password', '$name', '$phoneno' )";

 if($mysqli->query($sql)){
  echo  "<script>alert(\"회원가입 성공\" );</script>";
  echo "<script>document.location.href = 'index.html';</script>";
 }else{
  echo "<script>alert(\"이미 존재하는 ID이거나, 빈 칸을 남겨두셨습니다. 다시 확인해주세요.\" );</script>";
  echo "<script>document.location.href = 'join.html';</script>";
  echo 'fail to insert sql';
 }

 if($mysqli->query($sql2)){
  echo  "<script>alert(\"회원가입 성공\" );</script>";
  echo "<script>document.location.href = 'index.html';</script>";
 }else{
  echo "<script>alert(\"이미 존재하는 ID이거나, 빈 칸을 남겨두셨습니다. 다시 확인해주세요.\" );</script>";
  echo "<script>document.location.href = 'join2.html';</script>";
  echo 'fail to insert sql';
 }

?>
