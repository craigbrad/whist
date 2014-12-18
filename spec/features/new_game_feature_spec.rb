require "spec_helper"

feature "new game" do
  background do
    @players = create_list(:player, 2)
    visit "/games/new"
  end

  scenario "creating valid game" do
    within("#new_game") do
      fill_in "Number of rounds", with: 10
      select @players[0].first_name, from: "Players"
      select @players[1].first_name, from: "Players"
      click_button "Create Game"
    end

    expect(page).to have_content("New Game Created!")
  end

  scenario "attempting to create an invalid game" do
    # should show errors on form
  end

  scenario "adding players to game" do
    # click bunch of players
    # save game
    # players should exist
  end
end