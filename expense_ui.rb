require 'pg'
require 'pry'
require './lib/expense'
require './lib/category'
require './lib/company'
require './lib/category_menu'
require './lib/company_menu'
require './lib/expense_menu'

DB = PG.connect({:dbname => 'organizer'})

def linespace
  puts "\n"
end

def header
  system 'clear'
  puts "
▒█▀▀▀ █░█ █▀▀█ █▀▀ █▀▀▄ █▀▀ █▀▀ 　
▒█▀▀▀ ▄▀▄ █░░█ █▀▀ █░░█ ▀▀█ █▀▀ 　
▒█▄▄▄ ▀░▀ █▀▀▀ ▀▀▀ ▀░░▀ ▀▀▀ ▀▀▀ 　

▒█▀▀▀█ █▀▀█ █▀▀▀ █▀▀█ █▀▀▄ ░▀░ ▀▀█ █▀▀ █▀▀█
▒█░░▒█ █▄▄▀ █░▀█ █▄▄█ █░░█ ▀█▀ ▄▀░ █▀▀ █▄▄▀
▒█▄▄▄█ ▀░▀▀ ▀▀▀▀ ▀░░▀ ▀░░▀ ▀▀▀ ▀▀▀ ▀▀▀ ▀░▀▀

█ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █ █
▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀ ▀
▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄

"
end

def main_menu
  loop do
    linespace
    puts "C > Category Menu"
    puts "O > Company Menu"
    puts "X > Exit."
    puts "E > Expenses Menu"
    linespace
    main_choice = gets.chomp.upcase
    case(main_choice)
      when 'C'
        category_menu
      when 'O'
        company_menu
      when 'X'
        puts "Have an excellent day!"
        exit
      when 'E'
        expense_menu
      else
        puts "Invalid! Try again"
    end
  end
end
header
main_menu
