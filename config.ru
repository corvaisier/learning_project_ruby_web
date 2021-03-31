require "rack"
require "thin"
require "sqlite3"
load "router.rb"

handler = Rack::Handler::Thin
handler.run(
  Router.new,
  Port: 4200,
)
