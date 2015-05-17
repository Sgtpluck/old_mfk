$(document).ready(function(){

  $('#decision-submit').click(function(e) {
    e.preventDefault();
    var error = $('.error');
    error.empty();
    var decisions = {};
    var options = $('.option');

    var decisions = {};
    var options = ['marry', 'fuck', 'kill']

    $('.names').map(function(idx, name) {
        var person = name.innerText;
        decisions[options[idx]] = person;
    });

    var token = $('#token');
    $.ajax({
        type: 'POST',
        url: '/vote',
        data: {
            decisions: decisions,
            "authenticity_token": token.val()
        },
        success: function (data) {
            console.log(data);

            $('.statistics').append(decisions["marry"] +
                " has been married X% of the time <br />");

            $('.statistics').append(decisions["fuck"] +
                " has been fucked X% of the time <br />");

            $('.statistics').append(decisions["kill"] +
                " has been killed X% of the time <br />");
        },
        error: function(xhr, textStatus, errorThrown) {
            alert("There was a problem updating this item.");
        }
    });
  });
});
