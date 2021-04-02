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
    req = Rack::Request.new(env)
    body = req.body.gets
    params = {}
    params.merge!(body ? JSON.parse(body) : {})
    controller.param = params

    case path
    when "/"
      controller.index
    when "/baba"
      controller.json
    else
      controller.error
    end
  end
end
