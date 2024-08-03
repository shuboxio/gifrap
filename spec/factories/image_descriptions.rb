# frozen_string_literal: true

FactoryBot.define do
  factory :image_description do
    image

    description { 'sample gif' }
  end
end
