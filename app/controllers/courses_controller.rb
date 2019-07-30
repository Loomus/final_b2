class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def unenroll
    course = Course.find(params[:course_id])
    student = Student.find(params[:id])
    student.drop_class
    redirect_to "/student/#{student.id}"
  end
end
