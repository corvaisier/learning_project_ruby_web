require "tilt"
require "erb"

require "./lib/panier.rb"
require "./lib/entre_client.rb"
require "./lib/reduction.rb"
require "./lib/client_interraction.rb"

class Router
  def call(env)
    path = env["REQUEST_PATH"]

    param = Rack::Request.new(env)
    panier ||= Panier.new
    entre_client ||= EntreeClient.new
    reduction ||= Reduction.new
    client_interraction ||= ClientInterraction.new
    case path
    when "/"
      template = Tilt.new('index.html.erb')
      [200, {"Content-Type" =>"text/html"}, template.render(
        self,
        pommes: panier.accu_pommes,
        bananes: panier.accu_bananes,
        cerises: panier.accu_cerises,
        meles: panier.accu_meles
      )]
    when "/traitement"
      #p "ananan : #{par}" 
      @product = param.POST["fruit"]
      #p @product
      #puts params.values[0]
      #fruit : entre_client.entree(params[value[0]])
      template = Tilt.new('traitement.html.erb')
      [200, {"Content-Type" =>"text/html"}, template.render(
        self,
      )]
    else 
      template = Tilt.new('error.html.erb')
      [404, {"Content-Type" =>"text/html"}, template.render]
    end
  end
end
