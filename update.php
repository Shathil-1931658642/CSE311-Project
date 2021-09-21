<?php
session_start();
if(!isset($_SESSION['admin_name'])){
  header("Location: admin_login.php");
}

include("connection.php");
  $username = $_POST['name'];
  $email = $_POST['email'];
  $user_id = $_GET['id'];

  $sql = "update user set user_name='$username',user_email='$email' where user_id='$user_id'";
  $update = mysqli_query($conn, $sql);
  if($update){
    header('Location: view_user.php');
  }else{
    echo 'try again';
  }
?>
