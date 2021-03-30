require "spec_helper"
require "client_interraction.rb"

RSpec.describe Client_interraction do
  describe "#fruits" do
    it "return 'quel fruit?'" do
      client_interraction = described_class.new
      expect(client_interraction.fruits).to eql("quel fruit?")
    end
  end
end
