require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) {Dessert.new(0,0,chef)}
  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to_not eq(nil)
    end

    it "sets a quantity" do
      expect(dessert.quantity).to_not eq(nil)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new(0,"0",chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    let(:chef) { double("chef") }
    subject(:dessert) {Dessert.new("sous",0,chef)}
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("fish")
      expect(dessert.ingredients).to_not eql(nil)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      test_arr = (0..99).to_a
      (0..99).each {|i| dessert.add_ingredient(i)}
      dessert.mix!
      expect(dessert.ingredients).to_not eq(test_arr)
    end

  end

  describe "#eat" do
    subject(:dessert2) {Dessert.new("sous",1,chef)}
    it "subtracts an amount from the quantity" do
      dessert2.eat(1)
      expect(dessert2.quantity).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect(dessert2.eat(2)).to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).contains(dessert.chef.titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
