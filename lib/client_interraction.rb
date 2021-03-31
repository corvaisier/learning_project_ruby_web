class ClientInterraction
  def self.instance
    @client_interraction ||= ClientInterraction.new
  end

  def fruits
    puts "quel fruit?"
    "quel fruit?"
  end

  def prix(panier)
    panier.total
  end
end
