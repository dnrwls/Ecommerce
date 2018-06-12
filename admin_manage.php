<!DOCTYPE html>
<html>
<!--관리자로 로그인 후 회원 현황 확인 하는 화면 -->
    <head>
        <meta charset="UTF-8" />
        <title>회원정보</title>
        <style type="text/css">
            table {
                border: 0;
                border-collapse: collapse;
                border-spacing: 0;
            }
            table td, table th {
                border: 1px solid;
                padding: 2px 5px 2px 5px;
            }
            .text-center { text-align: center; }
            .text-right { text-align: right; }
        </style>
    </head>

    <body>
      <!--DB에서 회원 정보를 받아오는 부분. SQL이 삽입된 PHP 스크립트 -->
     <?php
        $host ="localhost";
        $username = "root";
        $password ="1234";
        $dbname = "theatre";
        $dbtype="mysql";
        $message ="";
        $dsn = "$dbtype:host=$host;dbname=$dbname;charset=utf8";
        $conn = mysqli_connect('localhost', 'root', '1234', 'theatre');
            if ( !$conn ) die('DB Error');


            mysqli_query($conn, 'set session character_set_connection=utf8;');
            mysqli_query($conn, 'set session character_set_results=utf8;');
            mysqli_query($conn, 'set session character_set_client=utf8;');
            <!--Buyer 회원 명단 추출 -->
            $query = 'SELECT id,name,PhoneNo FROM member';
            $result = mysqli_query($conn, $query);
               echo"<br/>\n";
            echo "Buyer 회원 현황";
               echo"<br/>\n";
            echo '<table class="text-center"><tr>' .
                '<th>회원ID</th><th>이름</th><th>핸드폰번호</th>' .
                '</tr>';
            while( $row = mysqli_fetch_array($result) ) {
                echo '<tr><td>' . $row['id'] . '</td>' .
                    '<td>' . $row['name'] . '</td>' .
                    '<td class="text-right">' . $row['PhoneNo'] . '</td></tr>';
            }

            echo '</table>';
            echo"<br/>\n";echo"<br/>\n";
            <!--Seller 회원 명단 추출 -->
            $query = 'SELECT id,name,PhoneNo FROM member2';
            $result = mysqli_query($conn, $query);
               echo"<br/>\n";
            echo "Seller 회원 현황";
               echo"<br/>\n";
            echo '<table class="text-center"><tr>' .
                '<th>회원ID</th><th>이름</th><th>핸드폰번호</th>' .
                '</tr>';
            while( $row = mysqli_fetch_array($result) ) {
                echo '<tr><td>' . $row['id'] . '</td>' .
                    '<td>' . $row['name'] . '</td>' .
                    '<td class="text-right">' . $row['PhoneNo'] . '</td></tr>';
            }

            echo '</table>';
            echo"<br/>\n";echo"<br/>\n";


            ?>
        <br/>
        <br/>
        <p style="font-size: 20pt;"> <a href="admin_index.php" >메인으로 돌아가기</a> </p>
    </body>

</html>
