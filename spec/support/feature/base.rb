# frozen_string_literal: true

require 'rspec/mocks'

module Feature
  class Base
    include Capybara::DSL
    include Rails.application.routes.url_helpers
    include FactoryBot::Syntax::Methods
    include RSpec::Mocks::ExampleMethods

    attr_reader :user, :email

    delegate :t, to: I18n

    def submit
      find('input.btn').click
    end

    def has_an_error_message?(message = nil)
      if message
        has_css?('.flash.flash-error') && has_content?(message)
      else
        has_css? '.flash.flash-error'
      end
    end

    def open_email
      @email = ActionMailer::Base.deliveries.first.parts.first.body.raw_source
    end
  end
end
