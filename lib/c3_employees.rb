require "c3_employees/version"
require "unirest"

module C3Employees
  class Employee
    attr_reader :job_titles, :department, :name, :salary

    # attr_reader :name is a shortcut for:
    # def name
    #   return @name
    # end

    def initialize(hash)
      @job_titles = hash["job_titles"]
      @department = hash["department"]
      @name = hash["name"]
      @salary = hash["employee_annual_salary"].to_i
    end

    def self.all
      employee_array = Unirest.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json").body
      generate_employees(employee_array)
    end

    def self.find(search_term)
      employee_array = Unirest.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json?$q=#{search_term}").body
      generate_employees(employee_array)
    end

    private

    def self.generate_employees(employee_array)
      employees = []
      employee_array.each do |employee_hash|
        employees << Employee.new(employee_hash)
      end
      return employees
    end
  end
end
