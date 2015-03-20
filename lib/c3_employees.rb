require "c3_employees/version"

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
      @salary = hash["employee_annual_salary"]
    end

    def self.all
      employee_array = Unirest.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json").body
      employees = []
      employee_array.each do |employee_hash|
        employees << Employee.new(employee_hash)
      end
      return employees
    end
  end
end
