require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'views/index.rb'
require 'app/scraper.rb'
require 'views/done.rb'

file_name = accueil # lance le fichier lib/view/index.rb et return le nom qui sera donné à notre fichier scrapé

x = x_value         # recupere une valeur de x dans lib/view/index.rb
if x == 1           # scraping enregistré au format json
  scrap_jason = Scraper.new
  scrap_jason.save_as_json(file_name)
elsif x == 2        # scraping enregistré au format csv
  scrap_csv = Scraper.new
  scrap_csv.save_as_csv(file_name)
elsif x == 3        # scraping enregistré au format spreadsheet
  spreadsheet_url = spreadsheet
  gogo = Scraper.new
  gogo.save_as_spreadsheet(spreadsheet_url)
else                # si aucune des 3 possibilitées du programme n'est selectionnée enclenche la fermeture
end

harry               # surprise motherfucker
