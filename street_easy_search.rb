require_relative 'street_easy'
require_relative 'filter'

class StreetEasySearch
  include StreetEasy
  def initialize(params = {}, endpoint)
    @endpoint = endpoint
    @params = params
  end

  def get
    @response = StreetEasy::Client.new(ENV['STREET_EASY_API_KEY']).get(@endpoint, @params)
  end

  def short_response
    get
    listings = Array.new
    listing_type = @response['listings_type']
    @response['listings'].each do |listing|
      sales = listing.filter('url', 'addr_street', 'addr_unit', 'price')
      mappings = {'addr_street' => 'address', 'addr_unit' => 'unit', 'url' => 'url', 'price' => 'price'}
      listings << ({'listing_class' => listing_type}).merge(Hash[sales.map {|k, v| [mappings[k], v] }])
    end
    listings
  end
end
