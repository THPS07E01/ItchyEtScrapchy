require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'csv'
require 'json'
require 'google_drive'

class Scraper

  attr_accessor :city_mail, :city_name

  PAGE_URL  = 'http://annuaire-des-mairies.com/val-d-oise.html'
  PAGE_URL2 = 'http://annuaire-des-mairies.com/'

  def initialize
    get_townhall_email(get_townhall_urls)
  end

  # On définit la fonction pour récupérer les URLs des différentes villes.
  def get_townhall_urls
    page = Nokogiri::HTML(open(PAGE_URL))
    cities = []
    path_city = page.css('a.lientxt') # On récupère les données brutes
    path_city.each do |city|
      a = city['href'] # On récupère le href qui link vers les pages des communes
      a[0] = ''
      cities << a
    end
    cities
  end
  

  # On définit la fonction pour récupérer les infos.

  def get_townhall_email(urls)

    # On définit les arrays principaux.
    @city_mail = []     # Pour les mails
    @city_name = []     #  Pour les noms

    # On récupère les infos dans nos arrays.
    urls.each do |url|
      page = Nokogiri::HTML(open(PAGE_URL2 + url)) # On combine l'url de base et les url de chaque commune.
      emails_path = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
      name_path = page.css('small')
      city_name_temp = name_path.text    # On récupère les noms.
      city_name_temp[0..10] = ''         # On enlève le "Commune de".
      @city_mail << emails_path.text
      @city_name << city_name_temp
    end

    # On indique les emails non renseignés.
    @city_mail.each_with_index do |_mail, i|
      empty_mail = "Adresse e-mail non renseignée! Ces bouseux n'ont sûrement pas Internet de toute façon!"
      @city_mail[i].empty? ? @city_mail[i] = empty_mail : nil
    end
  end


  # On définit les methodes pour enregistrer nos données dans un fichier.

  def save_as_array

    fusion = []

    @city_name.each_with_index do |name, i|
      fusion[i] = { name => @city_mail[i] }
    end

    puts fusion
    puts "Les données sont enregistrées dans l'array, bien joué bébé."
  end

  def save_as_json

    fusion = {}

    @city_name.each_with_index do |name, i|
      fusion[name] = @city_mail[i]
    end

    fusion = fusion.to_json
    file = File.new('db/test.json', 'w')
    file.puts(fusion)
    file.close

    puts 'Les données sont enregistrées en JSON, bien joué bébé.'
  end

  def save_as_csv
    File.file?('db/test.csv') ? system('rm db/test.csv') : nil  # On vérifie si un fichier existe déjà, et on le supprime si besoin.
    file = File.new('db/test.csv', 'a')
    @city_name.each_with_index do |name, i|
      file.puts(name + ', ' + @city_mail[i])
    end
    file.close
    puts 'Les données sont enregistrées en CSV, bien joué bébé.'
  end

  def save_as_spreadsheet(spreadsheet_url)
    session = GoogleDrive::Session.from_config('config.json')
    ws = session.spreadsheet_by_key(spreadsheet_url).worksheets[0]

    @city_name.each_with_index do |name, i|
      ws[i + 1, 1] = name
    end

    @city_mail.each_with_index do |mail, i|
      ws[i + 1, 2] = mail
    end

    ws.save
    ws.reload
    puts 'Les données sont enregistrées en Google Spreadsheet, bien joué bébé.'
  end

end



