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

            $('.statistics').append(data[0].name +
                " has been married " +
                Math.round(data[0].percentage * 100) + 
                "% of the time <br />");

            $('.statistics').append(data[1].name +
                " has been fucked " +
                Math.round(data[1].percentage * 100) + 
                "% of the time <br />");

            $('.statistics').append(data[2].name +
                " has been killed " +
                Math.round(data[2].percentage * 100) + 
                "% of the time <br />");

            $("#decision-submit").css("visibility", "hidden");
            $(".ugh").css("visibility", "hidden");
            $("#new-options").css("visibility", "visible");
        },
        error: function(xhr, textStatus, errorThrown) {
            alert("There was a problem updating this item.");
        }
    });
  });
});
