class Employee

    attr_reader :salary

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end

end

class Manager < Employee

    attr_reader :employees

    def initialize(name, title, salary, boss = nil)
        super
        @employees = []
    end

    def bonus(multiplier)
        sum = 0
        # @employees.each do |employee|
        #     sum += employee.salary
        # end
        queue = @employees

        until queue.empty?
            first = queue.shift
            if first.instance_of?(Manager)
                sum += first.salary
                queue.concat(first.employees)
            else  
                sum += first.salary
            end
        end

         return sum * multiplier
    end

    def employees=(employee)
        @employees << employee
    end

end

ned = Manager.new("Ned", "boss-man", 1000000)
darren = Manager.new("darren", "manager", 78000, ned)
shawna = Employee.new("shawna", "ta", 12000, darren)
david = Employee.new("david", "ta", 10000, darren)

ned.employees = darren
darren.employees = shawna
darren.employees =  david

# p darren.employees

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
