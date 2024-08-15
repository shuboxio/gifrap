# frozen_string_literal: true

module Feature
  class SignIn < Feature::Base
    def visit_home
      visit root_path
    end

    def click_sign_in
      click_on 'Sign In'
    end

    def fill_in_and_submit
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Name', with: 'John Doe'
      click_on 'Send Email'
    end

    def visit_magic_link_in_email
      visit magic_link_in_email
    end

    def has_sent_an_email_with_magic_link?
      ActionMailer::Base.deliveries.any? do |email|
        email.to.include?('http://example.com/auth/')
      end
    end

    def has_signed_in?
      within '[data-name]' do
        has_content? 'John Doe'
      end
    end
  end
end
