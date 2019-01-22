require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'views/index.rb'
require 'app/scraper.rb'
require 'views/done.rb'

x = accueil
if x == 1
  scrap_jason = Scraper.new
  scrap_jason.save_as_json
elsif x == 2
  scrap_csv = Scraper.new
  scrap_csv.save_as_csv
elsif x == 3
else
end

#user_input.save_as_spreadsheet
