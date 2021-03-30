require "./lib/panier.rb"
require "./lib/entre_client.rb"
require "./lib/reduction.rb"
require "./lib/client_interraction.rb"
panier = Panier.new
entre_client = EntreeClient.new
reduction = Reduction.new
client_interraction = ClientInterraction.new
client_interraction.fruits
ARGF.each do |argument|
  entre_client.entree(argument).each do |args|
    panier.add_fruits(args)
    reduction.calcule_price_after_reduction(args, panier)
  end
  client_interraction.prix(panier)
end
