class Student

  attr_accessor :first_name

  @@all = []

  def initialize(first_name)
    @first_name = first_name
    @@all << self
  end

  def add_boating_test(test_name, test_status, instructor)
    BoatingTest.new(self, test_name, test_status, instructor)
  end

  def self.find_student(name)
    @@all.find {|student| student.first_name = name }
  end

  def grade_percentage
    passed_tests_total = BoatingTest.all.select { |test|
        test.student == self && test.test_status == "passed"
    }.count

    total_tests = BoatingTest.all.select { |test|
        test.student == self
    }.count

    passed_tests_total.to_f / total_tests.to_f
  end

end
