require File.dirname(__FILE__) + '/../spec_helper'

describe Listing do
  before(:each) do
    @listing = Listing.create(:name => "A Sample Property", :city => "Las Vegas", :state => "NV")
    @foreign = Listing.create(:name => "A Foreign Property", :city => "Phoenix", :state => "AZ")
    @nearby = Listing.create(:name => "A Nearby Property", :city => "Reno", :state => "NV")
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
    Listing.by_state(@listing.state).should_not include(@foreign)
  end
  
  it "should be listed by its city" do
    Listing.by_city(@listing.city).should include(@listing)
  end
  
  it "should not be listed when querying for a different city" do
    Listing.by_city(@listing.city).should_not include(@foreign)
  end
  
  it "should be listed by both its city and state" do
    Listing.by_state(@listing.state).by_city(@listing.city).should include(@listing)
  end

  it "should be listed when searching for a city" do
    Listing.search(:city => @listing.city).should include(@listing)
  end
  
  it "should be listed when searching by a state" do
    Listing.search(:state => @listing.state).should include(@listing)
  end
  
  it "should not list foreign listings when searching by a city" do
    Listing.search(:city => @listing.city).should_not include(@foreign)
  end
  
  it "should not list foreign listings when searching by a state" do
    Listing.search(:state => @listing.state).should_not include(@foreign)
  end
  
  it "should be listed when searching by city and state" do
    Listing.search(:state => @listing.state, :city => @listing.city).should include(@listing)
  end
  
  it "should not list a nearby listing when searching by city" do
    Listing.search(:city => @listing.state).should_not include(@nearby)
  end
  
  it "should include a nearby listing when searching by state" do
    Listing.search(:state => @listing.state).should include(@nearby)
  end
  
  it "should provide a list of all available state abbreviations" do
    ls = Listing.all
    states = Listing.available_states
    ls.each do |listing|
      states.should include(listing.state)
    end
  end
  
  it "should provide a list of all available cities" do
    ls = Listing.all
    cities = Listing.available_cities
    ls.each do |listing|
      cities.should include(listing.city)
    end
  end
end
