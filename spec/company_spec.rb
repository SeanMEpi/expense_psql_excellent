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
end
