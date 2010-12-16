require File.dirname(__FILE__) + '/../spec_helper'

describe Listing do
  before(:each) do
    @listing = Listing.new(:name => "A Sample Property", :city => "Las Vegas", :state => "NV")
  end
  
  it "should be valid with valid attributes" do
    @listing.should be_valid
  end
  
  it "should not be valid without a name" do
    no_name = @listing.clone
    no_name.name = nil
    no_name.should_not be_valid
  end

  it "should not be valid without a city" do
    no_city = @listing.clone
    no_city.city = nil
    no_city.should_not be_valid
  end
  
  it "should not be valid without a state" do
    no_state = @listing.clone
    no_state.state = nil
    no_state.should_not be_valid
  end
  
  it "should be listed by its state" do
    @listing.save
    Listing.by_state(@listing.state).should include(@listing)    
  end
  
  it "should not be listed when querying for a different state" do
    listing_az = @listing.clone.update_attributes(:city => "Phoenix", :state => "AZ")
    Listing.by_state(@listing.state).should_not include(listing_az)
  end
  
  it "should be listed by its city" do
    @listing.save
    Listing.by_city(@listing.city).should include(@listing)
  end
  
  it "should not be listed when querying for a different city" do
    listing_az = @listing.clone.update_attributes(:city => "Phoenix", :state => "AZ")
    Listing.by_city(@listing.city).should_not include(listing_az)
  end
  

end
