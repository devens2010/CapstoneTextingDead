<?php
if (!session_id()) {
    session_start();
}

    $url = $_SERVER['REQUEST_URI'];
    
    if (in_array($url, $_SESSION['urlArray'])) {
        header("Location: cheaterPage.html");
    } else {
        array_push($_SESSION['urlArray'], $url);
    }
    
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">	
        <title>The Texting Dead</title>  
        <!--<audio autoplay loop>
                <source src="theme.mp3" type="audio/mpeg">
        </audio>-->
        <link href="css/styles.css" type="text/css" rel="stylesheet">
    </head>
    <body onload="smoke()">
        <div id="wrap">
        <canvas id="smoke" width="960" height="720"></canvas>
        <?php
        
        require 'dbConnect.php';
        
        $backgroundID = $_GET['backgroundID'];
        $fromStory = $_GET['fromStory'];
        
        $sql = "SELECT * FROM backgrounds WHERE backgroundID=$backgroundID";
        try {
            $backgroundResult = $pdo->query($sql);
        } 
        catch (PDOException $e) {
            echo "ERROR: $e";
            exit();
        }
        $row = $backgroundResult->fetch();
        $backgroundURL = $row['backgroundURL'];
        ?>
        <div id="wrapper" style="background-image: url(images/<?=$backgroundURL?>)">
        <?php
        $sql = "SELECT * FROM encounters WHERE fromStory=$fromStory";
        try {
            $encounterResult = $pdo->query($sql);
        } 
        catch (PDOException $e) {
            echo "ERROR: $e";
            exit();
        }
        $row = $encounterResult->fetch();
        $cpuScore = $row['cpuScore'];
        $numDice = $row['numDice'];
        $winStory = $row['win'];
        $loseStory = $row['lose'];
        
        $randNums = Array();
        ?>
            <ul id="diceRolls">
                <li>You are in a fight! Beat your opponent to win.</li>
                <li>Your Scores:</li>
        <?php
        for ($i = 0; $i < $numDice; $i++) {
            $randomNumber = rand(1, 100);
            array_push($randNums, $randomNumber);
            echo "<li>$randomNumber</li>";
        }
        ?>
            </ul>
            <ul id="choices">
        <?php
        $playerScore = array_sum($randNums) + $_SESSION['weaponBoost'];
        echo "<li id='total'>Your total score: $playerScore</li>";
        
        if ($playerScore >= $cpuScore) {
            echo "<li><a href='story.php?storyID=$winStory'>Win, Continue</a></li>";
            $_SESSION['userScore'] *= 2;
        } else {
            echo "<li><a href='story.php?storyID=$loseStory'>Lose, Continue</a></li>";
        }
        
        ?>
            </ul>
        </div>
        </div>
    <script src="js/smoke.js"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="js/centerChoices.js"></script>
    </body>
</html>