class Listing < ActiveRecord::Base
  attr_accessible :city, :state, :name, :price
  validates_presence_of :city, :state, :name
  
  class << self
    def by_state(state)
      where(:state => state)
    end
  end
end