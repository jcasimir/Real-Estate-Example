class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.string :city
      t.string :state
      t.string :name
      t.integer :price
      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
