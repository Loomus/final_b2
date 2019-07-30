require 'rails_helper'

RSpec.describe 'Course Show Page' do
  describe 'As a user, when I visit a course show page' do
    it "I see each course name and all the students in that course and their grade from highest to lowest" do
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

      visit course_path(@course_1.id)

      expect(page).to have_content("#{@course_1.name}")
      expect(page).to have_content("#{@student_1.name}")
      expect(page).to have_content("#{@student_2.name}")
    end

    it "I see a button 'unenroll' next to each students name, when I click it I am redirected to that student's show page where I do not see the course listed" do
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

      visit course_path(@course_1.id)
      expect(page).to have_link('Unenroll')

      within "#student-#{@student_1.id}" do
        click_link 'Unenroll'
      end

      visit student_path(@student_1.id)
      expect(page).to_not have_content(@course_1.name)
    end
  end
end
