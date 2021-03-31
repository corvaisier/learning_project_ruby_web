require "tilt"
require "erb"
require "./controller/controller.rb"
require "./lib/panier.rb"
require "./lib/entre_client.rb"
require "./lib/reduction.rb"
require "./lib/client_interraction.rb"

class Router
  def controller
    @controller ||= Controller.new
  end

  def call(env)
    path = env["REQUEST_PATH"]
    param = Rack::Request.new(env)
    controller.param = param.POST["fruit"]
    case path
    when "/"
      controller.index
    else
      controller.error
    end
  end
end
