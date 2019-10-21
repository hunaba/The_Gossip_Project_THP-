#require 'bundler'
#Bundler.require

#Tu connais déjà ces lignes : elles appellent le bundler 
#et permettent de lire le Gemfile. Ainsi, pas besoin de mettre partout des require 'gem'.


require 'gossip'

class ApplicationController < Sinatra::Base

=begin 
  puts "Salut, je suis dans le serveur"
  puts "Ceci est le contenu du hash params : #{params}"
  puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
  puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
  puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
=end

get '/' do
  erb :index, locals: {gossips: Gossip.all}
end

  get '/gossips/new/'do 
 	erb :new_gossip
  end

  post '/gossips/new/' do
 	Gossip.new(params['@author'], params['@content']).save
     redirect '/' #retour homepage
  end

  post '/gossips/new/' do
  puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal"
 end
 
 

#  run! if app_file == $0 #permet d’exécuter le code de la classe sans avoir à écrire un ApplicationController.new.perform en bas du fichier.
end

