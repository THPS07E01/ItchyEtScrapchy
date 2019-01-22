require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/scraper.rb'
require 'views/index.rb'
require 'views/done.rb'

user_input = Scraper.new
user_input.save_as_array
user_input.save_as_json
user_input.save_as_csv
user_input.save_as_spreadsheet
