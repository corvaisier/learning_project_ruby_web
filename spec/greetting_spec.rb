require "spec_helper"
require "greeting"

RSpec.describe Greeting do
  describe "#hello" do
    it "return 'Hello world'" do
      greeting = described_class.new
      expect(greeting.hello).to eql("Hello world")
    end
  end
  describe "#goodbye", :focus do
    it "return 'Goodbye world'" do
      greeting = described_class.new
      expect(greeting.goodbye).to eql("Goodbye world")
    end
  end
end
