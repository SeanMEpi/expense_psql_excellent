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
end

def view_all_expenses
end

def view_expenses_by_category
end

def view_expenses_by_company_within_category
end


