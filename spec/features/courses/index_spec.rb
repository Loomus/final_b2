require 'rails_helper'

RSpec.describe 'Course Index Page' do
  describe 'As a user, when I visit a course index page' do
    it "I see each course in the system including the name and each student in the course listed in order from highest grade to lowest grade" do
      @student_1 = Student.create!(name: "Sally")
      @student_2 = Student.create!(name: "Sophie")
      @course_1 = Course.create!(name: "Algebra")
      @course_2 = Course.create!(name: "Chemistry")
      @course_3 = Course.create!(name: "World History")
      @sc_1 = @course_1.student_courses.create!(grade: 3.2, student: @student_1)
      @sc_2 = @course_1.student_courses.create!(grade: 2.2, student: @student_2)
      @sc_3 = @course_2.student_courses.create!(grade: 2.8, student: @student_1)
      @sc_4 = @course_2.student_courses.create!(grade: 3.0, student: @student_2)
      @sc_5 = @course_3.student_courses.create!(grade: 2.6, student: @student_1)
      @sc_6 = @course_3.student_courses.create!(grade: 3.4, student: @student_2)

      visit courses_path

      expect(page).to have_content("#{@course_1.name}")
      expect(page).to have_content("#{@course_2.name}")
      expect(page).to have_content("#{@course_3.name}")
    end
  end
end
