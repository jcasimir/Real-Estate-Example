class Listing < ActiveRecord::Base
  attr_accessible :city, :state, :name, :price, :for_sale, :for_rent
  validates_presence_of :city, :state, :name
  
  class << self
    def by_state(state)
      where(:state => state)
    end
    
    def by_city(city)
      where(:city => city)
    end
    
    def by_sale_type(sale_type)
      case sale_type
      when 'for_sale' then for_sale
      when 'for_rent' then for_rent
      else
        where(nil)
      end
    end
    
    def for_sale
      where(:for_sale => true)
    end
    
    def for_rent
      where(:for_rent => true)
    end
    
    def search(params)
      search = Listing.scoped
      search = search.by_city(params[:city]) if params[:city]
      search = search.by_state(params[:state]) if params[:state]
      search = search.by_sale_type(params[:sale_type]) if params[:sale_type]
      search
    end
    
    def available_states
      find_available(:state)
    end
    
    def available_cities
      find_available(:city)
    end
    
  private
    def find_available(column_name)
      Listing.group(column_name).select(column_name).collect(&column_name).sort
    end
  end
  
  def for_sale?
    for_sale
  end
  
  def for_rent?
    for_rent
  end
end
