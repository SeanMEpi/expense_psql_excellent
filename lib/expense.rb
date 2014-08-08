class Expense
  attr_accessor :name,:amount,:date,:id

  def initialize attributes
    @name = attributes[:name]
    @amount = attributes[:amount]
    @date = attributes[:date]
    @id = attributes[:id]
  end

  def save
    results = DB.exec("INSERT INTO expenses (name, amount, date) VALUES ('#{@name}', #{@amount}, '#{@date}') RETURNING id;").first
    @id = results['id'].to_i
  end

  def self.all
    expenses = []
    results = DB.exec("SELECT * FROM expenses;")
    results.each do |result|
      expenses << Expense.new({:id => result['id'].to_i, :name => result['name'], :amount => result['amount'].to_f, :date => result['date']})
    end
    expenses
  end

  def ==(another_expense)
    self.name == another_expense.name &&
    self.amount == another_expense.amount &&
    self.date == another_expense.date
  end





end


