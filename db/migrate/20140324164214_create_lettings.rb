class CreateLettings < ActiveRecord::Migration
  def change
    create_table :lettings do |t|
      t.string :letting_uid
      t.boolean :letting_proposal, :default => true
      t.string :title
      t.float :price
      t.text :property_short_description
      t.text :proposal_description
      t.integer :bedroom_count
      t.date :available_from
      t.string :property_category
      t.string :address_line1
      t.string :address_line2
      t.string :town
      t.string :area
      t.string :country
      t.string :post_code
      t.string :latitude
      t.string :longitude
      t.string :price_type
      t.float :deposit_amount
      t.boolean :featured, :default => false
      t.string :publish_as
      t.timestamps
    end
  end
end
