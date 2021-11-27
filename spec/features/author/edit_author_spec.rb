require 'rails_helper'

describe "Edit author page", type: :feature do
  it "should exist and render infos of author" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
  end

  it "should save changes" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
    page.fill_in 'author[first_name]', with: 'Leo'
    page.fill_in 'author[last_name]', with: 'Szilard'
    page.fill_in 'author[homepage]', with: 'https://de.wikipedia.org/wiki/Le%C3%B3_Szil%C3%A1rd'
    find('input[type="submit"]').click

    @alan.reload
    expect(@alan.first_name).to eq('Leo')
    expect(@alan.last_name).to eq('Szilard')
    expect(@alan.homepage).to eq('https://de.wikipedia.org/wiki/Le%C3%B3_Szil%C3%A1rd')
  end
end