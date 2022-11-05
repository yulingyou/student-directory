@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
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
      puts "I dont't know what you meant, try again"
    end
end

def input_students
  puts "Please enter the names, cohort, and the height of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  #chomp does not remove spaces, only newlines.
  cohort = STDIN.gets.chomp
  cohort = "January" if cohort.empty?
  height = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: cohort, height: height}
    puts "Now we have #{pluralize_students (@students.count)}"
    #get another name form the user
    name = STDIN.gets.chomp
    cohort = STDIN.gets.chomp
    cohort = "January" if cohort.empty?
    height = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def pluralize_students(n)
  n == 1 ? "#{n} great student" : "#{n} great students" 
end

def print_header
  if !@students.empty?
  puts "The Students of Villains Academy"
  puts "-------------".center(20,'+')
  end
end

def print_students_list
  if @students.empty?
    puts "There is no student yet"
  else
    cohorts = @students.map do |student|
      student[:cohort]
    end
    cohorts.uniq.each do |cohort|
      puts "#{cohort} cohort"
      @students.each do |student|
      puts "#{student[:name]} (height:#{student[:height]})"if student[:cohort] == cohort
      end
    end
  end
  # students.each_with_index do |student, index|
  #   if student[:name].length < 12
  #   puts "#{index + 1}.#{student[:name]},(#{student[:cohort]} cohort, height: #{student[:height]})"
    # end
  # end
end

def print_footer
  if !@students.empty?
  puts "Overall, we have #{pluralize_students(@students.count)}"
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name],student[:cohort],student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort, height = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, height: height}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

#nothing happens until we call the methods
try_load_students
interactive_menu