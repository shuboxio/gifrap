# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    user

    url { 'https://picsum.photos/200/300' }
    variants { {} }
    nsfw { DateTime.current }
  end
end
