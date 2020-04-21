<?php

$user = 'root';
$password = '';
try {
   $db = new PDO("mysql:host=localhost; dbname=alishersv", $user, $password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (Exception $e) {
 echo $e->getMessage();
}
?>