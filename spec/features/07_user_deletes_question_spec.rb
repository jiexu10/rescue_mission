# As a user
# I want to delete a question
# So that I can delete duplicate questions
#
# Acceptance Criteria
#
# - I must be able delete a question from the question edit page
# - I must be able delete a question from the question details page
# - All answers associated with the question must also be deleted
require 'rails_helper'

feature 'user deletes a question' do
  let(:question) { FactoryGirl.create(:question) }
  let!(:answers) { FactoryGirl.create_list(:answer, 4, question: question)}
  scenario 'delete question from show page' do
    visit "/"
    click_link(question.title)
    expect(current_path).to eq(question_path(question))

    click_button('Delete Question')

    expect(page).to_not have_selector("ul li", text: question.title)
    expect(page).to have_content("Question #{question.title} successfully deleted!")
  end
end
