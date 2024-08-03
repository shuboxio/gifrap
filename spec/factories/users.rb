# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    token { "1234skdjhf" }
    name { "John Doe" }
  end
end
