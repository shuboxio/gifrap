# frozen_string_literal: true

module Feature
  class Image < Feature::Base
    def visit_new_image
      visit new_image_path
    end

    def enter_image_information
      fill_in :image_url, with: 'https://picsum.photos/200'
    end

    def submit
      click_on 'Save'
    end

    def has_been_uploaded?
      has_content? t('images.create.created')
    end

    def on_the_gallery_page?
      has_css? 'img[src="https://picsum.photos/200"]'
    end
  end
end
