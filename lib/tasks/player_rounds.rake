namespace :player_rounds do
  task :score => :environment do
    # go through each player round
    # calc score
    # stop when on last round

    PlayerRound.all.each(&:calculate_scores)

    PlayerRound.all.each do |player_round|
      player_round.calculate_scores
      player_round.save
    end
  end
end