# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visitor uploads image' do
  it 'uploads an image' do
    image = Feature::Image.new
    image.visit_new_image
    image.enter_image_information
    image.submit

    expect(image).to have_been_uploaded
    expect(image).to be_on_the_gallery_page
  end
end
