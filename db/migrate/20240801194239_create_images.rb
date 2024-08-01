# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images, id: :uuid do |t|
      t.string :url
      t.jsonb :variants
      t.datetime :nsfw
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
