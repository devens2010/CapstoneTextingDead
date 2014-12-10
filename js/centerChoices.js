$(function() {
    $choicesList = $('ul#choices');
    $wrapper = $('#wrapper');
    $wrapperWidth = $wrapper.width();
    $choicesWidth = $choicesList.width();
    leftString = ($wrapperWidth / 2) - ($choicesWidth / 2) + "px";
    $choicesList.css('left', leftString);
});