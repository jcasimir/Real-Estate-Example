module NavigationHelper  
  
  def link_for_city(city)
    link_to city, listings_path(:city => city)
  end
  
  def link_for_city_with_state(city, state)
    link_to "#{city}, #{state}", listings_path(:city => city, :state => state)
  end
  
  def link_for_state(state)
    link_to state, listings_path(:state => state)
  end
end