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
    click_button "Create Game"

    expect(page).to have_css(".error")
  end

  scenario "adding players to game" do
    player_one = add_first_player_from_selector

    # should add player to selected-players
    expect(find("#selected-players")).to have_content(player_one.text)

    # add other players
    player_two = add_first_player_from_selector

    # create game
    fill_in "Number of rounds", with: 10
    click_button "Create Game"

    # should show selected players in players list
    expect(page).to have_content("New Game Created!")
    expect(find("#players")).to have_selector("li", count: 2)
  end

  scenario "removing players from game" do
    add_first_player_from_selector

    # todo: educate self
    # having to do this because the link is obsolete once hidden
    # yet we do not suffer the same problem with add-player, even
    # though that hides the player_link after click... ??
    player_link = first("#selected-players .remove-player")
    player = player_link.text

    player_link.click

    expect(find("#selected-players")).to_not have_content(player)

    expect(find("#player-selector")).to have_content(player)
  end
end

# todo: extract into helper
def add_first_player_from_selector
  player_link = first("#player-selector .add-player")

  player_link.click

  # should remove player from selector
  expect(find("#player-selector")).to_not have_content(player_link.text)

  player_link
end