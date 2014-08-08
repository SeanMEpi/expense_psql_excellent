require 'rspec'
require 'pg'
require 'pry'
require 'expense'
require 'category'
require 'company'


DB = PG.connect({:dbname => 'organizer_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM expenses *;")
    DB.exec("DELETE FROM categories *;")
    DB.exec("DELETE FROM expenses_categories *;")
    DB.exec("DELETE FROM companies *;")
    DB.exec("DELETE FROM companies_expenses *;")

  end
end
