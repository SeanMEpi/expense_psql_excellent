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
end
