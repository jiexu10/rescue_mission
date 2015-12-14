# As a user
# I want to post a question
# So that I can receive help from others
#
# Acceptance Criteria
#
# - I must provide a title that is at least 40 characters long
# - I must provide a description that is at least 150 characters long
# - I must be presented with errors if I fill out the form incorrectly

require 'rails_helper'

feature 'user posts a question' do
  scenario 'navigate to new page and post question' do
    visit '/'
    click_link('New Question')

    expect(current_path).to eq(new_question_path)
    title = 'sometitlesadfjldkfjladjfkdsjfaldkfjlsajdfls'
    description = 'adklsfjdlsjfladjflksdjflksadjfldsajflkadsjfldajfkldajsfldsjflaksjdlfkjsadlfjadflsdkfjlsdjflasdkjflasjfklsdjflksadjfljsadlkfjaslkdjfksfjlskadjfkldsjflkdsajflaksdjflsdjflksdajf'
    fill_in('question[title]', with: title)
    fill_in('question[description]', with: description)
    click_button('Create Question')

    expect(current_path).to eq(question_path(Question.last))
    expect(page).to have_content('Question Created Successfully!')
    expect(page).to have_content(title)
    expect(page).to have_content(description)
  end

  scenario 'attempts post with invalid title' do
    visit "#{new_question_path}"

    title = 'kdsjfaldkfjlsajdfls'
    description = 'adklsfjdlsjfladjflksdjflksadjfldsajflkadsjfldajfkldajsfldsjflaksjdlfkjsadlfjadflsdkfjlsdjflasdkjflasjfklsdjflksadjfljsadlkfjaslkdjfksfjlskadjfkldsjflkdsajflaksdjflsdjflksdajf'
    fill_in('question[title]', with: title)
    fill_in('question[description]', with: description)
    click_button('Create Question')

    expect(find_field('question[title]').value).to eq(title)
    expect(find_field('question[description]').value).to eq(description)
    expect(page).to have_content('1 error prohibited this article from being saved:')
    expect(page).to have_content('Title is too short (minimum is 40 characters)')
  end

  scenario 'attempts post with invalid description' do
    visit "#{new_question_path}"

    title = 'kdsjfaldkfjlsajdflsasdkfalskjdfkasjdfkasjdfkjaskdjfasdfsadkfkasjflkasjdf'
    description = 'adklsfjdlsjflad'
    fill_in('question[title]', with: title)
    fill_in('question[description]', with: description)
    click_button('Create Question')

    expect(find_field('question[title]').value).to eq(title)
    expect(find_field('question[description]').value).to eq(description)
    expect(page).to have_content('1 error prohibited this article from being saved:')
    expect(page).to have_content('Description is too short (minimum is 150 characters)')
  end

  scenario 'attempts post with invalid description and invalid title' do
    visit "#{new_question_path}"

    title = 'kasjflkasjdf'
    description = 'adklsfjdlsjflad'
    fill_in('question[title]', with: title)
    fill_in('question[description]', with: description)
    click_button('Create Question')

    expect(find_field('question[title]').value).to eq(title)
    expect(find_field('question[description]').value).to eq(description)
    expect(page).to have_content('2 errors prohibited this article from being saved:')
    expect(page).to have_content('Title is too short (minimum is 40 characters)')
    expect(page).to have_content('Description is too short (minimum is 150 characters)')
  end
end
