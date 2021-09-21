<?php
session_start();
if(!isset($_SESSION['email'])){
  header("Location: index.php");
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>User Profile</title>
  </head>
  <body>
    <h1>Welcome</h1>
    <?=$_SESSION['email']?>
      <h3><a href="logout.php">Logout</a></h3>
  </body>

</html>
