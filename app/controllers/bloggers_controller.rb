class BloggersController < ApplicationController
    def index
        @bloggers = Blogger.all
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.create(params_check)
        if @blogger.valid?
            redirect_to blogger_path(@blogger)
        else
            render :new
        end
    end

    def show
        @blogger = Blogger.find(params[:id])
    end

    def edit
        @blogger = Blogger.find(params[:id])
    end

    def update
        @blogger = Blogger.find(params[:id])
        @blogger.update(params_check)
        if @blogger.valid?
            redirect_to blogger_path(@blogger)
        else
            render :edit
        end
    end

    def destroy
        Blogger.destroy(params[:id])
        redirect_to bloggers_path
    end

    private

    def params_check
        params.require(:blogger).permit(:name,:bio,:age)
    end
end