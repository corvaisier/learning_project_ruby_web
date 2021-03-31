require "tilt"
require "erb"

require "./lib/panier.rb"
require "./lib/entre_client.rb"
require "./lib/reduction.rb"
require "./lib/client_interraction.rb"

class Controller
  attr_accessor :param

  def index
    panier = Panier.instance
    entre_client = EntreeClient.instance
    reduction = Reduction.instance
    client_interraction = ClientInterraction.instance
    template = Tilt.new("./vues/index.html.erb")

    if param != nil
      entre_client.entree(param).each do |args|
        panier.add_fruits(args)
        reduction.calcule_price_after_reduction(args, panier)
      end
      @price = client_interraction.prix(panier)
    end
    [200, { "Content-Type" => "text/html" }, template.render(
      self,
      pommes: panier.accu_pommes,
      bananes: panier.accu_bananes,
      cerises: panier.accu_cerises,
      meles: panier.accu_meles,
    )]
  end

  def error
    template = Tilt.new("./vues/error.html.erb")
    [404, { "Content-Type" => "text/html" }, template.render]
  end
end
