def company_menu
  linespace
  puts "E > Return to Main Menu"
  puts "V > View companies"
  puts "A > Add a company"
  linespace
  company_choice = gets.chomp.upcase
  case(company_choice)
    when 'E'
      main_menu
    when 'V'
      view_companies
    when 'A'
      add_company
    else
      puts "Invalid! Try again"
  end
  company_menu
end

def view_companies
  results = Company.all
  puts "All companies:"
  results.each do |result|
    puts "Name: #{result.name}"
  end
  linespace
end

def add_company
  puts "company name:"
  name = gets.chomp.upcase
  new_company = Company.new({:name => name})
  new_company.save
  puts "#{name.capitalize} has been added!"
end
