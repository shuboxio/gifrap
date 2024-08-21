# frozen_string_literal: true

class AuthController < ApplicationController
  def create
    update_user
    update_cookies

    redirect_to root_path
  end

  private

  def update_user
    user.update!(token: new_token)
  end

  def new_token
    @new_token ||= Nanoid.generate
  end

  def user
    @user ||= User.find_by!(token: params[:token])
  end

  def update_cookies
    cookies.signed[:token] = { value: new_token, expires: 5.years.from_now }
    cookies.signed[:uid] = { value: user.id, expires: 5.years.from_now }
  end
end
