class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :category, index: true, foreign_key: true
      t.string :asin
      t.string :ean
      t.text :model
      t.text :title
      t.text :partnumber
      t.text :durl
      t.text :small_image
      t.text :midium_image
      t.text :large_image
      t.text :brand
      t.text :color
      t.text :manufacture
      t.text :sales_rank
      t.text :feature
      t.text :editorialreviews
      t.string :height
      t.string :width
      t.string :length
      t.string :pkg_height_inc
      t.string :pkg_width_inc
      t.string :pkg_length_inc
      t.string :list_price
      t.text :price
      t.string :amount_savd
      t.string :availabilityattributes

      t.timestamps null: false
    end
  end
end
