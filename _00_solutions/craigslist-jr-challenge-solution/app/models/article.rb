class Article < ActiveRecord::Base
  belongs_to :category

  before_save :set_edit_key, if: :check_edit_key?
  validates :edit_key, uniqueness: true

  private
  def set_edit_key
    random_key = SecureRandom.hex(4)
    self.edit_key = "#{random_key}"
  end

  def check_edit_key?
    if edit_key == nil
      true
    else
      false
    end
  end
  
end