require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/scraper.rb'
require 'views/index.rb'
require 'views/done.rb'


input = "1qi8_JKq3tXo6KwHJdBtySblLcz6g1avzR8tWLkfCDO4"

gogo = Scraper.new 
gogo.save_as_spreadsheet(input)
