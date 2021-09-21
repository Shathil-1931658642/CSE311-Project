<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Sign In</title>
    <style type="text/css">
      #main{
        background-color: #333;
        width: 600px;
        height: 300px;
        border-radius: 30px;
      }
      h3{
        color: white;
        background-color: black;
        border-top-right-radius: 30px;
        border-top-left-radius: 30px;
      }
      p{
        color: white;
      }
      .text{
        background-color: #333;
        color: white;
        width: 250px;
        font-weight: bold;
        border: none;
        text-align: center;
      }
      .text:focus{
        outline:  none;
      }
      #sub{
        width: 250px;
        height: 30px;
        background-color: #5f5;
        border: none;
        border-radius: 20px;

      }
      hr{
        width: 250px;
        margin-top: 0px !important;
      }
      a{
        color: white;
      }
    </style>
  </head>
  <body>
      <center>
        <div id="main">
          <h3>Sign Up</h3>
          <form  action="signup.php" method="post">
              <p>Fill Up The Form.</p>
              <input type="text" name="name" placeholder="Username"><br><hr>
              <input type="email" name="email" placeholder="E-mail"><br><hr>
              <input type="password" name="pass" placeholder="Password"><br><hr>
              <label>Type:</label>
              <select name="types">
                <option value="rev">Reviewer</option>
                <option value="seller">Seller</option>
              </select><br><hr> 
              <input type="submit" name="register" value="register" id="sub"><br>
            </form>
            <br>Already registered?</br>
            <a href="index.php">Sign In</a>
          </div>
      </center>

  </body>
</html>
