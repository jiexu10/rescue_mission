# As a user
# I want to view a question's details
# So that I can effectively understand the question
#
# Acceptance Criteria
#
# - I must be able to get to this page from the questions index
# - I must see the question's title
# - I must see the question's description

require 'rails_helper'

feature 'user views question show page' do
  let!(:question) { FactoryGirl.create(:question) }

  scenario 'navigates to index and proceeds to show page' do
    visit '/'
    expect(current_path).to eq(root_path)

    click_link(question.title)

    expect(current_path).to eq(question_path(question))
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end
end
