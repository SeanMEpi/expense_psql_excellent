require 'spec_helper'

describe 'Expense' do
  describe 'initialize' do
    it 'initializes an expense' do
      new_expense = Expense.new({:name => "Clothes", :amount => 10.00, :date => '1999-12-31'})
      expect(new_expense).to be_a Expense
    end
  end

  describe 'save' do
    it 'saves an expense to the database' do
      new_expense = Expense.new({:name => "Clothes", :amount => 10.00, :date => '1999-12-31'})
      new_expense.save
      expect(Expense.all).to eq [new_expense]
    end
  end

  describe '.all' do
    it 'returns all expenses in the expenses table' do
      new_expense = Expense.new({:name => "Clothes", :amount => 10.00, :date => '1999-12-31'})
      new_expense.save
      new_expense2 = Expense.new({:name => "Stuff", :amount => 20.00, :date => '1999-12-30'})
      new_expense2.save
      expect(Expense.all).to eq [new_expense, new_expense2]
    end
  end

  describe '==' do
    it 'compares two expenses' do
      new_expense = Expense.new({:name => "Clothes", :amount => 10.00, :date => '1999-12-31'})
      new_expense.save
      new_expense2 = Expense.new({:name => "Clothes", :amount => 10.00, :date => '1999-12-31'})
      new_expense2.save
      expect(new_expense.==(new_expense2)).to eq true
    end
  end

  describe '.total_expenses' do
    it 'returns the total amount spent for all categories' do
       new_expense = Expense.new({:name => "Clothes", :amount => 10.00, :date => '1999-12-31'})
      new_expense.save
      new_expense2 = Expense.new({:name => "Stuff", :amount => 20.00, :date => '1999-12-30'})
      new_expense2.save
      expect(Expense.total_expenses).to eq 30.00
    end
  end

  describe '.amount_by_category' do
    it 'returns total expense amount for a category' do
      new_expense = Expense.new({:name => "Clothes", :amount => 10.00, :date => '1999-12-31'})
      new_expense.save
      new_expense2 = Expense.new({:name => "Shoes", :amount => 50.00, :date => '1999-12-31'})
      new_expense2.save
      new_expense3 = Expense.new({:name => "Beer", :amount => 200.00, :date => '1999-12-31'})
      new_expense3.save
      new_category = Category.new({:name => "Apparel"})
      new_category.save
      new_category2 = Category.new({:name => "Party Supplies"})
      new_category2.save
      new_category.update_expenses_categories(new_expense.id)
      new_category.update_expenses_categories(new_expense2.id)
      new_category2.update_expenses_categories(new_expense3.id)
      expect(Expense.amount_by_category(new_category.id)).to eq 60.00
    end
  end

  describe '.percentage_of_total' do
    it 'returns the percentage of expenses for a category compared to the total expenses' do
      new_expense = Expense.new({:name => "Clothes", :amount => 10.00, :date => '1999-12-31'})
      new_expense.save
      new_expense2 = Expense.new({:name => "Shoes", :amount => 50.00, :date => '1999-12-31'})
      new_expense2.save
      new_expense3 = Expense.new({:name => "Beer", :amount => 40.00, :date => '1999-12-31'})
      new_expense3.save
      new_category = Category.new({:name => "Apparel"})
      new_category.save
      new_category2 = Category.new({:name => "Party Supplies"})
      new_category2.save
      new_category.update_expenses_categories(new_expense.id)
      new_category.update_expenses_categories(new_expense2.id)
      new_category2.update_expenses_categories(new_expense3.id)
      expect(Expense.percentage_of_total(new_category.id)).to eq 60
    end
  end
end
