<?php
  require_once "connection.php";

  if (isset($_POST['query'])) {
    $q = $_POST['query'];
      $query = "SELECT * FROM user WHERE user_name LIKE '$q%' LIMIT 100";
      $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_array($result)) {
          $user_id    =  $row[0];
          $user_name  =  $row[1];
          $user_email =  $row[2];
          $user_pass  =  $row[3];
          $_SESSION['email'] = $user_email;
          echo
          "<tr>
            <td>$user_id</td>
            <td>$user_name</td>
            <td>$user_email</td>
            <td>$user_pass</td>
            <td><a href='edit.php?id=$user_id'>Edit</a></td>
            <td>
              <a href='delete.php?id=$user_id'><button onclick='return confirm(\"Are you sure?\");'> Delete </button></a>
            </td>
          </tr>";

          }
    } else {
      echo "<div>User not found</div>";
    }
  }
?>
