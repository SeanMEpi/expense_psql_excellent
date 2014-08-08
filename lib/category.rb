class Category
  attr_accessor :name, :id

  def initialize attributes
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def save
    results = DB.exec("INSERT INTO categories (name) VALUES ('#{@name}') RETURNING id;").first
    @id = results['id'].to_i
  end

  def self.all
    categories = []
    results = DB.exec("SELECT * FROM categories;")
    results.each do |result|
      categories << Category.new({:id => result['id'].to_i, :name => result['name']})
    end
    categories
  end

  def ==(another_category)
    self.name == another_category.name
  end





end


