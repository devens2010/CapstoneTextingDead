<?php
if (!session_id()) {
    session_start();
}

    $_SESSION['userScore'] += 10;
    $userScore = $_SESSION['userScore'];
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
    <link href="css/styles.css" type="text/css" rel="stylesheet">
</head>
    <?php

    require 'dbConnect.php';

    $storyID = $_GET['storyID'];
    
    if ($storyID == 43) {
    ?>
<body onload="blood()">
    <div id="wrap">
    <canvas id="blood" width="960" height="720"></canvas>
    <?php
    } else {
        ?>
<body onload="smoke()">
    <div id="wrap">
    <canvas id="smoke" width="960" height="720"></canvas>
    <?php
    }

    $sql = "SELECT * FROM stories WHERE storyID=$storyID";

    try {
        $storyResult = $pdo->query($sql);
    } catch (PDOException $e) {
        echo "ERROR: $e";
        exit();
    }
    while ($row = $storyResult->fetch()) {
        $story = $row['story'];
        $storyID = $row['storyID'];
        $toStory = $row['toStory'];
        $backgroundID = $row['backgroundID'];
        $encounter = $row['encounter'];
        $weapon = $row['weapon'];
    }

    if ($weapon != NULL) {
        $sql = "SELECT * FROM weapons WHERE weaponID=$weapon";
        try {
            $weaponResult = $pdo->query($sql);
        } catch (PDOException $e) {
            echo "ERROR: $e";
        }
        $row = $weaponResult->fetch();
        $weaponBoost = $row['damageBoost'];
        $_SESSION['userScore'] += $weaponBoost;
        $_SESSION['weaponBoost'] = $weaponBoost;
    }

    $sql = "SELECT * FROM backgrounds WHERE backgroundID=$backgroundID";
    try {
        $backgroundResult = $pdo->query($sql);
    } catch (PDOException $e) {
        echo "ERROR: $e";
        exit();
    }

    $row = $backgroundResult->fetch();
    $backgroundURL = $row['backgroundURL'];
    ?>
    <div id="wrapper" style="background-image: url(images/<?= $backgroundURL ?>)">
        <p class="story">
            <?= $story ?>
        </p>
        <ul id="choices">

    <?php
    if ($toStory != NULL) {
        echo "<li><a href='story.php?storyID=$toStory'>Continue</a></li>";
    } else if ($storyID == 48 || $storyID == 43) {
        echo "<li><a href='submitScore.php?score=$userScore'>Submit Score</a></li>";
    } else if ($encounter == 1) {
        echo "<li><a href='encounter.php?fromStory=$storyID&backgroundID=$backgroundID'>Continue</a></li>";
    } else {

        $sql = "SELECT * FROM choices WHERE fromStory=$storyID";

        try {
            $choicesResult = $pdo->query($sql);
        } catch (PDOException $e) {
            echo "ERROR: $e";
            exit();
        }

        while ($row = $choicesResult->fetch()) {
            $choice = $row['choice'];
            $toStory = $row['toStory'];

            echo "<li><a href='story.php?storyID=$toStory'>$choice</a></li>";
        }
    }
    ?>
        </ul>
        <div id="footer">
            <a href="index.html">Home</a>
        </div>
    </div>
    </div>
    <?php
    if ($storyID == 43) {
    ?>
    <script src="js/blood.js"></script>
    <?php
    } else {
    ?>
    <script src="js/smoke.js"></script>
    <?php
    }
    ?>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="js/centerChoices.js"></script>
</body>
</html>