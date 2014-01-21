	    <!DOCTYPE html>
	     
	    <html lang="en">
		<head>
		    <meta charset="utf-8" />
		    <title><?php echo $title; ?></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/signin.css" rel="stylesheet">
		</head>
		<body>
		    <?php include HOME . DS . 'includes' . DS . 'menu.inc.php'; ?>
    <div class="container">
      <form action='' method='post' class="form-signin" role="form">
        <h2 class="form-signin-heading">Upload File</h2>
        <input type="text" name="user" class="form-control" placeholder="account name" required autofocus>
        <input type="password" name="pw" class="form-control" placeholder="Password" required>
	<input type="text" name="path" class="form-control" placeholder="path" required>
	<span class="btn btn-default btn-file ">
	    Browse <input type="file" name="datafile">
	</span>
        <label class="checkbox">
          <input type="checkbox" value="Private"> Private?
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit" name="upload">Upload</button>
      </form>

    </div>
    <?php
    if(isset($_POST['upload']))
    {
    $ftp_server="localhost"; 
    $ftp_user_name=$_POST['user']; 
    $ftp_user_pass=$_POST['pw']; 
    $file = $_POST['path'] . $_POST['datafile'];//tobe uploaded 
    $remote_file = $_POST['datafile']; 
    
    // set up basic connection 
    $conn_id = ftp_connect($ftp_server); 
    
    // login with username and password 
    $login_result = ftp_login($conn_id, $ftp_user_name, $ftp_user_pass); 
    
    // upload a file 
    if (ftp_put($conn_id, $remote_file, $file, FTP_ASCII)) { 
    echo "successfully uploaded $file\n"; 
    exit; 
    } else { 
    echo "There was a problem while uploading $file\n"; 
    exit; 
    } 
    // close the connection 
    ftp_close($conn_id);	
    }
    ?>
		<!-- Bootstrap core JavaScript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/holder.js"></script>
		</body>
	    </html>
