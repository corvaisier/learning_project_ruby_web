require "./lib/catalogue.rb"

class Reduction
  def calcule_price_after_reduction(args, panier)
    panier.total += PRODUCTS[args] - reduction(args, panier)
  end

  def reduction(args, panier)
    if args == "cerises" && panier.accu_cerises % 2
      30
    elsif args == "bananes" && (panier.accu_bananes % 2).zero?
      150
    elsif args == "meles" && (panier.accu_meles % 2).zero?
      100
    elsif args == "pommes" && (panier.accu_bananes % 2).zero?
      50
    else
      0
    end
  end
end
