class Company
  attr_accessor :id, :name

  def initialize attributes
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def save
    results = DB.exec("INSERT INTO companies (name) VALUES ('#{@name}') RETURNING id;").first
    @id = results['id'].to_i
  end

  def self.all
    companies = []
    results = DB.exec("SELECT * FROM companies;")
    results.each do |result|
      companies << Company.new({:id => result['id'].to_i, :name => result['name']})
    end
    companies
  end

  def ==(another_company)
    self.name == another_company.name
  end

end
