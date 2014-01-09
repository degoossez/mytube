<!DOCTYPE html>
 
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title><?php echo $title; ?></title>
    </head>
    <body>
     
        <?php include HOME . DS . 'includes' . DS . 'menu.inc.php'; ?>
         
        <h1>Private Movies</h1>
 
        <?php 
            if ($articles):
            foreach ($articles as $a): ?>
 
            <article>
                <header>
                    <h1><a href="/news/details/<?php echo $a['id']; ?>"><?php echo $a['title']; ?></a></h1>
                    <p><?php echo $a['category_name']; ?></p>
                    <p>Published on: <time pubdate="pubdate"><?php echo $a['date']; ?></time></p>
                </header>
                <p><?php echo $a['intro']; ?></p>
                <p><a href="/news/details/<?php echo $a['id']; ?>">Continue reading</a></p>
                <hr/>
            </article>
        <?php endforeach; endif; ?>
	
<?php
if ($handle = opendir('/var/www/videos/public/')) {
	$counter=0;
    while (false !== ($entry = readdir($handle))) {
        if ($entry != "." && $entry != "..") {
            $counter++;
	
?>
	<video width="320" height="240" controls>
		<source src="/videos/public/<?php echo $entry;?>" type="video/mp4">
		<source src="/videos/public/<?php echo $entry;?>" type="video/ogg">
	Your browser does not support the video tag.
	</video> 
<?php
        }
	if($counter==2)
	{
		?>
		<br>
		<?php
	}
    }
    closedir($handle);
}
?>
        
    </body>
</html>
