
<?php 

  include("connectdb.php"); 

        $sql="SELECT 
            -- categories.cat_name,
            pro_id,
            pro_name, 
            pro_price, 
            pro_image, 
            pro_desc
         FROM products
        --  INNER JOIN categories ON products.cat_id = categories.cat_id
         ";


        $query=$conn->query($sql);
        $id = 0;
        $data = array();
    
        // $rs_number=mysqli_num_rows($query);

        while($rs=$query->fetch_assoc()){
            $data[$id]= $rs;
            $id++;
         }
 
         $json = json_encode($data);
         echo $json;

        


     