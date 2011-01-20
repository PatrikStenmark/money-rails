require 'rubygems'
require 'active_record'
require 'active_support'
require 'spec'

require 'money'
require 'lib/money/rails'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ':memory:' )

ActiveRecord::Migration.verbose = false
