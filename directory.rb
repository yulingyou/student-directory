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

students = input_students
#nothing happens until we call the methods
print_header(students)
print(students)
print_footer(students)
