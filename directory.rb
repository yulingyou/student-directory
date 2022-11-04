def input_students
  puts "Please enter the names, cohort, and the height of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  cohort = gets.chomp.to_sym
  cohort = "January" if cohort.empty?
  height = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort, height: height}
    puts "Now we have #{students.count} students"
    #get another name form the user
    name = gets.chomp
    cohort = gets.chomp.to_sym
    cohort = "January" if cohort.empty?
    height = gets.chomp
  end
  # return the array of students
  students
end


def print_header
  puts "The Students of Villains Academy"
  puts "-------------".center(20,'+')
end

def print(students)
  cohorts = students.map do |student|
    student[:cohort]
  end
  cohorts.uniq.each do |cohort|
    puts "#{cohort} cohort"
    students.each do |student|
    puts student[:name] if student[:cohort] == cohort
    end
  end
  # students.each_with_index do |student, index|
  #   if student[:name].length < 12
  #   puts "#{index + 1}.#{student[:name]},(#{student[:cohort]} cohort, height: #{student[:height]})"
    # end
  # end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
