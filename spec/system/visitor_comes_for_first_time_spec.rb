# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visitor comes for the first time' do
  it 'sees the welcome message' do
    driven_by(:rack_test)

    homepage = Feature::Homepage.new
    homepage.visit_home

    expect(homepage).to have_welcome_message
    expect(homepage).to have_temporary_name_assigned
  end
end
