def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name form the user
    name = gets.chomp
  end
  # return the array of students
  students
end


def print_header
  puts "The Students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = students.length
  while count <= students.length
    puts students
    count += 1
  end


  # students.each_with_index do |student, index|
  #   if student[:name].length < 12
  #   puts "#{index + 1}.#{student[:name]},(#{student[:cohort]} cohort)"
  #   end
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
