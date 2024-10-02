<?php 
  include("connectdb.php"); 

        $user_id = isset($_REQUEST['user_id']) ? trim($_REQUEST['user_id']) : "";
        $pro_id = isset($_REQUEST['pro_id']) ? trim($_REQUEST['pro_id']) : "";
        $order_qty = isset($_REQUEST['order_qty']) ? trim($_REQUEST['order_qty']) : "";
        // encode

        $sql="INSERT INTO orders (user_id, pro_id, order_qty) VALUES ('$user_id', '$pro_id', '$order_qty')";

        $query=$conn->query($sql);
    
        if($query){
            echo '{"order":"OK"}';
        }else{
            echo '{"order":"NO"}';
        }

     
