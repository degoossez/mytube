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
		    <?php ini_set('display_errors','off'); include HOME . DS . 'includes' . DS . 'menu.inc.php'; ?>
    <div class="container">
      <form enctype="multipart/form-data" action='' method='post' class="form-signin" role="form">
        <h2 class="form-signin-heading">Upload File</h2>
        <input type="text" name="user" class="form-control" placeholder="account name" required autofocus>
        <input type="password" name="pw" class="form-control" placeholder="Password" required>
	 <span class="btn btn-default btn-file ">
	    <input type="hidden" name="MAX_FILE_SIZE" value="100000" />
	    Choose a file to upload: <input name="uploadedfile" type="file" /><br />
	</span>

        <label class="checkbox">
          <input type="checkbox" value="Private" name="private"> Private?
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit" name="upload">Upload</button>
      </form>

    </div>

    <?php include HOME . DS . 'includes' . DS . 'ftp_class.php';
    if(isset($_POST['upload']))
    {
	//$target_path = "/var/www/mytube/views/upload/uploads/";
	$target_path = "/tmp/uploads/";
	$target_path = $target_path . basename( $_FILES['uploadedfile']['name']); 
	
	if(move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $target_path)) {
    ?>
	<div class="alert alert-success">
	<a href="#" class="alert-link"><?php echo "The file ".  basename( $_FILES['uploadedfile']['name'])." has been uploaded! \n";
 ?></a>
        </div>
    <?php 

    $ftp_server="localhost"; 
    $ftp_user_name=$_POST['user']; 
    $ftp_user_pass=$_POST['pw']; 
    $file = $target_path;//tobe uploaded
    if (isset($_POST['private'])) {
	$remote_file = '/private/' . basename( $_FILES['uploadedfile']['name']); 
    // Checkbox is selected
    } else {
        $remote_file = '/public/' . basename( $_FILES['uploadedfile']['name']); 
    // Alternate code
    }
    // set up basic connection 
    $conn_id = ftp_connect($ftp_server); 
    if (false === $conn_id) {
        ?>
	<div class="alert alert-warning">
	<a href="#" class="alert-link"><?php echo "FTP connection error!"; ?></a>
        </div>
    <?php 
    }
    else
    {
    // login with username and password 
    $login_result = ftp_login($conn_id, $ftp_user_name, $ftp_user_pass); 
    
    // upload a file 
    if (ftp_put($conn_id, $remote_file, $file, FTP_ASCII)) {
    ?>
	<div class="alert alert-success">
	<a href="#" class="alert-link"><?php echo "successfully uploaded $file\n"; ?></a>
        </div>
    <?php 
    exit; 
    } else {
    ?>
	<div class="alert alert-warning">
	<a href="#" class="alert-link"><?php echo "There was a problem while uploading $file\n"; ?></a>
        </div>
    <?php 
    exit; 
    }
    }
    // close the connection 
    ftp_close($conn_id);	  
	    
	} else{
    ?>
	<div class="alert alert-warning">
	<a href="#" class="alert-link"><?php echo "There was an error uploading the file, please try again!"; ?></a>
        </div>
    <?php    
	}
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
