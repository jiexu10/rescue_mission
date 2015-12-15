# As a user
# I want to view the answers for a question
# So that I can learn from the answer
#
# Acceptance Criteria
#
# - I must be on the question detail page
# - I must only see answers to the question I'm viewing
# - I must see all answers listed in order, most recent last

require 'rails_helper'

feature 'user answers a question' do
  let(:question) { FactoryGirl.create(:question) }
  let!(:answers) { FactoryGirl.create_list(:answer, 4, question: question)}
  scenario 'navigate to question show page and post answer' do
    visit '/'
    click_link(question.title)
    expect(current_path).to eq(question_path(question))

    answers.each_with_index do |answer, index|
      expect(page).to have_selector("ul li:nth-child(#{4 - (index)})", text: answer.description)
    end
  end
end
