<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">	
        <title>The Texting Dead - Leaderboard</title>  
    <audio autoplay loop>
    </audio>
    <link href="css/styles.css" rel="stylesheet">
</head>
<body onload="smoke()">
        <div id="wrap">
        <canvas id="smoke" width="960" height="720"></canvas>
    <div id="wrapper">
        <div id="logo">Leaderboard</div>
        <table id="leaderboard">
            <thead><th>Username</th><th>High Score</th></thead>
            <?php
            require 'dbConnect.php';

            $sql = "SELECT * FROM scores ORDER BY score DESC LIMIT 10";

            $scoreResult = $pdo->query($sql);

            while ($row = $scoreResult->fetch()) {
                $username = $row['userName'];
                $score = $row['score'];
                echo "<tr><td>$username</td><td>$score</td></tr>";
            }
            ?>
        </table>
        <div id="footer">
            <a href="index.html">Home</a>
        </div>
    </div>
    </div>
    <script src="js/smoke.js"></script>
</body>
</html>
