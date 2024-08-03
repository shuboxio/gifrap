# frozen_string_literal: true

module Feature
  class Homepage < Feature::Base
    def visit_home
      visit root_path
    end

    def has_welcome_message?
      has_css? '[data-welcome]'
    end

    def has_temporary_name_assigned?
      has_css? '[data-name]'
    end
  end
end
