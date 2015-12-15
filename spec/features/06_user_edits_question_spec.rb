# As a user
# I want to edit a question
# So that I can correct any mistakes or add updates
#
# Acceptance Criteria
#
# - I must provide valid information
# - I must be presented with errors if I fill out the form incorrectly
# - I must be able to get to the edit page from the question details page

require 'rails_helper'

feature 'user edits a question' do
  let!(:question) { FactoryGirl.create(:question) }
  scenario 'navigate to question show page and edit question' do
    visit '/'
    click_link(question.title)
    expect(current_path).to eq(question_path(question))

    click_link('Edit Question')
    expect(find_field('question[title]').value).to eq(question.title)
    expect(find_field('question[description]').value).to eq(question.description)

    title = 'sometitlesadfjldkfjladjfkdsjfaldkfjlsajdfls'
    description = 'adklsfjdlsjfladjflksdjflksadjfldsajflkadsjfldajfkldajsfldsjflaksjdlfkjsadlfjadflsdkfjlsdjflasdkjflasjfklsdjflksadjfljsadlkfjaslkdjfksfjlskadjfkldsjflkdsajflaksdjflsdjflksdajf'
    fill_in('question[title]', with: title)
    fill_in('question[description]', with: description)
    click_button('Update Question')

    expect(current_path).to eq(question_path(question))
    expect(page).to have_content(title)
    expect(page).to have_content(description)
  end

  scenario 'attempts post with invalid title' do
    visit "#{edit_question_path(question)}"

    expect(find_field('question[title]').value).to eq(question.title)
    expect(find_field('question[description]').value).to eq(question.description)

    short_title = 'kdsjfaldkfjlsajdfls'
    description = 'adklsfjdlsjfladjflksdjflksadjfldsajflkadsjfldajfkldajsfldsjflaksjdlfkjsadlfjadflsdkfjlsdjflasdkjflasjfklsdjflksadjfljsadlkfjaslkdjfksfjlskadjfkldsjflkdsajflaksdjflsdjflksdajf'
    fill_in('question[title]', with: short_title)
    fill_in('question[description]', with: description)
    click_button('Update Question')

    expect(find_field('question[title]').value).to eq(short_title)
    expect(find_field('question[description]').value).to eq(description)
    expect(page).to have_content('1 error prohibited this question from being saved:')
    expect(page).to have_content('Title is too short (minimum is 40 characters)')
  end

  scenario 'attempts post with invalid description' do
    visit "#{edit_question_path(question)}"

    expect(find_field('question[title]').value).to eq(question.title)
    expect(find_field('question[description]').value).to eq(question.description)

    title = 'kdsjfaldkfjlsajdflsasdkfalskjdfkasjdfkasjdfkjaskdjfasdfsadkfkasjflkasjdf'
    short_description = 'adklsfjdlsjflad'
    fill_in('question[title]', with: title)
    fill_in('question[description]', with: short_description)
    click_button('Update Question')

    expect(find_field('question[title]').value).to eq(title)
    expect(find_field('question[description]').value).to eq(short_description)
    expect(page).to have_content('1 error prohibited this question from being saved:')
    expect(page).to have_content('Description is too short (minimum is 150 characters)')
  end

  scenario 'attempts post with invalid description and invalid title' do
    visit "#{edit_question_path(question)}"

    expect(find_field('question[title]').value).to eq(question.title)
    expect(find_field('question[description]').value).to eq(question.description)

    short_title = 'kasjflkasjdf'
    short_description = 'adklsfjdlsjflad'
    fill_in('question[title]', with: short_title)
    fill_in('question[description]', with: short_description)
    click_button('Update Question')

    expect(find_field('question[title]').value).to eq(short_title)
    expect(find_field('question[description]').value).to eq(short_description)
    expect(page).to have_content('2 errors prohibited this question from being saved:')
    expect(page).to have_content('Title is too short (minimum is 40 characters)')
    expect(page).to have_content('Description is too short (minimum is 150 characters)')
  end
end
