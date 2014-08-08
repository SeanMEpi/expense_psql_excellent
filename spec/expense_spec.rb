require 'spec_helper'

describe 'Expense' do
  describe 'initialize' do
    it 'initializes an expense' do
      new_expense = Expense.new({:name => "Clothes", :amount => 10.00, :date => 1999-12-31})
      expect(new_expense).to be_a Expense
    end
  end
end
