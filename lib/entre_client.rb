class EntreeClient
  attr_accessor :all_args

  def initialize
    @all_args = []
  end

  def entree(argument)
    argument = argument.chomp
    return "oups" if argument == "quit"
    @all_args = argument.split(", ")
  end
end
