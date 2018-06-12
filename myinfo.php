<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>회원정보 출력</title>
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

            p.tomain{
                font:  20px "Hanna"; cursive;
            }
        </style>
    </head>

    <body>
<?php

session_start();
$id = $_SESSION['ses_id'];

$conn = mysqli_connect('localhost', 'root', '1234', 'theatre');
 if ( mysqli_connect_errno() ) die('DB Error');
mysqli_query($conn, 'set session character_set_connection=utf8;');
mysqli_query($conn, 'set session character_set_results=utf8;');
mysqli_query($conn, 'set session character_set_client=utf8;');

 $query = "SELECT m.name, m.id, m.PhoneNo FROM wholemembers m where m.id = '$id' ";
 $result = mysqli_query($conn, $query);


   echo"<br/>\n";
            echo " -- $id 님 Linkorea 이용 현황 --";
               echo"<br/>\n";   echo"<br/>\n";
            echo '<table class="text-center"><tr>' .
                '<th>Name(이름)</th><th>ID</th><th>Contact(연락처)</th>' .
                '</tr>';
            while( $row = mysqli_fetch_array($result) ) {
                echo '<tr><td>' . $row['name'] . '</td>' .
                    '<td>' . $row['id'] . '</td>' .
                    '<td class="text-right">' . $row['PhoneNo'] . '</td></tr>';
            }

            echo '</table>';
            mysqli_close($conn);

?>
        <br/><br/>
        <p class=''tomain'><a href = 'member_index.php' > 메인으로 돌아가기 </a></p>
    </body>
</html>
