# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visitor "signs in" via email' do
  it 'sees the welcome message' do
    sign_in = Feature::SignIn.new
    sign_in.visit_home
    sign_in.click_sign_in
    sign_in.fill_in_and_submit

    expect(sign_in).to have_sent_an_email_with_magic_link
  end

  it 'signs user in via magic link' do
    sign_in = Feature::SignIn.new
    sign_in.visit_home
    sign_in.click_sign_in
    sign_in.fill_in_and_submit
    sign_in.visit_magic_link_in_email

    expect(sign_in).to have_signed_in
  end
end
