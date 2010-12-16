module ListingsHelper

  def listings_title(params)
    base = "All Available Listings"
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
