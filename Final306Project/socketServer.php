//Alex Hansen 4/17/2016
//help from php.net





<?PHP

    $socket = stream_socket_server("udp://127.0.0.1:6969", $errno, $errstr, STREAM_SERVER_BIND);
    if (!$socket) {
        die("$errstr ($errno)");
    }
    
    do {
        $pkt = stream_socket_recvfrom($socket, 1, 0, $peer);
        echo "$peer\n";
        stream_socket_sendto($socket, date("D M j H:i:s Y\r\n"), 0, $peer);
    } while ($pkt !== false);



?>
