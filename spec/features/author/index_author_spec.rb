require 'rails_helper'

describe "Show author index page", type: :feature do
  it "should exist and display authors' data" do
    FactoryBot.create :author
    visit authors_path
    expect(page).to have_text("Alan")
    expect(page).to have_text("Turing")
    expect(page).to have_text("http://wikipedia.de/Alan_Turing")
    expect(page).to have_link 'New', href: new_author_path
  end

end