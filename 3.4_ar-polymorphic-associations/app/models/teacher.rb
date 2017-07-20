class Teacher < Person
  # Remember to create a migration!
  # has_many :students

  has_many :student_teachers, :foreign_key => :teacher_id
  has_many :students, :through => :student_teachers


  validates :given_name, :surname, :email, :phone, {presence: true}
  validates :email, {uniqueness: true}
end
