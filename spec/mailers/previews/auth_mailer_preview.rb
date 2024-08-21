# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/auth_mailer
class AuthMailerPreview < ActionMailer::Preview
  def sign_in_email
    AuthMailer.with(user: User.first).sign_in_email
  end
end
