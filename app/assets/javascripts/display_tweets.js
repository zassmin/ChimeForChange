$(document).ready(function() {
  TweetsController.bindEvents();
});

var TweetsController = {
  bindEvents: function () {
    $(document).on('ajax:success', 'li.click_tag', this.onLinkSuccess);
  },
  onLinkSuccess: function(e, partial, status, xhr) {
    $(this).closest('li.click_tag').append(partial.html);
    // $(this).closest('ul.current_tweets').remove();
  }
}