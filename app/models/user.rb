# frozen_string_literal: true

class User < ApplicationRecord
  has_many :images, dependent: :destroy

  def self.temp_name
    "#{Faker::Color.color_name} #{Faker::Creature::Animal.name}".titleize
  end
end
