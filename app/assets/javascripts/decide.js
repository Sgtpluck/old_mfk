$(document).ready(function(){

  $('#decision-submit').click(function(e) {
    e.preventDefault();
    var error = $('.error');
    error.empty();
    var decisions = {};
    var options = $('.option');

    var people = $('.person');
    people.map(function (idx, person) {
        var PersonRect = person.getBoundingClientRect();
        
        options.map(function(idx, option) {
            optionRect = option.getBoundingClientRect();
            if (optionRect.bottom > PersonRect.bottom &&
                optionRect.top < PersonRect.top &&
                optionRect.left < PersonRect.left &&
                optionRect.right > PersonRect.right) {
                decisions[option.id] = person.innerText;
            }
        });

    });
    if ( Object.keys(decisions).length !== 3) {
      error.append('You need to fuck, marry, and kill someone unique, silly. No cheating.');
      return;
    }
    var token = $('#token');
    $.ajax({
        type: 'POST',
        url: '/vote',
        data: {
            decisions: decisions,
            "authenticity_token": token.val()
        },
        success: function (data) {
            window.location.reload().promise().done(function (data) {
                $('.statistics').append('this is where the stats go');
                $('.statistics').append(data[0]);
                console.log(data);
            });
        },
        error: function(xhr, textStatus, errorThrown) {
            alert("There was a problem updating this item.");
        }
    });
  });
});
