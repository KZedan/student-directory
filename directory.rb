
def input_students(cohort = :november)
  puts "Please enter the names of the students followed by their"
  puts "- Hobbies".center(50)
  puts "- Country of birth".center(50)
  puts "- Height".center(50)
  puts "- Cohort".center(50)
  puts "To finish, just hit return twice".center(50)

  students = []

  name = gets.chomp

  while !name.empty? do
    hobbies = gets.chomp
    country_of_birth = gets.chomp
    height = gets.chomp
    cohort = gets.chomp
    if cohort != "november"
      puts "invalid cohort!"
      cohort = "november"
    end
    students << {name: name, hobbies: hobbies, country: country_of_birth, height: height, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    while student[:name][0] == "L" && student[:name].length < 12
      puts "#{index+1} #{student[:name]} #{student[:hobbies]} #{student[:country]} #{student[:height]} (#{student[:cohort]} cohort)"
      break
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
