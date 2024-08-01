# frozen_string_literal: true

class CreateImageDescriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :image_descriptions, id: :uuid do |t|
      t.references :image, null: false, foreign_key: true, type: :uuid
      t.string :description

      t.timestamps
    end
  end
end
