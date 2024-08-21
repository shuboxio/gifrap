# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: Rails.configuration.x.default_email_from
  layout 'mailer'
end
