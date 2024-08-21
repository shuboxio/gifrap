# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method \
    :current_user,
    :turbo_frame?,
    :signed_in?,
    :signed_out?

  def current_user
    @current_user ||= signed_in_user || temp_user || new_temp_user
  end

  def turbo_frame?
    request.headers['Turbo-Frame'].present?
  end

  def signed_in? = cookies.signed[:uid].present?

  def signed_out? = !signed_in?

  private

  def signed_in_user
    User.find_by(id: cookies.signed[:uid])
  end

  def temp_user
    User.find_by(token: cookies.signed[:token])
  end

  def new_temp_user
    @first_visit = true
    token = Nanoid.generate
    name = User.temp_name
    cookies.signed[:token] = { value: token, expires: 5.years.from_now }

    User.create(token:, name:)
  end
end
