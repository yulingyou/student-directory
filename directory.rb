def interactive_menu
  students = []
  loop do
  # 1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
  # 2. read the input and save it into a variable
  selection = gets.chomp
  # 3. do what the user has asked
  case selection
    when "1"
      #input the students
      students = input_students
    when "2"
      # show the students
      print_header(students)
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else 
      puts "I dont't know what you meant, try again"
  end
  # 4. repeat from step 1
  end
end

def pluralize_students(n)
  n == 1 ? "#{n} great student" : "#{n} great students" 
end

def input_students
  puts "Please enter the names, cohort, and the height of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
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
    students << {name: name, cohort: cohort, height: height}
    puts "Now we have #{pluralize_students (students.count)}"
    #get another name form the user
    name = gets.strip 
    cohort = gets.chomp.to_sym
    cohort = "January" if cohort.empty?
    height = gets.chomp
  end
  # return the array of students
    students
end


def print_header(students)
  if !students.empty?
  puts "The Students of Villains Academy"
  puts "-------------".center(20,'+')
  end
end

def print(students)
  if students.empty?
    puts "There is no student yet"
  else
    cohorts = students.map do |student|
      student[:cohort]
    end
    cohorts.uniq.each do |cohort|
      puts "#{cohort} cohort"
      students.each do |student|
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

def print_footer(names)
  if !names.empty?
  puts "Overall, we have #{pluralize_students(names.count)}"
  end
end

#nothing happens until we call the methods
interactive_menu
