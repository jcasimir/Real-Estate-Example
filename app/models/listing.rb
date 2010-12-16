class Listing < ActiveRecord::Base
  attr_accessible :city, :state, :name, :price
  validates_presence_of :city, :state, :name
  
  class << self
    def by_state(state)
      where(:state => state)
    end
    
    def by_city(city)
      where(:city => city)
    end
    
    def search(params)
      search = Listing.scoped
      search = search.by_city(params[:city]) if params[:city]
      search = search.by_state(params[:state]) if params[:state]
      search
    end
  end
end
