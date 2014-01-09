	<!DOCTYPE html>
	 
	<html lang="en">
	    <head>
		<meta charset="utf-8" />
		<title><?php echo $title; ?></title>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <!-- Bootstrap -->
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/carousel.css" rel="stylesheet">
	    </head>
	    <body>
	     
		<?php include HOME . DS . 'includes' . DS . 'menu.inc.php'; ?>
		 
	    <!-- Carousel
	    ================================================== -->
	    <div id="myCarousel" class="carousel slide" data-ride="carousel">
    
	  <div class="carousel-inner">
		    <?php
	    if ($handle = opendir('/var/www/videos/public/')) {
		    $counter=0;
		    ?>
			      <!-- Indicators -->
	      <ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	      </ol>
	      <?php
		while (false !== ($entry = readdir($handle)) && $counter<3) {
		    if ($entry != "." && $entry != "..") {
	    ?>      
		<?php if($counter==0)
		{?>
		<div class="item active">
		<img data-src="holder.js/900x500/auto/#777:#7a7a7a/text:First slide" alt="First slide">
		<?php
		}
		elseif($counter==1)
		{?>
		<div class="item">
		<img data-src="holder.js/900x500/auto/#777:#7a7a7a/text:First slide" alt="First slide">
		<?php	    
		}
		elseif($counter==2)
		{?>
		<div class="item">
		<img data-src="holder.js/900x500/auto/#777:#7a7a7a/text:First slide" alt="First slide">
		<?php
		echo "Derde";
		}
		?>
	      <div class="container">
		<div class="carousel-caption">
		    <video width="320" height="240" controls>
			    <source src="/videos/public/<?php echo $entry;?>" type="video/mp4">
			    <source src="/videos/public/<?php echo $entry;?>" type="video/ogg">
		    Your browser does not support the video tag.
		    </video> 
		</div>
	      </div>
	    </div>
			    <?php
			    $counter++;
		    }
		}
		closedir($handle);
	    }
	    else
	    {?>
		<div class="item active">
		<img data-src="holder.js/900x500/auto/#777:#7a7a7a/text:First slide" alt="First slide">
		<div class="container">
		<div class="carousel-caption">
		  <h1>There are no public videos available.</h1>
		  <p>If you think there should be, think again. This is not the real youtube!</p>
		  <p><a class="btn btn-lg btn-primary" href="http://youtube.com" role="button">Go to youtube?</a></p>
		</div>
	      </div>
	      </div>
		<?php
	    }
	    ?>
	  </div>
	  <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
	  <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
	</div><!-- /.carousel -->
		<!-- Bootstrap core JavaScript
	    ================================================== -->
	    <!-- Placed at the end of the document so the pages load faster -->
	    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	    <script src="js/bootstrap.min.js"></script>
	    <script src="js/holder.js"></script>
	    </body>
	</html>
