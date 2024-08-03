# frozen_string_literal: true

require 'faker'
require 'nanoid'

class ApplicationController < ActionController::Base
  before_action :init_user

  helper_method :current_user

  def current_user
    @current_user ||= @user
  end

  private

  def init_user
    @user = User.where(token: cookies[:token]).first

    return if @user.present?

    token           = Nanoid.generate
    name            = "#{Faker::Color.color_name} #{Faker::Creature::Animal.name}".titleize
    cookies[:token] = { value: token, expires: 5.years.from_now }
    @user           = User.create(token:, name:)
  end
end
