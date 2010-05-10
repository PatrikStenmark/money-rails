require 'rubygems'
require 'active_record'

module MoneyRails
  
  def self.included(base)
    base.extend(ClassMethods)
    base.composed_of(:price,
      :class_name => 'Money',
      :mapping => [
        ['price_cents', 'cents'],
        ['price_currency', 'currency_string']
      ])
  end
  
  module ClassMethods
    def money(method_name)
      
    end
  end
end

class Money
  def currency_string
    currency.to_s
  end
end

ActiveRecord::Base.send(:include, MoneyRails)