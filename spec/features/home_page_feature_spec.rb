require "spec_helper"

feature "home page" do
  background do
    visit "/"
  end

  scenario "visiting home page" do
    expect(page).to have_content("New Game")
  end
end