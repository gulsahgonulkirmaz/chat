<?php
if($_POST){
    session_start();
    require_once 'include.php';


    $kullanici=$_POST['username'];
    $sifre=$_POST['password'];
    
    
    $kullan= mysqli_query($conn, "SELECT * FROM users WHERE user_name='$kullanici'");
    $kullanici2=mysqli_num_rows($kullan);

    if($kullanici2 > 0 ){
        $sql=mysqli_query($conn,"SELECT * FROM users WHERE user_name='$kullanici' AND  user_pswr='$sifre' AND user_active='1'");
        $sql2=mysqli_num_rows($sql);
        if($sql2 > 0)
        {
            while ($yaz=mysqli_fetch_array($sql))
            {
                $_SESSION['user_name']=$kullanici;
                $_SESSION['user_pswr']=$sifre;
                $_SESSION['user_id'] = $yaz['user_id'];

                if(($admin==$sifre)&& ($kullanici=='admin'))  {
                    echo'admin olarak giriş yaptınız';
                }
                else{
                    //echp 'Anasayfaya yönlendiriliyorsunuz,lütfen bekleyeniz....';
                    header("Location:http://localhost/2chat.php");
                    //header ("Location:admin/giris.php");

                }
            }
        }
        else {
            $mesaj ="<script>alert('Şifre .')</script>";
            echo $mesaj;
        }
    }
    else {
        $mesaj ="<script>alert(''Girdiğiniz kullanici adı kayıtlı değil.'')</script>";
        echo $mesaj;
    }
    

}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Chat</title>
    <link rel="stylesheet" href="css/chat.css">
</head>
<body>
    <div id="anasayfa">
    <div class="table">
                <div id="chatimg">
                <img src="images/rsm.png" width="100%" >
                </div>
        </div>
        <div class="table">
<div id="adminpanel">
        <form action="" method="POST">
    <div id="aa">
        <table border="0" align="center" width="700" height="200">
          <tr >
              <td style="font-size: 20px;float:left;padding-top:25px;"align="center"><b>Kullanıcı Adı:</b></td>
              <td> <input  style="width: 200px;height: 23px; border-color:rgb(173, 8, 8);font-size: 15px;"type="text" name="username" placeholder=" Lütfen Kullanıcı Adı Giriniz"></td>
          </tr>
  <tr>
      <td style="font-size: 20px;float:left;padding-top:25px;"align="center"><b>Şifreniz:</b></td>
      <td><input style="width: 200px;height: 23px; border-color:rgb(173, 8, 8);font-size: 15px;" type="password" name="password" placeholder=" Lütfen Şifrenizi Giriniz"></td><br>
  </tr>
  <tr>
      <td colspan="2" align="center">
          <input type="submit" value="GİRİŞ" style="width: 80px;background-color: rgb(236, 236, 236);color:black;font-weight: bold;border-radius:0px 10px 0px 10px;">
          <input type="button" value="KAYDOL" onclick="window.location.href='register.php'" style="width: 80px;background-color: rgb(236, 236, 236);color:black;font-weight: bold;border-radius:0px 10px 0px 10px;">
      </td>
  </tr>
        </table></form>
</div>
        </div>
    
</div>
</div>
    </div>
    </body>
</html>
