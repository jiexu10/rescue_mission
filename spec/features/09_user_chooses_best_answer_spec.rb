# As a user
# I want to mark an answer as the best answer
# So that others can quickly find the answer
#
# Acceptance Criteria
#
# - I must be on the question detail page
# - I must be able mark an answer as the best
# - I must see the "best" answer above all other answers in the answer list

require 'rails_helper'

feature 'user chooses best answer' do
  let(:question) { FactoryGirl.create(:question)}
  let!(:answers) { FactoryGirl.create_list(:answer, 5, question: question)}

  scenario 'user chooses best answer from question show page' do
    visit question_path(question)

    expect(page).to_not have_selector('li.best-answer')
    expect(page).to have_content('No Best Answer Chosen Yet!')

    within 'ul.answer-list li.other-answer:nth-child(3)' do
      click_button 'Best Answer'
    end

    expect(current_path).to eq(question_path(question))
    expect(page).to_not have_content('No Best Answer Chosen Yet!')
    expect(page).to have_selector('li.best-answer', text: answers[2].description)

    expect(page).to_not have_selector('li.other-answer', text: answers[2].description)

    expect(page.body.index(answers[2].description) < page.body.index(answers.first.description)).to eq(true)
  end
end
