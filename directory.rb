@students = [] # an empty array accessible to all methods

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort, height = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, height: height}
  end
  file.close
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

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll adding more items
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
      puts "I dont't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def pluralize_students(n)
  n == 1 ? "#{n} great student" : "#{n} great students" 
end

def input_students
  puts "Please enter the names, cohort, and the height of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  # get the first name
  #strip removes leading and trailing whitespace
  name = gets.strip
  #chomp does not remove spaces, only newlines.
  cohort = gets.chomp.to_sym
  cohort = "January" if cohort.empty?
  height = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: cohort, height: height}
    puts "Now we have #{pluralize_students (@students.count)}"
    #get another name form the user
    name = gets.strip 
    cohort = gets.chomp.to_sym
    cohort = "January" if cohort.empty?
    height = gets.chomp
  end
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
      puts student[:name] if student[:cohort] == cohort
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

#nothing happens until we call the methods
interactive_menu
