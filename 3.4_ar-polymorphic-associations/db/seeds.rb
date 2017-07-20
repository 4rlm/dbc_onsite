require 'faker'
# require 'pry'

def generate_dob
  year = rand(1945..2000)
  month = rand(1..12)
  day = rand(1..30)
  dob = "#{year}-#{month}-#{day}"
end

def seed_teachers
  given_name = Faker::Name.unique.first_name
  surname = Faker::Name.unique.last_name
  email = Faker::Internet.unique.email
  phone = Faker::PhoneNumber.unique.phone_number
  birthday = generate_dob

  Teacher.find_or_create_by(given_name: given_name, surname: surname, email: email, phone: phone)

  teacher = Teacher.all.last

  # same way to add records to join table (A is better since I'm leveraging my own interface of associations vs directly inserting into join table in B)
  
  # Option A
  # teacher.students << Student.all.last
  # teacher.save

  # Option B
  # StudentTeacher.create(student_id: Student.all.last.id, teacher_id: Teacher.all.last.id )

  puts "\n\nSeeded new Teacher!\n\n"
end

def seed_students
  given_name = Faker::Name.unique.first_name
  surname = Faker::Name.unique.last_name
  email = Faker::Internet.unique.email
  phone = Faker::PhoneNumber.unique.phone_number
  birthday = generate_dob

  Student.find_or_create_by(given_name: given_name, surname: surname, phone: phone, birthday: birthday)
  puts "\n\nSeeded new Student!\n\n"
end

5.times { seed_teachers }
50.times { seed_students }
