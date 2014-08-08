require 'rspec'
require 'pg'
require 'pry'
require 'expense'
require 'category'


DB = PG.connect({:dbname => 'organizer_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM expenses *;")
    DB.exec("DELETE FROM categories *;")
  end
end
