<?php
session_start();
if(!isset($_SESSION['admin_name'])){
  header("Location:admin_login.php");
}
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title></title>
  </head>
  <body>
    <div id="notice"></div>
      <h3>Welcome <?php echo $_SESSION['admin_name'];?> </h3>

      <?php
      if(isset($_GET['del'])) {
      //  echo 'here';
        echo "<script>$('#notice')
              .show()
              .html('<div>Successfully! <strong> record deleted. </strong> </div>')
              .fadeOut(5000)</script>";
      }
      ?>
      <div>
        <input type="text" name="live_search" id="live_search" autocomplete="off" placeholder="Search user...">
      </div>
      <h1>All Users</h1>
      <table>
        <thead>
          <tr>
            <th>User ID</th>
            <th>User Name</th>
            <th>User Email</th>
            <th>User Pass</th>
          </tr>
        </thead>
        <tbody id="tmp">
        <?php
        include('connection.php');
        $view_users_query = "select * from user";
        $run = mysqli_query( $conn, $view_users_query);
        while ($row = mysqli_fetch_array($run)) {
            $user_id    =  $row[0];
            $user_name  =  $row[1];
            $user_email =  $row[2];
            $user_pass  =  $row[3];
        ?>
        <tr>
          <td><?=$user_id;?></td>
          <td><?=$user_name;?></td>
          <td><?=$user_email;?></td>
          <td><?=$user_pass;?></td>
          <td><a href="edit.php?id=<?=$user_id;?>">Edit</a></td>
          <td>
            <a href="delete.php?id=<?=$user_id;?>"><button onclick="return confirm('Are you sure?');"> Delete </button></a>
          </td>
        </tr>

        <?php
        }
        ?>
        </tbody>
        <tbody id="search_result"></tbody>
      </table>

      <h4><a href="index.html">Logout</a></h4>
      <script type="text/javascript">
        $(document).ready(function () {
            $("#live_search").keyup(function () {
                var query = $(this).val();
                if (query != "") {
                  $(document).click(function(data) {
                      $("#tmp").hide();
                    });
                    $.ajax({
                        url: 'live_search.php',
                        method: 'POST',
                        data: {
                            query: query
                        },
                        success: function (data) {

                            $('#tmp').html("");
                            $('#search_result').html(data);
                        }
                    });
                } else {
                   $('#tmp').css('display', 'none');
                }
            });
        });
    </script>
  </body>
</html>
