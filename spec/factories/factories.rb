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
    # sequence(:uid) { |n| n }
    # sequence(:username) { |n| "jarlax#{n}" }
    # sequence(:email) { |n| "jarlax#{n}@email.com" }
    # sequence(:avatar_url) { |n| "image#{n}.jpeg" }
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
