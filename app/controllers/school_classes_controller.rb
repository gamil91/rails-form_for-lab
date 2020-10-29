class SchoolClassesController < ApplicationController

    before_action :find_class, only:[:show, :edit, :update]

    def index
        @classes = SchoolClass.all
    end

    def show
        
    end

    def new
        @class = SchoolClass.new
    end

    def create
        @class = SchoolClass.create(school_params(:title, :room_number))
        redirect_to school_class_path(@class)
    end

    def edit
    end

    def update
        @class.update(school_params(:title, :room_number))
        redirect_to school_class_path(@class)
    end

    private

    def find_class
        @class = SchoolClass.find(params[:id])
    end

    def school_params(*args)
        params.require(:school_class).permit(*args)
    end

end