# frozen_string_literal: true

module Feature
  class SignIn < Feature::Base
    # Steps

    def visit_home
      visit root_path
    end

    def click_sign_in
      within 'nav' do
        click_on 'Sign In'
      end
    end

    def fill_in_and_submit
      fill_in :session_email, with: 'test@example.com'
      click_on t('sessions.new.submit')
    end

    def visit_magic_link_in_email
      visit magic_link_in_email
    end

    # Predicate methods

    def has_magic_link_in_email?
      email_links.include? "http://#{email_host}/auth/#{user.token}"
    end

    def has_signed_in?
      within('[data-name]') { has_content? user.name }
    end

    def has_sign_in_link?
      within('nav') { has_link? 'Sign In' }
    end

    private

    def user
      @user ||= User.last
    end

    def email_host
      Rails.configuration.action_mailer.default_url_options[:host]
    end

    def magic_link_in_email
      URI.parse(email_links.first).path
    end

    def email_links
      URI::DEFAULT_PARSER.extract(email, %w[http https])
    end
  end
end
