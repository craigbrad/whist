var PlayerSelector = (function($, _){
  var PlayerSelector = function(){
  }

  PlayerSelector.init = function(){
    var selector = new PlayerSelector();

    selector.bind();
  }

  PlayerSelector.prototype.bind = function(){
    var _this = this;

    $(".add-player").on("click", function(element){
      _this.addPlayer(element.target);
    });

    $(".remove-player").on("click", function(element){
      _this.removePlayer(element.target);
    });
  }

  PlayerSelector.prototype.addPlayer = function(element) {
    var playerId = $(element).data("player-id");
    var path = $(element).data("post-path");

    $.ajax({
      type: "POST",
      url: path,
      data: { player_id: playerId },
      dataType: "HTML",
      success: function(data) {
        $(element).remove();
        $("#selected-players .panel-body").append(data);
      }
    });
  }

  return PlayerSelector;
})(window.jQuery, window._);

(function($){
  $(document).ready(function() { PlayerSelector.init(); });
})(jQuery);