# As a user
# I want to write my questions and answers with markdown
# So I can easily format my questions and answers
#
# Acceptance Criteria
#
# - I can write my questions and answers using markdown syntax
# - Questions and answers, when shown, should be the HTML rendered from the
#   markdown

require 'rails_helper'

feature 'questions and answers allow markdown input' do
  let(:question) { FactoryGirl.create(:question_with_markdown)}
  let!(:answers) { FactoryGirl.create(:answer_with_markdown, question: question)}

  scenario 'adds markdown to question' do
    visit question_path(question)
    expect(page).to have_selector("code", text: 'wesdfaw')
  end

  scenario 'adds markdown to answer' do
    visit question_path(question)

    expect(page).to have_selector("code", text: 'thatis')
    expect(page).to have_selector("mark", text: '50characters')
  end
end
