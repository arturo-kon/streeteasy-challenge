require 'rest-client'
require 'addressable/uri'
require 'json'

module StreetEasy
  class Client

    def initialize(key, server = 'http://www.streeteasy.com/nyc/api/', format = 'json')
      @base_uri = server
      @key = key
      @format = format
    end

    def get(path, query = {})
      # Making sure to append the api key.
      query.merge!({:format => @format, :key => @key})
      url = Addressable::URI.join(@base_uri, path.to_s).to_s
      response = RestClient.get url, {:params => query}
      # Possibly format xml in the future.
      @format == 'json' ? JSON.parse(response) : response
    end
  end
end