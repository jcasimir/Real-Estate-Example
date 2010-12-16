class AddForSaleAndForRentColumnsToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :for_sale, :boolean
    add_column :listings, :for_rent, :boolean
  end

  def self.down
    remove_column :listings, :for_rent
    remove_column :listings, :for_sale
  end
end
