class EntreeClient
  attr_accessor :all_args
  def self.instance
    @entre_client ||= EntreeClient.new
  end

  def initialize
    @all_args = []
  end

  def entree(argument)
    #binding.pry

    return "oups" if argument == "quit"
    if !argument.nil?

      @all_args = [argument["fruit"]].flatten
      #binding.pry
    end
  end
end
