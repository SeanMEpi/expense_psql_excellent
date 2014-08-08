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

  def self.total_expenses
    total = 0
    expenses = self.all
    expenses.each do |expense|
      total += expense.amount
    end
    total
  end

  def self.amount_by_category(category_id)
    total = 0
    expenses = Category.select_expenses_by_category(category_id)
    expenses.each do |expense|
      total += expense.amount
    end
    total
  end

  def self.percentage_of_total(category_id)
    (self.amount_by_category(category_id) / self.total_expenses) * 100
  end



end


