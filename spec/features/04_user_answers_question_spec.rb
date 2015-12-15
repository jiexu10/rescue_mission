# As a user
# I want to answer another user's question
# So that I can help them solve their problem
#
# Acceptance Criteria
#
# - I must be on the question detail page
# - I must provide a description that is at least 50 characters long
# - I must be presented with errors if I fill out the form incorrectly

require 'rails_helper'

feature 'user answers a question' do
  let!(:question) { FactoryGirl.create(:question) }
  scenario 'navigate to question show page and post answer' do
    visit '/'
    click_link(question.title)
    expect(current_path).to eq(question_path(question))

    description = 'fkldajsfldsjflaksjdlfkjsadlfjadflsdkfjlsdjflasdkjflasjfklsdjflksadjfljsadlkfjaslkdjfksfjlskadjfkldsjflkdsajflaksdjflsdjflksdajf'
    fill_in('answer[description]', with: description)
    click_button('Create Answer')

    expect(page).to have_content('Answer Created Successfully!')
    expect(page).to have_content(description)
    expect(current_path).to eq(question_path(question))
  end

  scenario 'attempts answer with invalid description' do
    visit "#{question_path(question)}"

    short_description = 'asdfdasljf'
    fill_in('answer[description]', with: short_description)
    click_button('Create Answer')

    expect(find_field('answer[description]').value).to eq(short_description)
    expect(page).to have_content('1 error prohibited this answer from being saved:')
    expect(page).to have_content('Description is too short (minimum is 50 characters)')
  end
end
