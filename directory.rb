def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp

    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

def input_students
  puts "Please enter the name of the students followed by their"
  puts "- Hobbies"
  puts "- Country of birth"
  puts "- Height"
  puts "- Cohort"
  puts "To finish, just hit return twice"

  cohorts = ["january", "febuary", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  students = []
  name = gets.delete("\n")
  count = 0

  while !name.empty? do
    hobbies = gets.chomp
    country_of_birth = gets.chomp
    height = gets.chomp
    cohort = gets.chomp
    count += 1

    if cohorts.index(cohort.downcase) == nil
      puts "Invalid cohort! Cohort set to november by default."
      cohort = "november"
    end

    students << {name: name, hobbies: hobbies, country: country_of_birth, height: height, cohort: cohort.to_sym}

    if count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end

    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  students = students.sort_by do |student|
    student[:cohort]
  end

  students.each_with_index do |student, index|
    puts "#{index+1} #{student[:name]} #{student[:hobbies]} #{student[:country]} #{student[:height]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student"
  else
    puts "Overall, we have #{names.count} great students"
  end
end

interactive_menu
