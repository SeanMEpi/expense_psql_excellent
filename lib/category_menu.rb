def category_menu
  linespace
  puts "E > Return to Main Menu"
  puts "V > View categories"
  puts "A > Add a category"
  linespace
  category_choice = gets.chomp.upcase
  case(category_choice)
    when 'E'
      main_menu
    when 'V'
      view_categories
    when 'A'
      add_category
    else
      puts "Invalid! Try again"
  end
  category_menu
end

def view_categories
  results = Category.all
  puts "All Categories:"
  results.each do |result|
    puts "Name: #{result.name}"
    linespace
  end
end

def add_category
  puts "Category name:"
  name = gets.chomp.upcase
  new_category = Category.new({:name => name})
  new_category.save
  puts "#{name.capitalize} has been added!"
end
