<?php
include("connection.php");
if (isset($_POST['register'])) {

  $user_name  =  $_POST['name'];
  $user_email =  $_POST['email'];
  $user_pass  = $_POST['pass'];
  if ($user_name == '') {
    echo "<script>alert('Please enter the name')</script>";
    echo "<script>window.open('registration.php','_self')</script>";
    exit();
  }
  if ($user_email == '') {
    echo "<script>alert('Please enter the email')</script>";
    echo "<script>window.open('registration.php','_self')</script>";
    exit();
  }
  if ($user_pass == '') {
    echo "<script>alert('Please enter the password')</script>";
    echo "<script>window.open('registration.php','_self')</script>";
    exit();
  }

  $check_email_query = "select * from user where user_email='$user_email'";
  $run_query =  mysqli_query($conn, $check_email_query);
  if (mysqli_num_rows($run_query) > 0) {
    echo "<script>alert('Email '$user_email' is already exist in our database, please try another one!')</script>";
    echo "<script>window.open('registration.php','_self')</script>";
    exit();
  }

  $insert_user = "insert into user (user_name, user_pass, user_email)
  value ('$user_name', '$user_pass', '$user_email')";

   if(mysqli_query($conn, $insert_user)){
     echo "<script>window.open('welcome.php','_self')</script>";
   }

}else {
  echo "<script>window.open('registration.php','_self')</script>";
}
?>
