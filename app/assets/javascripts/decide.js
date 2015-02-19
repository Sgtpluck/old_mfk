$(document).ready(function(){
  $('#decision-submit').click(function(e) {
    e.preventDefault();
    var error = $('.error');
    error.empty();
    var marry = $('#marry').val();
    var fuck = $('#fuck').val();
    var kill = $('#kill').val();
    if ($.unique([marry,fuck,kill]).length !== 3) {
      error.append('You need to fuck, marry, and kill someone unique, silly. No cheating.');
      return;
    }
    $.ajax({
        type: 'POST',
        url: '/vote',
        data: {
            'choices[marry]': $('#marry').val(),
            'choices[fuck]': $('#fuck').val(),
            'choices[kill]': $('#kill').val(),
        },
        success: function (data) {
            console.log(data);
        },
        error: function(xhr, textStatus, errorThrown) {
            alert("There was a problem updating this item.");
        }
    });
  });
});

// "authenticity_token"=>"/MJJC6qciqOum8crUcdFMcaEUAIWLnLw5QN7OP2bFzEY4km0OcI7OnxDwy6odiQbCKDjpqXYilS7LnWNZKq2Rg==", "marry"=>"mario batali", "fuck"=>"mario batali", "kill"=>"mario batali", "commit"=>"DECIDE", "method"=>"post", "controller"=>"home", "action"=>"vote"}

