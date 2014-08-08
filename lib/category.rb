class Category
  attr_accessor :name, :id

  def initialize attributes
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def save
    results = DB.exec("INSERT INTO categories (name) VALUES ('#{@name}') RETURNING id;").first
    @id = results['id'].to_i
  end

  def self.all
    categories = []
    results = DB.exec("SELECT * FROM categories;")
    results.each do |result|
      categories << Category.new({:id => result['id'].to_i, :name => result['name']})
    end
    categories
  end

  def ==(another_category)
    self.name == another_category.name
  end

  def update_expenses_categories(expense_id)
    DB.exec("INSERT INTO expenses_categories (expense_id,category_id) VALUES (#{expense_id},#{@id});")
  end

  def self.select_expenses_by_category(category_id)
    expenses = []
    results = DB.exec("SELECT expenses.* FROM categories JOIN expenses_categories ON (categories.id = expenses_categories.category_id) JOIN expenses ON (expenses_categories.expense_id = expenses.id) WHERE categories.id = #{category_id};")
    results.each do |result|
      expenses << Expense.new({:id => result['id'].to_i, :name => result['name'], :amount => result['amount'].to_f, :date => result['date']})
    end
    expenses
  end


end


