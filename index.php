<html>
<head>
    <meta http-equiv="refresh" content="300">
</head>
<body>
<h1>Geschwindigkeitsverlauf</h1>
    <?php
    $images = array_reverse(glob("*.png"));

        foreach($images as $image) {
		        echo '<h3>'.$image.'</h3>';
			            echo '<img src="'.$image.'" /><br />';
			            }
                ?>
</body>
</html>

