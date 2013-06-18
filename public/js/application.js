function refreshTweets(){
  $.ajax({
    url: '/updated',
    data: "username=" + window.location.pathname.replace('/','')
  }).done(function(response){
    $('#waiting').hide();
    $('body').html(response);
  });
  $('#waiting').show();
}

$(document).ready(function() {
  if($('#tweets').data('stale')){
    refreshTweets();
  }
  $(document).on("click", '#refresh', refreshTweets);

});
