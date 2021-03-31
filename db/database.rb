require "sqlite3"
require "pry"

class Dbase
  @cata = {}
  attr_accessor :cata

  def self.dbInterraction
    @dbInterraction ||= SQLite3::Database.new("db/DB.db")
  end
  def self.catalogue
    dbInterraction.execute("SELECT name, price FROM products").each do |i|
      @cata.store(i[0], i[1])
    end
    @cata
  end
end
