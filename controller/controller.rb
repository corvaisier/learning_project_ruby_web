require "tilt"
require "erb"

require "./lib/panier.rb"
require "./lib/entre_client.rb"
require "./lib/reduction.rb"
require "./lib/client_interraction.rb"
require "json"
class Controller
  attr_accessor :param

  def index
    panier = Panier.instance
    entre_client = EntreeClient.instance
    reduction = Reduction.instance
    client_interraction = ClientInterraction.instance

    if !param.nil?
      entre_client.entree(param).each do |args|
        panier.add_fruits(args)
        reduction.calcule_price_after_reduction(args, panier)
      end
      @price = panier.total
      p @price
      #binding.pry
    end
    [200, { "Content-Type" => "application/json" }, [@price.to_json]]
  end

  def error
    template = Tilt.new("./vues/error.html.erb")
    [404, { "Content-Type" => "text/html" }, template.render]
  end
  def json
    reduction = Reduction.instance
    a = reduction.catalogue
    
    [200, { "Content-Type" => "application/json" }, [a.to_json]]
  end
end
