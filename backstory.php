<?php
if (!session_id()) {
    session_start();
}

$_SESSION['userScore'] = 0;
$_SESSION['weaponBoost'] = 0;
$_SESSION['urlArray'] = Array();
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">	
        <title>The Texting Dead</title>  
        <link href="css/holdingCell.css" type="text/css" rel="stylesheet">
        <link href="css/styles.css" type="text/css" rel="stylesheet">
    </head>
    <body onload="smoke()">
        <div id="wrap">
            <canvas id="smoke" width="960" height="720"></canvas>
            <div id="wrapper" style="background-image: url(images/holdingCell.png)">
                <p class="backstory">
                    You awaken in a completely unfamiliar cell, with your head pounding from the party you were at the night before.  The initial disorientation begins to wear off after a few seconds, and your eyes adjust to the fluorescent lighting in the room.  You can see that it is deserted, save for a few empty wooden benches.  You appear to be in the local drunk tank at the police station.  Momentary flashes of the events the night before race through your mind.  Alcohol was consumed….a lot of it.   A quick check of your pockets reveal that they are empty.  They took everything!  Your wallet, your keys, your phone, even your belt….those bastards!<br><br>  You hear a commotion in the distance, and you can vaguely make out words like “Fire!” and “…this is crazy!”  You peer out the cell and can see guards and police officers running back and forth along the hallway in the distance, with their nightsticks drawn and looking frantic.  You yell for help at the top of your lungs, luckily one of the guards notices you.  He rushes over to let you out.  As he is fumbling with the keys and unlocking the door you are able to get a good look at him.  He looks tired, as if he had been up all night.  His uniform has blood stains here and there, and he looks as panicked as the rest of the guards running around.<br><br>
                    <span class="red">&quot;What’s going on?&quot;</span> you ask him once he opens the door.<br><br>
                    <span class="red">&quot;I don’t know…&quot;</span> he says, <span class="red">&quot;there are people attacking people unprovoked.  Biting.  Scratching.  It’s unlike anything I have ever seen.  I have to go, you’d best be on your way, it is not safe here.&quot;</span><br><br>
                    Before you are able to get another question out he rushes off.  No other guards are sparing you a second glance.  You walk along the hallway, following the arrows on the wall that will lead you to the exit.
                </p>
                <div id="backstoryFooter">
                    <a href="index.html">Back</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="story.php?storyID=1">Bring it on!</a>
                </div>
            </div>
        </div>
        <script src="js/smoke.js"></script>
    </body>
</html>