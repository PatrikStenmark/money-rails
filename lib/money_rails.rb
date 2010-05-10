require 'rubygems'
require 'active_record'

module MoneyRails
  
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def money(method_name, options = {})
      
      subunit_column_name = options.fetch(:subunit_column, "#{method_name}_cents")
      currency_column_name = options.fetch(:currency_column, "#{method_name}_currency")
      self.composed_of(method_name.to_sym,
        :class_name => 'Money',
        :mapping => [
          [subunit_column_name, 'cents'],
          [currency_column_name, 'currency_string']
        ])
      
    end
  end
end

class Money
  def currency_string
    currency.to_s
  end
end

ActiveRecord::Base.send(:include, MoneyRails)