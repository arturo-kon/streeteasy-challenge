require_relative 'export_listings'
require_relative 'street_easy_search'

# Didn't find a way to sort listings through the api, but defaults to PRICE_DESC
sales = StreetEasySearch.new({:id => 'soho'}, 'sales/search').short_response
ExportListings.new("most_expensive_for_sale.json", sales)
rentals = StreetEasySearch.new({:id => 'soho'}, 'rentals/search').short_response
ExportListings.new("most_expensive_for_rent.json", rentals)