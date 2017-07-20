class Student < Person
  # Remember to create a migration!
  # belongs_to :teacher
  has_many :student_teachers, :foreign_key => :student_id
  has_many :teachers, :through => :student_teachers

  validates :given_name, :surname, :phone, :birthday, { presence: true }

  # Getter
  def full_name
    [given_name, surname].join(' ')
  end

  # Setter
  def full_name=(name)
    split = name.split(' ', 2)
    self.given_name = split.first
    self.surname = split.last
  end

end
