@students = []
@count = 0

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, hobbies, country_of_birth, height, cohort = line.chomp.split(",")
    student_insert(name, hobbies, country_of_birth, height, cohort)
    @count += 1
  end
  file.close
end

def student_insert(name, hobbies, country_of_birth, height, cohort)
  @students << {name: name, hobbies: hobbies,
    country: country_of_birth, height: height,
    cohort: cohort.to_sym}
end

def cohort_defaulter(cohort)
  cohorts = ["january", "febuary", "march",
     "april", "may", "june",
     "july", "august", "september",
     "october", "november", "december"]

  if cohorts.index(cohort.downcase) == nil
    puts "Invalid cohort! Cohort set to november by default."
    cohort = "november"
  end
  cohort
end

def students_or_student_decider
  if @count == 1
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

  name = STDIN.gets.delete("\n")

  while !name.empty? do
    hobbies = STDIN.gets.chomp
    country_of_birth = STDIN.gets.chomp
    height = STDIN.gets.chomp
    cohort = STDIN.gets.chomp
    cohort_defaulter(cohort)
    @count += 1
    student_insert(name, hobbies, country_of_birth, height, cohort)
    students_or_student_decider
    name = STDIN.gets.chomp
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
    puts "#{index+1} #{student[:name]} #{student[:hobbies]} #{student[:country]}
     #{student[:height]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:hobbies], student[:country],
    student[:height], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

try_load_students
interactive_menu
