class EntreeClient
  attr_accessor :all_args
  def self.instance
    @entre_client ||= EntreeClient.new
  end
  def initialize
    @all_args = []
  end

  def entree(argument)
    return "oups" if argument == "quit"
    if argument != nil
      @all_args = argument.split(", ") 
    end
  end
end
