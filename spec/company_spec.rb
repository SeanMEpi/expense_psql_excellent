require 'spec_helper'

describe 'Company' do
  describe 'initialize' do
    it 'initializes an company' do
      new_company = Company.new({:name => "Nike"})
      expect(new_company).to be_a Company
    end
  end

  describe 'save' do
    it 'saves a company to the database' do
      new_company = Company.new({:name => "Nike"})
      new_company.save
      expect(Company.all).to eq [new_company]
    end
  end

  describe '.all' do
    it 'returns all companies in the companies table' do
      new_company = Company.new({:name => "Nike"})
      new_company.save
      new_company2 = Company.new({:name => "Adidas"})
      new_company2.save
      expect(Company.all).to eq [new_company, new_company2]
    end
  end

  describe '==' do
    it 'compares two companies' do
      new_company = Company.new({:name => "Nike"})
      new_company.save
      new_company2 = Company.new({:name => "Nike"})
      new_company2.save
      expect(new_company.==(new_company2)).to eq true
    end
  end

  describe 'update_companies_expenses' do
    it 'updates the expenses_categories table' do
      new_company = Company.new({:name => "Nike"})
      new_company.save
      new_expense = Expense.new({:name => "Clothes", :amount => 10.00, :date => '1999-12-31'})
      new_expense.save
      new_expense2 = Expense.new({:name => "Stuff", :amount => 20.00, :date => '1999-12-30'})
      new_expense2.save
      new_company.update_companies_expenses(new_expense.id)
      new_company.update_companies_expenses(new_expense2.id)
      expect(Company.select_expenses_by_company(new_company.id)).to eq [new_expense, new_expense2]
    end
  end
end
