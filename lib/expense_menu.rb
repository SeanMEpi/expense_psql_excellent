def expense_menu
  linespace
  puts "E > Return to Main Menu"
  puts "V > View expenses (new menu)"
  puts "A > Add an expense"
  linespace
  expense_choice = gets.chomp.upcase
  case(expense_choice)
    when 'E'
      main_menu
    when 'V'
      view_expense_menu
    when 'A'
      add_expense
    else
      puts "Invalid! Try again"
  end
  expense_menu
end

def view_expense_menu
  linespace
  puts "O > View expenses by company within category"
  puts "R > Return to expense menu"
  puts "C > View expenses by category"
  puts "A > View all expenses"
  linespace
  view_expense_choice = gets.chomp.upcase
  case(view_expense_choice)
    when 'A'
      view_all_expenses
    when 'C'
      view_expenses_by_category
    when 'O'
      view_expenses_by_company_within_category
    when 'R'
      expense_menu
    else
      puts "Invalid! Try again"
  end
  view_expense_menu
end

def add_expense
  puts "Expense name:"
  name = gets.chomp.upcase
  puts "Amount paid:"
  amount = gets.chomp.to_f
  puts "Date purchased (YYYY-MM-DD):"
  date = gets.chomp
  new_expense = Expense.new({:name => name, :amount => amount, :date => date})
  new_expense.save
  puts "#{name.capitalize} has been added!"
  puts "What category does this purchase belong to?"
  category = Category.find_category(gets.chomp.upcase)
  category.update_expenses_categories(new_expense.id)
  puts "What company was this purchased from?"
  company = Company.find_company(gets.chomp.upcase)
  company.update_companies_expenses(new_expense.id)
  puts "Fantastic!"
end

def view_all_expenses
  results = Expense.all
  puts "All Expenses:"
  results.each do |result|
    puts "Name: #{result.name}"
    puts "Amount: #{result.amount}"
    puts "Date: #{result.date}"
    linespace
  end
  total = Expense.total_expenses
  puts "Total Amount: #{total}"
end

def view_expenses_by_category
  puts "Enter category to search:"
  category = gets.chomp.upcase
  category_id = Category.find_category_id(category)
  results = Category.select_expenses_by_category(category_id)
  results.each do |result|
    puts "Expense: #{result.name}"
    puts "Amount: #{result.amount}"
    puts "Date: #{result.date}"
  end
  linespace
end


def view_expenses_by_company_within_category
  puts "Enter category to search:"
  category = gets.chomp.upcase
  puts "Enter company to search:"
  company = gets.chomp.upcase
  category_id = Category.find_category_id(category)
  company_id = Company.find_company(company)
  category_expenses = Category.select_expenses_by_category(category_id)
  company_expenses = Company.select_expenses_by_company(company_id.id)
  results = Company.expenses_by_category_by_company(category_expenses, company_expenses)
  results.each do |result|
    puts "Expense: #{result.name}"
    puts "Amount: #{result.amount}"
    puts "Date: #{result.date}"
  end
  linespace
end


