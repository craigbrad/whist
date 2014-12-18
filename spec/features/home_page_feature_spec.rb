require "spec_helper"

feature "home page" do
  background do
    visit "/"
  end

  scenario "visiting home page" do
    expect(page.status_code).to eq(200)
  end
end