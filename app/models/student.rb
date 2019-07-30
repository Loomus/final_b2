class Student < ApplicationRecord
  validates_presence_of :name

  has_many :student_courses
  has_many :courses, through: :student_courses

  def drop_class
    # binding.pry
    # self.courses(:id)
    # courses.first.remove
    courses.delete(Course.find[1])
  end
end
