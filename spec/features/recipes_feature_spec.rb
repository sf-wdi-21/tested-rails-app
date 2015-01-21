require 'rails_helper'

feature 'Managing Recipes', type: :feature do
  given(:recipe) { FactoryGirl.create(:recipe) }
  #let(:recipe) { FactoryGirl.create(:recipe) }

  scenario 'creating a new recipe' do
    visit '/recipes/new'

    fill_in 'Title', with: 'Chocolate Milk'
    fill_in 'Instructions', with: 'step 1: drink it'

    click_button 'Save'

    expect(page).to have_content 'Success'
    expect(page).to have_content 'Chocolate Milk'
  end

  scenario 'adding category to a recipe' do
    visit "/recipes/#{recipe.id}/edit"
    fill_in 'Category', with: 'Burgers'
    click_button 'Save'

    within('.recipe_category') do
      expect(page).to have_content 'Burgers'
    end
  end

  scenario 'showing a recipe' do
    visit "/recipes/#{recipe.id}"

    expect(page).to have_content recipe.title
    expect(page).to have_content recipe.instructions
  end

  scenario 'updating a recipe' do
    visit "/recipes/#{recipe.id}/edit"

    fill_in 'Title', with: 'SECRET_TITLE'

    click_button 'Save'

    expect(page).to have_content 'SECRET_TITLE'
    expect(page).not_to have_content recipe.title
  end

  scenario 'deleting a recipe' do
    visit "/recipes/#{recipe.id}"

    click_link 'Delete'

    expect {
      visit "/recipes/#{recipe.id}"
    }.to raise_error ActiveRecord::RecordNotFound
  end
end
