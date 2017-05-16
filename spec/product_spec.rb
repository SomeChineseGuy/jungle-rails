require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should validate that a name exist" do
      @product = Product.new
      @product.name = 'House'
      @product.validate
      expect(@product.errors[:name]).to_not include("can't be blank")
    end

    it "should validate that a price exist" do
      @product = Product.new
      @product.price = '9.99'
      @product.validate
      expect(@product.errors[:price]).to_not include("Can't be blank")
  end

    it "should validate that a quantity exist" do
      @product = Product.new
      @product.quantity = 7
      @product.validate
      expect(@product.errors[:quantity]).to_not include("Can't be blank")
  end

    it "should validate that a quantity exist" do
      @product = Product.new
      @cartegory = Category.new 
      @product.validate
      expect(@product.errors[:category]).to_not include("Can't be blank")
  end


    it "gives an error message if it doesn't have a name" do
      @product = Product.new
      @product.validate
      expect(@product.errors[:name]).to include("can't be blank")
      expect(@product.errors[:price]).to include("can't be blank")
      expect(@product.errors[:quantity]).to_not include("Can't be blank")
      expect(@product.errors[:category]).to_not include("Can't be blank")
    end
  end
end