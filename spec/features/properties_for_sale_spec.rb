require 'spec_helper'

feature 'Properties for sale' do

  it 'queries for properties on sale in soho' do
    uri = URI('http://streeteasy.com/nyc/api/sales/search')

    response = JSON.parse(Net::HTTP.get(uri))

    expect(response['listings_type']).to eq 'sales'
  end

  it 'should get formatted results for 20 most expensive listings' do
    sales = StreetEasySearch.new({:id => 'soho'}, 'sales/search').short_response
    expect(sales.first['listing_class']).to eq 'sales'
    expect(sales.first['price']).to eq 50000000
  end
end