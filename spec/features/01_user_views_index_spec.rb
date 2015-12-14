# As a user
# I want to view recently posted questions
# So that I can help others
#
# Acceptance Criteria
#
# - I must see the title of each question
# - I must see questions listed in order, most recently posted first

require 'rails_helper'

feature 'user views index' do
  let!(:questions) { FactoryGirl.create_list(:question, 5) }

  scenario 'navigates to index, sees list sorted by created_at time' do
    visit '/'
    expect(current_path).to eq(root_path)

    questions.each_with_index do |question, index|
      expect(page).to have_selector("ul li:nth-child(#{5 - (index)})", text: question.title)
    end
  end
end
