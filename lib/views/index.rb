def accueil
  welcome
  user_chomp
end

def x_value
  return @x
end

def spreadsheet
  return @ss
end

def welcome     # Ecran de bienvenue, purement cosmètique mais hyper fonctionnel pas comme ton mixer acheté en promo chez Leclerc
  puts `clear`
  puts "                                                   ######################################################"
  puts "                                                    ##### ~~Bienvenue à toi petit scrapeur fou !~~ #####"
  puts "                                                     --------------------------------------------------"
  puts ""
  sleep(0.5)
  puts ""
  puts "                                           Aujourd'hui on va te faire participer à une expérience complètement dingue !"
  puts ""
  sleep(1)
  puts ""
  puts "                                             T'es du genre hacker qui veut des infos hyper secrètes pour faire le mal ?"
  sleep(1)
  puts " "
  puts "                                                          Figure toi qu'on a LA solution ! :parrotfiesta:"
  sleep(1)
  puts " "
  puts "                                                                  Assez parlé, à toi de jouer !"
  sleep(1)
  puts " "
  puts "                                                                      Que veux-tu faire ?\n\n"
  sleep(3)
  puts " "
  sleep(0.3)
  puts "-Si tu veux récupérer la liste des mairies du Val d'Oise avec un fichier JSON : TAPE 1"
  sleep(0.3)
  puts " "
  puts "-Tu es plutôt du genre à partager des fichiers CSV sur plein de forums malfamés ? TAPE 2"
  sleep(0.3)
  puts " "
  puts "-C'est bien parce que c'est toi, si tu as lu le README tu nous adores déjà ! TAPE 3 pour un SpreadSheet de folie !"
end

def user_chomp
  answer = gets.chomp
  if answer == "1"
    puts ''
    puts "On part sur un fichier JSON du coup !\n\n"
    puts "Comment veux-tu que ton fichier JSON se nomme ?"
    scrap_jason = gets.chomp
    while scrap_jason == nil
      puts "Ola mécréant ! Il me faut un nom de fichier !"
      scrap_jason = gets.chomp
    end
    scrap_jason = scrap_jason.split.join("_")
    puts ''
    puts "Ok ton nom de fichier c'est #{scrap_jason} !\n\n"
    sleep(1)
    puts "LET'S GO !\n\n"
    @x = 1
    return scrap_jason
  elsif answer == "2"
    puts ''
    puts "On part sur un fichier CSV du coup !\n\n"
    puts "Comment veux-tu que ton fichier CSV se nomme ?"
    scrap_csv = gets.chomp
    while scrap_csv == nil
      puts "Ola mécréant ! Il me faut un nom de fichier !"
      scrap_csv = gets.chomp
    end
    scrap_csv = scrap_csv.split.join("_")
    puts ''
    puts "Ok ton nom de fichier c'est #{scrap_csv} !\n\n"
    sleep(1)
    puts "LET'S GO !\n\n"
    @x = 2
    return scrap_csv
  elsif answer == "3"
  	puts "On part sur un fichier SpreadSheet !\n\n"
  	puts "Maintenant colles la partie d'url de ton SpreadSheet comme indiqué dans le motherfucking README !"
  	scrap_sc = gets.chomp
  	while scrap_sc == nil && scrap_sc.length > 30
  	 	puts "On en a vraiment besoin pour aller plus loin et on va pas se laisser pieger par ton 123456789.\nEt pas la peine non plus d'essayer de nous corrompre avec le 06 de ta soeur."
  	 	scrap_sc = gets.chomp.to_s
  	end
  	puts "Merci pour ta coopération !\n\n"
  	sleep(1)
  	puts "LET'S GO\n\n"
    @x = 3
    @ss = scrap_sc
    return scrap_sc
  else
    puts "Si tu veux hacker des choses il faut m'écouter ! Bye !"
    return nil
  end
end
