$(document).ready(function() {
  TweetsController.bindEvents();
});

var TweetsController = {
  bindEvents: function () {
    $(document).on('ajax:success', 'li', this.onLinkSuccess);
    $(document).on('ajax:success', 'li.current_tweets', this.onLinkHide);
  },
  onLinkSuccess: function(e, partial, status, xhr) {
    $('li.current_tweets').find('ul').remove();
    $(this).closest('li').append(partial.html);
    $('.current_tweets').removeClass();
    $(this).addClass('current_tweets');
  },
  onLinkHide: function(e, partial, status, xhr) {
    $('li.current_tweets').find('ul').toggle();
     $('.current_tweets').removeClass();
  }
}