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
end
