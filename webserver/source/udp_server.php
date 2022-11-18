<?PHP

$addr = gethostbyname('<<ip-address>>');
$port = 7777;
$buf = '';

$sock = socket_create(AF_INET, SOCK_DGRAM, 0);
if($sock < 0)	die(socket_strerror($sock));

if(($ret = socket_bind($sock, $addr, $port)) < 0)	die(socket_strerror($ret));


	$read = socket_recvfrom($sock, $buf, 2048, 0, $addr, $port);

	
	echo $buf;


socket_close ($sock);
?>