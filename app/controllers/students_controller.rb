class StudentsController < ApplicationController

before_action :find_student, only:[:show, :edit, :update]

    def index
        @students = Student.all
    end

    def show
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.create(student_params(:first_name, :last_name))
        redirect_to student_path(@student)
    end

    def edit
    end

    def update
        @student.update(student_params(:first_name, :last_name))
        redirect_to student_path(@student)
    end

    private

    def find_student
        @student = Student.find(params[:id])
    end

    def student_params(*args)
        params.require(:student).permit(*args)
    end

end