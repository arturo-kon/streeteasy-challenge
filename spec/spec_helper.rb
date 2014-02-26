require 'webmock/rspec'
require 'capybara/rspec'
require 'support/fake_street_easy'
require './street_easy_search'
require './export_listings'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, /streeteasy.com/).to_rack(FakeStreetEasy)
  end
end