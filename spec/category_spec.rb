require 'spec_helper'

describe 'Category' do
  describe 'initialize' do
    it 'initializes an category' do
      new_category = Category.new({:name => "Apparel"})
      expect(new_category).to be_a Category
    end
  end

  describe 'save' do
    it 'saves an category to the database' do
      new_category = Category.new({:name => "Apparel"})
      new_category.save
      expect(Category.all).to eq [new_category]
    end
  end

  describe '.all' do
    it 'returns all categorys in the categorys table' do
      new_category = Category.new({:name => "Apparel"})
      new_category.save
      new_category2 = Category.new({:name => "Stuff"})
      new_category2.save
      expect(Category.all).to eq [new_category, new_category2]
    end
  end

  describe '==' do
    it 'compares two categorys' do
      new_category = Category.new({:name => "Apparel"})
      new_category.save
      new_category2 = Category.new({:name => "Apparel"})
      new_category2.save
      expect(new_category.==(new_category2)).to eq true
    end
  end

  describe 'update_expenses_categories' do
    it 'updates the expenses_categories table' do
      new_category = Category.new({:name => "Apparel"})
      new_category.save
      new_expense = Expense.new({:name => "Clothes", :amount => 10.00, :date => '1999-12-31'})
      new_expense.save
      new_expense2 = Expense.new({:name => "Stuff", :amount => 20.00, :date => '1999-12-30'})
      new_expense2.save
      new_category.update_expenses_categories(new_expense.id)
      new_category.update_expenses_categories(new_expense2.id)
      expect(Category.select_expenses_by_category(new_category.id)).to eq [new_expense, new_expense2]
    end
  end
end
