$(document).ready(function() {
  TweetsController.bindEvents();
});

var TweetsController = {
  bindEvents: function () {
    $(document).on('ajax:success', 'li', this.onLinkSuccess);
  },
  onLinkSuccess: function(e, partial, status, xhr) {
    $('li.current_tweets').find('ul').remove();
    $(this).closest('li').append(partial.html);
    $('.current_tweets').removeClass();
    $(this).addClass('current_tweets');
  }
}