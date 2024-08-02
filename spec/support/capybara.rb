# frozen_string_literal: true

require 'capybara/cuprite'

Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(
    app,
    window_size: [1200, 800],
    browser_options: { 'no-sandbox': nil },
    inspector: true,
    url: ENV.fetch('CHROME_URL', nil)
  )
end

Capybara.server                = :puma, { Silent: true }
Capybara.default_driver        = :rack_test
Capybara.default_max_wait_time = 5
Capybara.disable_animation     = true
Capybara.javascript_driver     = :cuprite
