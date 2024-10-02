
<?php 

  include("connectdb.php"); 

        $us = isset($_REQUEST['us']) ? trim($_REQUEST['us']) : "";
        $pw = isset($_REQUEST['pw']) ? trim($_REQUEST['pw']) : "";
        // encode
        $pw = md5($pw);

        $sql="SELECT user_id, username, password, users.role_id, roles.role_name 
            FROM users 
            INNER JOIN roles ON users.role_id = roles.role_id 
            WHERE (username='$us') 
            AND (password='$pw') 
            -- AND (users.role_id = 2);
            ";

        $query=$conn->query($sql);
    
        $rs_number=mysqli_num_rows($query);

        if($rs_number>0){
            while ($data = $query->fetch_assoc()) {
                $rs = $data['role_name'];
                echo '{"login":"OK", "status": "'.$rs.'"}';
            }
        }else{
            echo '{"login":"NO"}';
        }

     