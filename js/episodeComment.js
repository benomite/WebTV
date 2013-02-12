$(document).ready(function(){
    $('a.down-vote').click(function(){
        var button = $(this);
        var id = button.parent().attr('class');
        $.ajax({
            type: "POST",
            url: "/WebTV/index.php/episodeComment/updateVoteAjax",
            data: { comment: id, value: -1 }
        }).success(function( newSum ) {
            button.parent().parent().find('.vote-num').text(newSum);
            console.log(button);
        });
    });

    $('a.up-vote').click(function(){
        var button = $(this);
        var id = button.parent().attr('class');
        $.ajax({
            type: "POST",
            url: "/WebTV/index.php/episodeComment/updateVoteAjax",
            data: { comment: id, value: 1 }
        }).success(function( newSum ) {
            button.parent().parent().find('.vote-num').text(newSum);
            console.log(button);
        });
    });

    $('a.down-vote, a.up-vote').tooltip();
});