
def input_students
  puts "Please enter the names of the students followed by their"
  puts "- Hobbies".center(50)
  puts "- Country of birth".center(50)
  puts "- Height".center(50)
  puts "To finish, just hit return twice".center(50)

  students = []

  name = gets.chomp
  hobbies = gets.chomp
  country_of_birth = gets.chomp
  height = gets.chomp

  while !name.empty? do
    students << {name: name, hobbies: hobbies, country: country_of_birth, height: height, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    hobbies = gets.chomp
    country_of_birth = gets.chomp
    height = gets.chomp
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
