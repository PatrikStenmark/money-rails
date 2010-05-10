require File.dirname(__FILE__) + '/spec_helper'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => ':memory:')
ActiveRecord::Migration.verbose = false
ActiveRecord::Schema.define do
  create_table :products, :force => true do |t|
    t.integer :price_cents
    t.string :price_currency
  end
  
  create_table :complex_products, :force => true do |t|
    t.integer :price_subunit
    t.string :price_currency_string
  end
end

class Product < ActiveRecord::Base
  
end


class ComplexProduct < ActiveRecord::Base
  
end


describe "money rails" do
  context "complex product" do
    it "should handle custom columns" do
      ComplexProduct.money :price, :subunit_column => 'price_subunit', :currency_column => 'price_currency_string'
      money = Money.new(1000, 'SEK')
      @product = ComplexProduct.new(:price => money)
      
      @product.save!
      puts Product.first.inspect
      @product = ComplexProduct.find(@product.id)
      @product.price.should == money
    end
  end
  
  before do
    
  end
  
  describe "declaring" do
    
    before do
      Product.money :price
    end
    
    it "should accept a money object" do
      money = Money.new(1000, 'SEK')
      
      @product = Product.new(:price => money)
    end
  end
  
  describe "getting from db" do
    before do
      Product.money :price
      
      @product = Product.new(:price => Money.new(1000, 'SEK'))
      @product.save!
      @product = Product.find(@product.id)
    end
    
    it "should return a money object" do
      @product.price.should be_instance_of(Money)
    end
    
    it "should return a string representation of the money" do
      @product.price.to_s.should eql("10.00")
    end
    
    it "should return a currency object" do
      @product.price.currency.should be_instance_of(Money::Currency)
    end
  end
  
  describe "Money#currency_string" do
    before do
      @money = Money.new(1000, 'SEK')
    end
    
    it "should return a string" do
      @money.currency_string.should eql("SEK")
    end
  end
end