class Company
  attr_accessor :id, :name

  def initialize attributes
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def save
    results = DB.exec("INSERT INTO companies (name) VALUES ('#{@name}') RETURNING id;").first
    @id = results['id'].to_i
  end

  def self.all
    companies = []
    results = DB.exec("SELECT * FROM companies;")
    results.each do |result|
      companies << Company.new({:id => result['id'].to_i, :name => result['name']})
    end
    companies
  end

  def ==(another_company)
    self.name == another_company.name
  end

  def update_companies_expenses(expense_id)
    DB.exec("INSERT INTO companies_expenses (company_id, expense_id) VALUES (#{@id}, #{expense_id});")
  end

  def self.select_expenses_by_company(company_id)
    expenses = []
    results = DB.exec("SELECT expenses.* FROM companies JOIN companies_expenses ON (companies.id = companies_expenses.company_id) JOIN expenses ON (companies_expenses.expense_id = expenses.id) WHERE companies.id = #{company_id};")
    results.each do |result|
      expenses << Expense.new({:id => result['id'].to_i, :name => result['name'], :amount => result['amount'].to_f, :date => result['date']})
    end
    expenses
  end

  def self.expenses_by_category_by_company(category_expenses, company_expenses)
    filtered_expenses = []
    category_expenses.each do |cat_expense|
      company_expenses.each do |com_expense|
        if cat_expense.name == com_expense.name
          filtered_expenses << cat_expense
        end
      end
    end
    filtered_expenses
  end

  def self.find_company(company_name)
    result = []
    companies = Company.all
    companies.each do |company|
      if company.name == company_name
        result << company
      end
    end
    result.first
  end
end
