<?php
require 'CASClient.php';
$C = new CASClient();
$netid = $C->Authenticate();

echo "Hello from the other side, $netid.";
echo "<P>Think of this as the main page of your application ";
echo "after $netid has been authenticated.";
?> 
