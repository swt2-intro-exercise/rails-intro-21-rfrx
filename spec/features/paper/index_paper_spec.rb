require 'rails_helper'

describe "Show paper index page", type: :feature do
  
  it "should exist and display data for papers" do
    FactoryBot.create :paper
    visit papers_path
    expect(page).to have_text("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(page).to have_text("Mind 49: 433-460")
    expect(page).to have_text("1950")
    expect(page).to have_link 'New Paper', href: new_paper_path
  end

  it "should link to edit page" do
    @paper = FactoryBot.create :paper
    visit papers_path
    expect(page).to have_link 'Edit', href: edit_paper_path(@paper)
  end

  it "should have delete link and delete the paper" do
    @paper = FactoryBot.create :paper
    visit papers_path
    expect(page).to have_link 'Destroy'
    expect(Paper.count).to eq(1)
    find('a[data-method="delete"]').click
    expect(Paper.count).to eq(0)
  end

  it "should filter the papers" do
    @paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    @paper.save
    @paper2 = Paper.new(title: "Chemical separation of the radioactive element from its bombarded isotope in the Fermi effect", venue: "Mind 44: 723-738", year: 1934)
    @paper2.save
    visit '/papers?year=1934'
    expect(page).to have_text("Chemical separation of the radioactive element from its bombarded isotope in the Fermi effect")
    expect(page).to have_text("Mind 44: 723-738")
    expect(page).to have_text("1934")
    expect(page).to_not have_text("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(page).to_not have_text("Mind 49: 433-460")
    expect(page).to_not have_text("1950")
  end
  
end