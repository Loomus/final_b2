require 'rails_helper'

RSpec.describe 'Student Show Page' do
  describe 'As a user, when I visit a student show page' do
    it "I see: the student's name, the name of each course the student is enrolled in, the student's greade for each course" do
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

      visit student_path(@student_1.id)

      expect(page).to have_content("Name: #{@student_1.name}")
      expect(page).to have_content("#{@course_1.name}")
      expect(page).to have_content("#{@course_2.name}")
      expect(page).to have_content("#{@course_3.name}")
      expect(page).to have_content("#{@sc_1.grade}")
      expect(page).to have_content("#{@sc_3.grade}")
      expect(page).to have_content("#{@sc_5.grade}")
    end
  end
end
