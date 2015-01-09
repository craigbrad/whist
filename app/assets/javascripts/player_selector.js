(function($){
  // todo: use object

  $("#player-selector").on("click", ".add-player", function(){
    var name = $(this).text();
    var player_id = $(this).data("id");

    $(this).hide();

    // todo: use template
    $("#selected-players").append("<a href='#' class='remove-player' data-id='" + player_id + "'>" + name + "</a>");
    pushToPlayerIds(player_id);
  });

  $("#selected-players").on("click", ".remove-player", function(){
    var player_id = $(this).data("id");

    $(this).remove();
    $("#player-selector [data-id='" + player_id + "']").show();
    removeFromPlayerIds(player_id);
  });

  // todo: merge
  function pushToPlayerIds(id) {
    var player_ids_input = $("#game_player_ids");
    var ids = player_ids_input.val() || [];

    ids.push(id);

    player_ids_input.val(ids);
  }

  function removeFromPlayerIds(id) {
    var player_ids_input = $("#game_player_ids");
    var ids = player_ids_input.val();
    var index = ids.indexOf(id);

    ids.splice(index, 1);

    player_ids_input.val(ids);
  }

})(jQuery);