# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visitor comes for the first time' do
  it 'sees the welcome message' do
    homepage = Feature::Homepage.new
    homepage.visit_home

    expect(homepage).to have_welcome_message
    expect(homepage).to have_temporary_name_assigned
  end

  it 'does not see welcome message on subsequent visits' do
    homepage = Feature::Homepage.new
    2.times { homepage.visit_home }

    expect(homepage).not_to have_welcome_message
  end
end
