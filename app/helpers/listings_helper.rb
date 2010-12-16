module ListingsHelper

  def listings_title(params)
    type = case params[:sale_type]
      when 'for_sale' then "For Sale"
      when 'for_rent' then "For Rent"
      else "All Available"
    end
    
    base = "#{type} Listings"
    if params[:city] && params[:state].nil?
      base += " in #{params[:city]}"
    elsif params[:city] && params[:state]
      base += " in #{params[:city]}, #{params[:state]}"
    elsif params[:city].nil? && params[:state]
      base += " in #{params[:state]}"
    end
    base  
  end
end
