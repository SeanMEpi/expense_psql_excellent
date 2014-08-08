require 'rspec'
require 'pg'
require 'pry'
require 'expense'


DB = PG.connect({:dbname => 'organizer_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM expenses *;")

  end
end
