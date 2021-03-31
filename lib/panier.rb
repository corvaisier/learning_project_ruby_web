class Panier
  attr_accessor :total, :accu_cerises, :accu_bananes, :accu_meles, :accu_pommes
  def self.instance
    @panier ||= Panier.new
  end

  def initialize
    @total = 0
    @accu_cerises = 0
    @accu_bananes = 0
    @accu_meles = 0
    @accu_pommes = 0
  end

  def add_fruits(args)
    @accu_cerises += 1 if args == "Cerises"
    @accu_bananes += 1 if args == "Bananes"
    @accu_meles += 1 if args == "Meles"
    @accu_pommes += 1 if args == "Pommes"
  end
end
