(function($){
  // todo: use object

  $("#player-selector").on("click", ".add-player", function(){
    var name = $(this).text();
    var player_id = $(this).data("id");

    $(this).hide();

    // todo: use template
    $("#selected-players .panel-body").append("<a href='#' class='remove-player player-pod' data-id='" + player_id + "'>" + name + "</a>");
    pushToPlayerIds(player_id);
    pushToPlayerPositions(player_id);
  });

  $("#selected-players").on("click", ".remove-player", function(){
    var player_id = $(this).data("id");

    $(this).remove();
    $("#player-selector [data-id='" + player_id + "']").show();
    removeFromPlayerIds(player_id);
  });

  // todo: merge
  // todo: add player attributes input field instead (now using player_attributes[id])
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

  function pushToPlayerPositions(id) {
    var form = $("form#new_game");

    // todo: add input and set position
  }

})(jQuery);