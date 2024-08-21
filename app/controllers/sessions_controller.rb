# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @session = SessionForm.new
  end

  def create
    @session = SessionForm.new(sign_in_params)

    if @session.valid?
      @session.save!(current_user)

      redirect_to root_path, notice: t('.created'), status: :see_other
    else
      render :new
    end
  end

  private

  def sign_in_params
    params.require(:session).permit(:email)
  end
end
