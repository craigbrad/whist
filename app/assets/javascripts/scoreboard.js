var Scoreboard = (function($, _) {

  var Scoreboard = function(){
    // todo: set properties
    this.bidElement = $(".game_rounds_player_rounds_bid input");
    this.contractElement = $(".game_rounds_player_rounds_contracts input");
  }

  Scoreboard.init = function() {
    var scoreboard = new Scoreboard();

    scoreboard.bind();
  }

  Scoreboard.prototype.bind = function(){
    var _this = this;

    this.bidElement.on("change keyup", function(element){
      _this.calculate_score($(element.target));
    });
  }

  Scoreboard.prototype.calculate_score = function(element) {
    if(this.rowOfElementComplete(element)) {
      // todo: calc
    }
  }

  Scoreboard.prototype.rowOfElementComplete = function(element) {
    var row = this.rowOfElement(element);

    // todo: loop through row elements and check that all
    // have data
  }

  Scoreboard.prototype.rowOfElement = function(element) {
    var row = element.closest("tr");
    var elements = row.find(".game_rounds_player_rounds_bid input, .game_rounds_player_rounds_contracts input");

    return elements;
  }

  return Scoreboard;
})(window.jQuery, window._);

(function($){
  $(document).ready(function() { Scoreboard.init(); });
})(jQuery);