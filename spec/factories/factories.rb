require 'factory_girl_rails'

FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "sdafdsafwefwafsadfasfwefwafdsagadgawesdfaw#{n}" }
    sequence(:description) { |n| "sdafdsafwefwafsadfasfwefwafdsagadgawesdfawsdafdsafwefwafsadfasfwefwafdsagadgawesdfawsdafdsafwefwafsadfasfwefwafdsagadgawesdfawsdafdsafwefwafsadfasfwefwafdsagadgawesdfaw#{n}"}
    # user
  end

  factory :user do
    provider "github"
    sequence(:uid) { |n| n }
    sequence(:username) { |n| "jarlax#{n}" }
    sequence(:email) { |n| "jarlax#{n}@email.com" }
    sequence(:avatar_url) { |n| "image#{n}.jpeg" }
  end

  factory :answer do
    sequence(:description) { |n| "descriptionthatistotallyover50charactersIhopeButItWasntNowItIs#{n}"}
    question
    # user
  end

end
