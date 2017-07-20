class Student < ApplicationRecord
  # Remember to create a migration!

  validates :first_name, :last_name, :phone, :birthday, { :presence => true }

  # Getter
  def full_name
    [first_name, last_name].join(' ')
  end

  # Setter
  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end

end
