def accueil
  welcome
  user_chomp
end

def welcome
  puts `clear`
  puts "                                                   ######################################################"
  puts "                                                    ##### ~~Bienvenue à toi petit scrapeur fou !~~ #####"
  puts "                                                     --------------------------------------------------"
  puts ""
  sleep(0.5)
  puts ""
  puts "                                           Aujourd'hui on va te faire participer à une experience complètement dingue !"
  puts ""
  sleep(1)
  puts ""
  puts "                                             T'es du genre hacker qui veut des infos hyper secrètes pour faire le mal?"
  sleep(1)
  puts " "
  puts "                                                          Figure toi qu'on a LA solution ! :parrotfiesta:"
  sleep(1)
  puts " "
  puts "                                                                  Assez parlé, à toi de jouer !"
  sleep(1)
  puts " "
  puts "                                                                      Que veux tu faire?"
  sleep(3)
  puts " "
  sleep(0.3)
  puts "-Si tu veux récupérer la liste des mairies du Val d'Oise avec un fichier JSON : TAPE 1"
  sleep(0.3)
  puts " "
  puts "-Tu es plutôt du genre à partager des fichiers CSV sur pleins de forums malfamés ? TAPE 2"
  sleep(0.3)
  puts " "
  puts "-C'est bien parce que c'est toi, si tu a lu le README tu nous adores déjà ! TAPE 3 pour un SpreadSheet de folie !"
end

def user_chomp
  answer = gets.chomp
  if answer == "1"
    puts ''
    puts "On part sur un fichier JSON du coup !\n\n"
    puts "Comment veux tu que ton scrap se nomme?"
    scrap_jason = gets.chomp
    while scrap_jason == nil
      puts "Gros il me faut un nom !"
      scrap_jason = gets.chomp
    end
    scrap_jason = scrap_jason.split.join("_")
    puts ''
    puts "Ok ton nom de scrap c'est #{scrap_jason} !\n\n"
    sleep(1)
    puts "LET'S GO !\n\n"
    return 1
  elsif answer == "2"
    puts ''
    puts "On part sur un fichier CSV du coup !\n\n"
    puts "Comment veux tu que ton scrap se nomme?"
    scrap_csv = gets.chomp
    while scrap_csv == nil
      puts "Gros il me faut un nom !"
      scrap_csv = gets.chomp
    end
    scrap_csv = scrap_csv.split.join("_")
    puts ''
    puts "Ok ton nom de scrap c'est #{scrap_csv} !\n\n"
    sleep(1)
    puts "LET'S GO !\n\n"
    return 2
  elsif answer == "3"
  	 	puts "On part sur un fichier SpreadSheet !\n\n"
  	 	puts "Maintenant colles la partie d'url de ton SpreadSheet"
  	 	scrap_sc = gets.chomp
  	 	while scrap_sc == nil
  	 		puts "On en a vraiment besoin pour aller plus loin !"
  	 		scrap_sc = gets.chomp
  	 	end
  	 	puts "Merci pour ta coopération !\n\n"
  	 	sleep(1)
  	 	puts "LET'S GO\n\n"
      return 3
  else
    puts "Si tu veux hacker des choses il faut m'écouter ! Bye !"
    return nil
  end
end
