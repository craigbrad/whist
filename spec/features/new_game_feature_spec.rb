require "spec_helper"

feature "new game" do
  background do
    visit "/games/new"
  end

  scenario "creating valid game" do
    # should redirect to game page on first round
    within("#new_game") do
      fill_in "Number of rounds", with: 10
      select "Damien", from: "Players"
      select "Ste", from: "Players"
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