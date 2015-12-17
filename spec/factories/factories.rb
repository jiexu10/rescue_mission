require 'factory_girl_rails'

FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "sdafdsafwefwafsadfasfwefwafdsagadgawesdfaw#{n}" }
    sequence(:description) { |n| "sdafdsafwefwafsadfasfwefwafdsagadgawesdfawsdafdsafwefwafsadfasfwefwafdsagadgawesdfawsdafdsafwefwafsadfasfwefwafdsagadgawesdfawsdafdsafwefwafsadfasfwefwafdsagadgawesdfaw#{n}"}
    # user
    factory :question_with_markdown do
      sequence(:title) { |n| "sdafdsafwefwafsadfasfwefwafdsagadgawesdfaw#{n}" }
      sequence(:description) { |n| "sdafdsafwefwafsadfasfwefwafdsagadga `wesdfaw` sdafdsafwefwafsadfasfwefwafdsagadgawesdfawsdafdsafwefwafsadfasfwefwafdsagadgawesdfawsdafdsafwefwafsadfasfwefwafdsagadgawesdfaw#{n}"}
      # user
    end
  end

  factory :user do
    provider "facebook"
    uid "MyString"
    name "MyString"
    oauth_token "MyString"
    oauth_expires_at "2015-12-17 13:54:03"
  end

  factory :answer do
    sequence(:description) { |n| "descriptionthatistotallyover50charactersIhopeButItWasntNowItIs#{n}"}
    question
    # user

    factory :answer_with_markdown do
      sequence(:description) { |n| "description `thatis` totallyover==50characters==IhopeButItWasntNowItIs#{n}"}
      question
      # user
    end
  end

end
