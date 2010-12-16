module NavigationHelper
  
  def navigation_by_state
    content_tag(:ul, 
      Listing.available_states.collect do |state|
        content_tag(:li, link_to(state, listings_path(:state => state)))
      end)
  end
  
  def navigation_by_city
    
  end
  
  def listings_for_city(city)
    
  end
  
  def listings_for_state(state)
    
  end
end