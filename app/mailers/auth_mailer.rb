# frozen_string_literal: true

class AuthMailer < ApplicationMailer
  def sign_in_email
    @user = params[:user]
    @url = auth_url(token: @user.token)

    mail(
      to: @user.email,
      subject: t('auth_mailer.sign_in_email.subject')
    )
  end
end
