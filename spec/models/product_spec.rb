require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "all fields are present" do
      @category = Category.new(:name => 'Potatoes')
      @category.save
      @product = Product.new(:name => "Potato1", :description => "Cool Item", :image => "link", :price_cents => 1250, :quantity => 5, :category_id => @category.id)
      count = Product.count
      @product.save

      expect(Product.count).to eql(count + 1)
      expect(@product.errors.full_messages.length).to eql(0)
    end

    it "name is nil" do
      @category = Category.new(:name => 'Potatoes')
      @category.save
      @product = Product.new(:name => nil, :description => "Cool Item", :image => "link", :price_cents => 1250, :quantity => 5, :category_id => @category.id)
      count = Product.count
      @product.save

      expect(Product.count).to eql(count)

      expect(@product.errors.full_messages.length).to eql(1)
      expect(@product.errors.full_messages.last).to eql("Name can't be blank")
    end

    it "price is nil" do
      @category = Category.new(:name => 'Potatoes')
      @category.save
      @product = Product.new(:name => "Potato1", :description => "Cool Item", :image => "link", :price_cents => nil, :quantity => 5, :category_id => @category.id)
      count = Product.count
      @product.save

      expect(Product.count).to eql(count)

      expect(@product.errors.full_messages.length).to eql(3)
      expect(@product.errors.full_messages.first).to eql("Price cents is not a number")
      expect(@product.errors.full_messages.last).to eql("Price can't be blank")
    end

    it "quantity is nil" do
      @category = Category.new(:name => 'Potatoes')
      @category.save
      @product = Product.new(:name => "Potato1", :description => "Cool Item", :image => "link", :price_cents => 1250, :quantity => nil, :category_id => @category.id)
      count = Product.count
      @product.save

      expect(Product.count).to eql(count)

      expect(@product.errors.full_messages.length).to eql(1)
      expect(@product.errors.full_messages.last).to eql("Quantity can't be blank")
    end

    it "quantity is nil" do
      @product = Product.new(:name => "Potato1", :description => "Cool Item", :image => "link", :price_cents => 1250, :quantity => 5)
      count = Product.count
      @product.save

      expect(Product.count).to eql(count)

      expect(@product.errors.full_messages.length).to eql(1)
      expect(@product.errors.full_messages.last).to eql("Category can't be blank")
    end


  end
end
