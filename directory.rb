@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def cohort_defaulter(cohort)
  cohorts = ["january", "febuary", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]

  if cohorts.index(cohort.downcase) == nil
    puts "Invalid cohort! Cohort set to november by default."
    cohort = "november"
  end
  cohort
end

def students_or_student_decider(count)
  if count == 1
    puts "Now we have #{@students.count} student"
  else
    puts "Now we have #{@students.count} students"
  end
end

def input_students
  puts "Please enter the name of the students followed by their"
  puts "- Hobbies"
  puts "- Country of birth"
  puts "- Height"
  puts "- Cohort"
  puts "To finish, just hit return twice"

  name = gets.delete("\n")
  count = 0

  while !name.empty? do
    hobbies = gets.chomp
    country_of_birth = gets.chomp
    height = gets.chomp
    cohort = gets.chomp
    cohort_defaulter(cohort)
    count += 1
    @students << {name: name, hobbies: hobbies, country: country_of_birth, height: height, cohort: cohort.to_sym}
    students_or_student_decider(count)
    name = gets.chomp
  end
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list
  students = @students.sort_by do |student|
    student[:cohort]
  end

  students.each_with_index do |student, index|
    puts "#{index+1} #{student[:name]} #{student[:hobbies]} #{student[:country]} #{student[:height]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

interactive_menu
