<?php
require 'CASClient.php';
$C = new CASClient();
$netid = $C->Authenticate();

echo "$netid";
?> 
