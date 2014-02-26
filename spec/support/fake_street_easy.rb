require 'sinatra/base'

class FakeStreetEasy < Sinatra::Base
  get '/nyc/api/sales/search' do
    json_response 200, 'properties_for_sale.json'
  end

  get '/nyc/api/rentals/search' do
    json_response 200, 'properties_for_rent.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end