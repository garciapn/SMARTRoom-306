<?php
    $host = 'smartroom.czjl1dned5qh.us-west-2.rds.amazonaws.com';
    $user = 'front6';
    $pass = 'newfrontier';

    
    $connection = mysql_connect($host, $user, $pass);
    
    if(!$connection)
    {
        die("Database server connection failed.");
    }
    $sql = 'SELECT customer_id, username, pw FROM Customer';
    mysql_select_db('SMARTRoom');
    
    $retreval = mysql_query( $sql, $connection );
    
    if (! $retreval) {
        die( 'could not get data: ' . mysql_error());
    }
    $temploginmysql = array();
    $login = "login";
    $inside = array();
    
    while ($row = mysql_fetch_array($retreval, MYSQL_ASSOC)) {
        $count++;
        $login = "login$count";
        $inside = array($row_array[$login] ['id'] = $row['customer_id'], $row_array[$login] ['username'] = $row['username'], $row_array[$login]['password'] = $row['pw'] );
    }
    array_push ($temploginmysql, $row_array);
                        
    echo json_encode($temploginmysql);
    json_encode($temploginmysql);
    $fp =fopen('loginUser.json', 'w');
    fwrite($fp, json_encode($temploginmysql));
    mysql_close($connection);
?>
