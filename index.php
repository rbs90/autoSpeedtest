<html>
<head>
    <meta http-equiv="refresh" content="300">
</head>
<body>
    <?php
    $images = array_reverse(glob("*.png"));

        foreach($images as $image) {
		        echo '<h3>'.$image.'</h3>';
			            echo '<img src="'.$image.'" /><br />';
			            }
                ?>
</body>
</html>

