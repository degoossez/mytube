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
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0"></li>
	<?php if($counter>1){ ?>
        <li data-target="#myCarousel" data-slide-to="1"></li>
	<?php if($counter>2){ ?>
        <li data-target="#myCarousel" data-slide-to="2"></li>
	<?php }
	} ?>
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <img data-src="holder.js/900x500/auto/#777:#7a7a7a/text:First slide" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1><?php echo $FileList[0];?></h1>
	    <video width="320" height="240" controls>
		    <source src="/videos/public/<?php echo $FileList[0];?>" type="video/mp4">
		    <source src="/videos/public/<?php echo $FileList[0];?>" type="video/ogg">
	    Your browser does not support the video tag.
	    </video> 
            </div>
          </div>
        </div>
		<?php if($counter>1){ ?>
        <div class="item">
		<img data-src="holder.js/900x500/auto/#777:#7a7a7a/text:Second slide" alt="Second slide">
			<div class="container">
            <div class="carousel-caption">
              <h1><?php echo $FileList[1];?></h1>
	    <video width="320" height="240" controls>
		    <source src="/videos/public/<?php echo $FileList[1];?>" type="video/mp4">
		    <source src="/videos/public/<?php echo $FileList[1];?>" type="video/ogg">
	    Your browser does not support the video tag.
	    </video> 
            </div>
          </div>
        </div>
		<?php if($counter>2){ ?>

        <div class="item">
          <img data-src="holder.js/900x500/auto/#555:#5a5a5a/text:Third slide" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1><?php echo $FileList[2];?></h1>
	    <video width="320" height="240" controls>
		    <source src="/videos/public/<?php echo $FileList[2];?>" type="video/mp4">
		    <source src="/videos/public/<?php echo $FileList[2];?>" type="video/ogg">
	    Your browser does not support the video tag.
	    </video> 
            </div>
          </div>
        </div>
		<?php } } ?>
      </div>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
    </div><!-- /.carousel -->
    <div class="container">
	<?php for($j=0;$j<$counter;$j++) { ?>
	  <div class="row">
	    <?php for($i=0;$i<3 && $j<$counter;$i++){ ?>
	    <div class="col-md-4">
	      <h2><?php echo $FileList[$j];?></h2>
	      <p>
		    <video width="320" height="240" controls>
			<source src="/videos/public/<?php echo $FileList[$j];?>" type="video/mp4">
			<source src="/videos/public/<?php echo $FileList[$j];?>" type="video/ogg">
			Your browser does not support the video tag.
		    </video> 
	      </p>
	    </div>
	    <?php $j++;} ?>
	  </div>
	<?php } ?>
    </div>
		<!-- Bootstrap core JavaScript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/holder.js"></script>
		</body>
	    </html>
