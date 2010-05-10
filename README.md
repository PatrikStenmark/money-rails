Money-rails
===========

A simple gem/plugin for integrating the [money](http://github.com/FooBarWidget/money) gem with a Rails app. Since the 2.3.0 of the money gem a simple `composed_of` isn't enough to get it to work, you either need to monkey patch money or do some `serialize` magic with the currency. 

This gem gives you a `money` method on your Active Record objects:

    class Product < ActiveRecord::Base
      money :price
    end

This is the simplest case, and it will look for the columns `price_cents` and `price_currency`, which should be an int and a string respectively. 

If you want to use other column names, you can do

    class Product < ActiveRecord::Base
      money :price, :subunit_colum => 'cost_cents', :currency_column => 'currency_of_costs'
    end

Copyright (c) 2010 Patrik Stenmark, released under the MIT license
