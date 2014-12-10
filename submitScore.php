<?php
if (!session_id()) {
    session_start();
}

if (isset($_POST['submitScore'])) {
    
    require 'dbConnect.php';
    
    if (isset($_POST['uName']) && $_POST['uName'] != "") {
        $userName = $_POST['uName'];
    } else if (isset($_POST['uName']) && $_POST['uName'] == "") {
        $userName = "Guest";
    }
    if (isset($_POST['score'])) {
        $score = $_POST['score'];
    } else {
        echo "Unable to add score with no score!";
        exit();
    }
    
    $sql = "INSERT INTO scores (userName, score) VALUES (:userName, :score)";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':userName', $userName);
    $stmt->bindParam(':score', $score);
    $stmt->execute();
    
    header("Location: leaderboard.php");
    
} else {    // form was NOT submitted
    
    ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">	
        <title>The Texting Dead - Submit Score</title>  
	<audio autoplay loop></audio>
        <link href="css/styles.css" rel="stylesheet">
    </head>
    <body onload="smoke()">
        <div id="wrap">
        <canvas id="smoke" width="960" height="720"></canvas>
        <div id="wrapper">
            <form action="<?=$_SERVER['PHP_SELF']?> " method='post'>
                <table id="submitScore">
                    <tr><td><label for="uName">Username:</label></td><td><input name="uName" type="text" maxlength="12"></td></tr>
                    <tr><td><label for="score">Your Score: </label></td><td><?=$_GET['score']?></td></tr>
                    <tr><td colspan="2"><input id="button" type="submit" value="Submit Score" name="submitScore"></td></tr>
                </table>
                <input type="hidden" name="score" value="<?=$_GET['score']?>">
            </form>
        </div>
        </div>
    <script src="js/smoke.js"></script>
    </body>
</html>
    <?php
}