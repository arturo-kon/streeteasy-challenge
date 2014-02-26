require 'spec_helper'

feature 'Properties for rent' do
  it 'queries for properties for rent in soho' do
    uri = URI('http://streeteasy.com/nyc/api/rentals/search')

    response = JSON.parse(Net::HTTP.get(uri))

    expect(response['listings_type']).to eq 'rentals'
  end

  it 'should get formatted results for 20 most expensive listings' do
    sales = StreetEasySearch.new({:id => 'soho'}, 'rentals/search').short_response
    expect(sales.first['listing_class']).to eq 'rentals'
    expect(sales.first['price']).to eq 80000
  end
end