require File.dirname(__FILE__) + '/../spec_helper'

describe Listing do
  before(:each) do
    @listing = Listing.create(:name => "A Sample Property", :city => "Las Vegas", :state => "NV")
  end
  
  it "should be valid with valid attributes" do
    @listing.should be_valid
  end
  
  it "should not be valid without a name" do
    @listing.name = nil
    @listing.should_not be_valid
  end

  it "should not be valid without a city" do
    @listing.city = nil
    @listing.should_not be_valid
  end
  
  it "should not be valid without a state" do
    @listing.state = nil
    @listing.should_not be_valid
  end
  
  it "should be listed by its state" do
    Listing.by_state(@listing.state).should include(@listing)    
  end
  
  it "should not be listed when querying for a different state" do
    listing_az = @listing.clone.update_attributes(:city => "Phoenix", :state => "AZ")
    Listing.by_state(@listing.state).should_not include(listing_az)
  end
  
  it "should be listed by its city" do
    Listing.by_city(@listing.city).should include(@listing)
  end
  
  it "should not be listed when querying for a different city" do
    listing_az = @listing.clone.update_attributes(:city => "Phoenix", :state => "AZ")
    Listing.by_city(@listing.city).should_not include(listing_az)
  end
  
  it "should be listed by both its city and state" do
    Listing.by_state(@listing.state).by_city(@listing.city).should include(@listing)
  end

end
