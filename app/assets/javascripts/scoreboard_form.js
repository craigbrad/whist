(function($){

  // autosave
  setInterval(saveScoreboardForm, 10000);

  function saveScoreboardForm() {
    $(".edit_game").submit();
  }

})(jQuery);