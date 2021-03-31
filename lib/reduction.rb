require "./db/database.rb"
require "pry"

class Reduction
  def initialize
    @catalogue = Dbase::catalogue
  end

  def self.instance
    @reduction ||= Reduction.new
  end

  def calcule_price_after_reduction(args, panier)
    panier.total += @catalogue[args] - reduction(args, panier)
  end

  def reduction(args, panier)
    if args == "Cerises" && panier.accu_cerises % 2
      30
    elsif args == "Bananes" && (panier.accu_bananes % 2).zero?
      150
    elsif args == "Meles" && (panier.accu_meles % 2).zero?
      100
    elsif args == "Pommes" && (panier.accu_bananes % 2).zero?
      50
    else
      0
    end
  end
end
