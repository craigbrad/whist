var Scoreboard = (function($, _) {

  // todo: major refactorings!
  // todo: extract player round into object

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
      _this.calculateScore($(element.target));
    });

    this.contractElement.on("change keyup", function(element){
      _this.calculateScore($(element.target));
    });
  }

  Scoreboard.prototype.calculateScore = function(element) {
    var playerRound = this.playerRound(element);
    var score = this.playerRoundScore(playerRound);

    this.setScoreOnPlayerRound(playerRound, score);
  }

  Scoreboard.prototype.rowOfElement = function(element) {
    var row = element.closest("tr");
    var elements = row.find(".game_rounds_player_rounds_bid input, .game_rounds_player_rounds_contracts input");

    return elements;
  }

  Scoreboard.prototype.playerRound = function(element) {
    var playerRoundNum = $(element).attr("id").match(/player_rounds_attributes_(\d+)/)[1];

    if($(element).parent().hasClass('game_rounds_player_rounds_bid')) {
      return {
        bid: $(element),
        contracts: $(element).parent().parent().next("td").find("input"),
        num: playerRoundNum
      }
    } else {
      return {
        bid: $(element).parent().parent().prev("td").find("input"),
        contracts: $(element),
        num: playerRoundNum
      }
    }
  }

  Scoreboard.prototype.playerRoundScore = function(playerRound) {
    var previousScore = this.previousScore(playerRound);
    var bid = parseInt(playerRound.bid[0].value);
    var contracts = parseInt(playerRound.contracts[0].value);
    var score = contracts;

    if(bid == contracts) {
      score += 10;
    }

    return previousScore + score;
  }

  Scoreboard.prototype.previousScore = function(playerRound) {
    var previousRound = $(playerRound.bid).closest("tr").prevAll(".player_rounds")[0];

    if(previousRound != undefined) {
      var roundInputs = $(previousRound).find("input.integer");
      var previousRoundElement = roundInputs[playerRound.num * 2];
      var scoreElement = $(previousRoundElement).closest("td").nextAll(".score").first();

      return parseInt(scoreElement.text());
    } else {
      return 0;
    }
  }

  Scoreboard.prototype.setScoreOnPlayerRound = function(playerRound, score) {
    var scoreElement = $(playerRound.bid).closest("td").nextAll(".score").first();

    scoreElement.text(score);
  }

  return Scoreboard;
})(window.jQuery, window._);

(function($){
  $(document).ready(function() { Scoreboard.init(); });
})(jQuery);